local gfx <const> = playdate.graphics
local pd <const> = playdate

class('Car').extends(gfx.sprite)

function Car:init(x, y, speed, width)
  Car.super.init(self)
  self.moveSpeed = speed
  self.startingX = x
  self.startingY = y
  
  self:moveTo(self.startingX, self.startingY)
  local carImage = gfx.image.new(width, 30)
  gfx.pushContext(carImage)
    gfx.fillRect(0, 0, width, 30)
  gfx.popContext()

  self:setImage(carImage)
  self:setCollideRect(0, 0, self:getSize())

  self:add()
end

function Car:update()
  Car.super.update(self)

  self:moveBy(-self.moveSpeed, 0)

  local x, y = self:getPosition()
  if x < -30 then
    self:moveTo(430, self.startingY)
  end
end