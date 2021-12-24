local object = require("moonengine.object")
local vector2 = object:extend()

function vector2:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

return vector2