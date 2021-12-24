local moonengine = {}
local log = require("moonengine.log")

local rootnode = require("moonengine.node")("root")

local function process_nodes(node)
    if node.update then
        local success, result = pcall(node.update, node)
        if not success then
            log.error(("Error while updating node %s: %s"):format(node.name, result or "unknown error"))
        end
    end

    for _, child in ipairs(node.children) do
        process_nodes(child)
    end
end

function moonengine.get_root()
    return rootnode
end

function moonengine.update()
    process_nodes(rootnode)
end

return moonengine