-- Monitor configuration

local vars = require("config.variables")

hl.monitor({
    output = vars.monitor,
    mode = vars.resolution,
    position = "auto",
    scale = vars.scale,
})
