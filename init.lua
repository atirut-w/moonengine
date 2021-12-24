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
            local success, result = pcall(node.update, node, love.timer.getDelta())
            if not success then
                log.error(result or "unknown error")
            end
        end
    end)
end

function moonengine.draw()
    traverse_nodes(rootnode, function(node)
        if node.draw then
            local success, result = pcall(node.draw, node)
            if not success then
                log.error(result or "unknown error")
            end
        end
    end)
end

return moonengine