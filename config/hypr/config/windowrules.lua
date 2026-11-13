-- Window rules

-- Prevent applications from maximizing unexpectedly.
hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

-- Fix XWayland dragging issues.
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Kitty: completely square, no colored border
hl.window_rule({
    name = "kitty-flat",
    match = {
        class = "kitty",
    },
    rounding = 0,
    border_size = 0,
})
