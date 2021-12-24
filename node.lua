local object = require("moonengine.object")
local log = require("moonengine.log")

local node = object:extend()

function node:new(name)
    self.name = name or "node"
    self.parent = nil
    self.children = {}

    log.info("Created node: " .. self.name)
end

function node:add_child(child)
    assert(child.is, "child is not a valid class")
    assert(child:is(node), "child is not or does not inherit from node")

    child.parent = self
    table.insert(self.children, child)

    if child.init then
        local success, result = pcall(child.init, child)
        if not success then
            log.error(("Failed to initialize node %s: %s"):format(child.name, result or "unknown error"))
        end
    end

    log.info("Added child " .. child.name .. " to node " .. self.name)
    return child
end

return node
