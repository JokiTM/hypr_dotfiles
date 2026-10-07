---------------------
---- KEYBINDINGS ----
---------------------

local helpers = require('conf.helpers')
local laptop = helpers.isSet("LAPTOP")

hl.config({
    binds = {
        hide_special_on_workspace_change = true,
    }
})

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + kp_enter", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { repeating = true })
hl.bind(mainMod .. "+ ALT + BACKSPACE", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("rong"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("pkill fuzzel || fuzzel"))
hl.bind("CONTROL + ALT + V", function() helpers.dispatchTerminalApp("wiremix") end)
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. "+ SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. "+ SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. "+ SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. "+ SHIFT + j", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. "+ SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. "+ SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. "+ SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. "+ SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. "+ TAB", hl.dsp.focus({ last = true }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i, follow = false}))
    hl.bind(mainMod .. " + SHIFT + CONTROL + " .. key,     hl.dsp.window.move({ workspace = i, follow = true}))
    if not laptop then
        local mon = (i < 6 and "DP-3" or "DP-1")
        hl.workspace_rule({ workspace = tostring(i), monitor = mon });
    end
end

hl.bind(mainMod .. " + M",         hl.dsp.workspace.toggle_special("music"))
hl.workspace_rule({ workspace = "special:music", on_created_empty = "foot -T rmpc zsh -c '~/.config/hypr/scripts/dispatch.sh rmpc'" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:music" }))

hl.bind(mainMod .. " + C",         hl.dsp.workspace.toggle_special("whatsapp"))
hl.workspace_rule({ workspace = "special:whatsapp", on_created_empty = "librewolf --new-window https://web.whatsapp.com" })
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.move({ workspace = "special:whatsapp" }))

hl.bind("CONTROL + SHIFT + ESCAPE", hl.dsp.workspace.toggle_special("sysmon"))
hl.workspace_rule({ workspace = "special:sysmon", on_created_empty = "foot -T rmpc zsh -c '~/.config/hypr/scripts/dispatch.sh btop'" })
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.move({ workspace = "special:sysmon" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + X", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
local lowerVol = hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
local higherVol = hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
if not laptop then
    lowerVol:set_enabled(false)
    higherVol:set_enabled(false)
end
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(mainMod .. " + mouse:276", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind(mainMod .. "+ SHIFT + COMMA",  hl.dsp.exec_cmd("rmpc volume -5"),   { locked = true })
hl.bind(mainMod .. "+ SHIFT + PERIOD",  hl.dsp.exec_cmd("rmpc volume +5"),   { locked = true })

hl.bind(mainMod .. "+ SHIFT + mouse_down",  hl.dsp.exec_cmd("rmpc volume -5"),   { locked = true })
hl.bind(mainMod .. "+ SHIFT + mouse_up",  hl.dsp.exec_cmd("rmpc volume +5"),   { locked = true })

local function screenshot(fullscreen)
    local dir = os.getenv("HOME") .. "/Pictures/Screenshots"

    local filename = os.date("%Y-%m-%d_%H-%M-%S") .. ".png"
    local path = dir .. "/" .. filename
    local notify = "&& notify-send -i " .. path .. " \"Saving screenshot " .. filename .. "\""
    if fullscreen then
        helpers.exec(string.format("grim %s && wl-copy -t image/png <%s %s", path, path, notify))
    else
        helpers.exec(string.format("pkill slurp || slurp | grim -g - %s && wl-copy -t image/png <%s %s", path, path, notify))
    end
end

hl.bind(mainMod .. " + SHIFT + S", function()
    screenshot(false)
end)

hl.bind("PRINT", function()
    screenshot(true)
end)
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd("pkill fuzzel || ~/.config/hypr/scripts/emoji.sh both"))
