-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
 hl.on("hyprland.start", function ()
   hl.exec_cmd("/usr/lib64/hyprpolkitagent/hyprpolkitagent")
   hl.exec_cmd("runsvdir ~/service")
   hl.exec_cmd("sway-audio-idle-inhibit")
   hl.exec_cmd("/usr/lib/xdg-desktop-portal-termfilechooser -r")
   hl.exec_cmd("wl-clip-persist --clipboard regular")
   hl.exec_cmd("hypridle")
   hl.exec_cmd("hyprpaper")
   hl.exec_cmd("hyprsunset")
   hl.exec_cmd("sleep 2 && wal -R && razer-cli -a")
 end)
