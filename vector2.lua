local object = require("moonengine.object")
local vector2 = object:extend()

function vector2:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

function vector2:__add(other)
    return vector2(self.x + other.x, self.y + other.y)
end

function vector2:__sub(other)
    return vector2(self.x - other.x, self.y - other.y)
end

function vector2:__mul(other)
    return vector2(self.x * other, self.y * other)
end

function vector2:__div(other)
    return vector2(self.x / other, self.y / other)
end

function vector2:__eq(other)
    return self.x == other.x and self.y == other.y
end

return vector2