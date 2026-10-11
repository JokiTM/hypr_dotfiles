#!/bin/env python
import pystray
import time
import threading
import os
from PIL import Image, ImageDraw, ImageFont
import logging
import json
from systemd.journal import JournalHandler
import subprocess

log = logging.getLogger("demo")
log.addHandler(JournalHandler())
log.setLevel(logging.INFO)


def notify_send(msg):
    subprocess.run(["notify-send", msg])


def draw_icon(color):

    size = (64, 64)
    text = "󰥠"

    img = Image.new("RGBA", size, (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    font = ImageFont.truetype("/usr/share/fonts/TTF/JetBrainsMonoNLNerdFont-Regular.ttf" , 55)
    bbox = draw.textbbox((0, 0), text, font=font)
    text_width = bbox[2] - bbox[0] 
    text_height = bbox[3] - bbox[1]
    position = ((size[0] - text_width) / 2, (size[1] - text_height) / 2 - 15)

    draw.text(position, text, fill=color, font=font)
    return img


def update_icon(color):
    icon.icon = draw_icon(color)


def sync_music_worker():
    mount_sansa()
    update_icon("red")
    command = "/home/mathis/.local/bin/sansa/syncMusic.sh"
    if os.system(command) == 0:
        update_icon("white")
        return True
    else:
        os.system("notify-send Sansa Error")


def sync_music():
    threading.Thread(target=sync_music_worker, daemon=True).start()


def show_changes():
    mount_sansa()
    result = subprocess.run(
        ["foot", "/home/mathis/.local/bin/sansa/dispatchfoot.sh"]
    )
    if result.returncode == 67:
        sync_music()


#def scrobble_worker():
#    mount_sansa()
#    command = "/home/mathis/.local/bin/sansa/scrobble.sh"
#    if os.system(command) == 0:
#
#        return True
#    else:
#        os.system("notify-send scrobble Error")


def scrobble_worker():
    mount_sansa()

    command = [
        "/home/mathis/.local/bin/sansa/scrobble.sh"
    ]

    proc = subprocess.run(
        command,
        capture_output=True,
        text=True
    )

    # Logs kommen über stderr
    #if proc.stderr:
        #print(proc.stderr, file=sys.stderr)

    # JSON aus stdout lesen
    if proc.returncode == 2:
        return False
    try:
        result = json.loads(proc.stdout)
        scrobbles = result.get("scrobbles", 0)
        errors = result.get("errors", 0)
    except json.JSONDecodeError:
        notify_send("Scrobble: Ungültige Ausgabe")
        return False

    # Exit-Code auswerten
    if proc.returncode == 0:
        os.system(f'notify-send "Scrobbler" "Scrobbled {scrobbles} tracks"')
        return True

    os.system(f"Scrobble Warnung: {scrobbles} ok, {errors} Fehler")
    return False


def scrobble():
    mount_sansa();
    threading.Thread(target=scrobble_worker, daemon=True).start()


def boxenstop():
    mount_sansa()
    scrobble()
    show_changes()


def mount_sansa():
    command = "/home/mathis/.local/bin/sansa/mountsansa.sh"
    if os.system(command) == 0:
        return True
    else:
        os.system('notify-send "Sansa Error" "Failed mounting sansa"')


def umount_sansa():
    command = "/home/mathis/.local/bin/sansa/umountsansa.sh"
    if os.system(command) == 0:
        return True
    else:
        os.system('notify-send "Sansa Error" "Failed umounting sansa"')


def kill():
    command = "systemctl --user stop sansa"
    if os.system(command) == 0:
        return True
    else:
        os.system('notify-send "Sansa Error" "Failed to stop sansa.service"')


def updater():
    time.sleep(6)
    command = 'lsblk -f | grep "5F4A-C7AD" 2>&1 > /dev/null'
    while True:
        if not os.system(command) == 0:
            log.info("Sansa disconnected. Stopping Tray...")
            kill()
        time.sleep(2)


icon = pystray.Icon(
    name="Battery level",
    title="Battery devel",
    icon=(draw_icon("white")),
    menu=pystray.Menu(
        pystray.MenuItem("󰥠  Sansa Clip+", None, enabled=False),
        pystray.Menu.SEPARATOR,
        pystray.MenuItem("Mount", mount_sansa),
        pystray.MenuItem("Sync Music", sync_music),
        pystray.MenuItem("Show Changes", show_changes),
        pystray.MenuItem("Scrobble", scrobble),
        pystray.MenuItem("Boxenstop", boxenstop),
        #pystray.MenuItem("Kill Tray", kill),
    ),
)
thread = threading.Thread(target=updater, daemon=True)
thread.start()
icon.run()
