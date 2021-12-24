local moonengine = {}
local log = require("moonengine.log")

local rootnode = require("moonengine.node")("root")

local function traverse_nodes(node, handler)
    handler(node)

    for _, child in ipairs(node.children) do
        traverse_nodes(child, handler)
    end
end

function moonengine.get_root()
    return rootnode
end

function moonengine.update()
    traverse_nodes(rootnode, function(node)
        if node.update then
            local success, result = pcall(node.update, node)
            if not success then
                log.error(result or "unknown error")
            end
        end
    end)
end

return moonengine