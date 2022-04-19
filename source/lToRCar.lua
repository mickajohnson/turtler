local gfx <const> = playdate.graphics
local pd <const> = playdate

import "car"

class('LToRCar').extends(Car)

function LToRCar:init(x, y, speed, width)
  LToRCar.super.init(self, x, y, speed, width)
end

function LToRCar:update()
  self:moveBy(self.moveSpeed, 0)

  local x, y = self:getPosition()
  if x > 430 then
    self:moveTo(-30, self.startingY)
  end
end