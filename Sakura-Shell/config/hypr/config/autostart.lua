-- Startup applications

hl.on("hyprland.start", function()
    -- Wallpaper daemon
    hl.exec_cmd("awww-daemon")

    -- Notification daemon
    hl.exec_cmd("mako")

    -- Audio visualizer background
    hl.exec_cmd("cava-bg on")

    -- That shit of idk idk bro pls kill me
    hl.exec_cmd("hyprpm enable hyprexpo")
    
    -- Waybar, lo de arribbita asi bien pro y sigma
    hl.exec_cmd("waybar")
end)
