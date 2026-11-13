-- Keybinds
-- ~/.config/hypr/config/keybinds.lua
-- Native Hyprland Lua API: 0.56.x

local vars = require("config.variables")

local mainMod = vars.mainMod
local terminal = vars.terminal
local menu = vars.menu
local fileManager = vars.fileManager
local browser = vars.browser

-- Applications
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + SPACE",
    hl.dsp.exec_cmd(menu .. " --show drun --style ~/.config/wofi/style.css"))

hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(browser))

-- Sakura Wi-Fi
hl.bind(mainMod .. " + N",
    hl.dsp.exec_cmd("/home/penguinluxior/Descargas/sakura-wifi/sakura-wifi"))

-- Wallpaper selector
hl.bind(mainMod .. " + W",
    hl.dsp.exec_cmd("wallpick"))

-- Window controls
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Window focus
hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "down" }))

-- Cycle through windows
hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next())

-- Vista libre
hl.bind("SUPER + TAB", function()
    hl.plugin.hyprexpo.expo("toggle")
end)

-- Move active window
hl.bind(mainMod .. " + SHIFT + LEFT",
    hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + RIGHT",
    hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + UP",
    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + DOWN",
    hl.dsp.window.move({ direction = "down" }))

-- Resize active window
hl.bind(mainMod .. " + CTRL + LEFT",
    hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + RIGHT",
    hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + UP",
    hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind(mainMod .. " + CTRL + DOWN",
    hl.dsp.window.resize({ x = 0, y = 50, relative = true }))

-- Workspaces 1-9
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,
        hl.dsp.focus({ workspace = i }))

    hl.bind(mainMod .. " + SHIFT + " .. i,
        hl.dsp.window.move({ workspace = i }))
end

-- Workspace 10
hl.bind(mainMod .. " + 0",
    hl.dsp.focus({ workspace = 10 }))

hl.bind(mainMod .. " + SHIFT + 0",
    hl.dsp.window.move({ workspace = 10 }))

-- Previous / next workspace
hl.bind(mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" }))

-- Mouse window controls
hl.bind(mainMod .. " + mouse:272",
    hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + mouse:273",
    hl.dsp.window.resize(), { mouse = true })

-- Configuration and session
hl.bind(mainMod .. " + SHIFT + R",
    hl.dsp.exec_cmd("hyprctl reload"))

hl.bind(mainMod .. " + SHIFT + M",
    hl.dsp.exec_cmd(
        "if command -v hyprshutdown >/dev/null 2>&1; then hyprshutdown; else hyprctl dispatch exit; fi"
    ))

hl.bind(mainMod .. " + L",
    hl.dsp.exec_cmd("loginctl lock-session"))

-- Screenshots
hl.bind("PRINT",
    hl.dsp.exec_cmd(
        "mkdir -p ~/Pictures && grim ~/Pictures/screenshot-$(date +%F_%H-%M-%S).png"
    ))

hl.bind("SHIFT + PRINT",
    hl.dsp.exec_cmd(
        "mkdir -p ~/Pictures && grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%F_%H-%M-%S).png"
    ))

-- Audio
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { repeating = true })

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { repeating = true })

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- Brightness
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set 5%+"),
    { repeating = true })

hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-"),
    { repeating = true })

-- Media playback
hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"))

hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"))

hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"))

-- TODO: SUPER + H
-- Hyprland has no native minimize dispatcher.

-- TODO: SUPER + ALT + arrow keys
-- Adjustable gaps.

-- TODO: SUPER + P
-- Pseudo mode is undecided.
