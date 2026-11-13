-- travis te amo
-- Workspace configuration

-- Workspace defaults

for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        default = true,
        persistent = true,
    })
end
