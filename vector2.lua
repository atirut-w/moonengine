local object = require("moonengine.object")
local vector2 = object:extend()

function vector2:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

function vector2:length()
    return math.sqrt(self.x * self.x + self.y * self.y)
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

function vector2:__lt(other)
    return self:length() < other:length()
end

function vector2:__le(other)
    return self:length() <= other:length()
end

function vector2:normalize()
    local length = self:length()
    if length == 0 then
        return vector2()
    end
    return vector2(self.x / length, self.y / length)
end

return vector2