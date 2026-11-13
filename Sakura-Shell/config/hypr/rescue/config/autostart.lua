-- Startup applications

hl.on("hyprland.start", function()
    -- Wallpaper daemon
    hl.exec_cmd("awww-daemon")

    -- Notification daemon
    hl.exec_cmd("mako")

    -- Audio visualizer background
    hl.exec_cmd("cava-bg")
end)
