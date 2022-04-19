local gfx <const> = playdate.graphics
local pd <const> = playdate

class('Turtle').extends(gfx.sprite)

function Turtle:init()
  Turtle.super.init(self)
  self.moveSpeed = 5
  self.startingX = 200
  self.startingY = 225
  
  self:moveTo(self.startingX, self.startingY)
  local turtleImage = gfx.image.new(15 * 2, 15 * 2)
  gfx.pushContext(turtleImage)
      gfx.fillCircleAtPoint(15, 15, 15)
  gfx.popContext()

  self:setImage(turtleImage)
  self:setCollideRect(0, 0, self:getSize())

end

function Turtle:update()
  Turtle.super.update(self)

  if pd.buttonIsPressed(pd.kButtonLeft) then
    self:moveBy(-self.moveSpeed, 0)
  elseif pd.buttonIsPressed(pd.kButtonRight) then
    self:moveBy(self.moveSpeed, 0)
  elseif pd.buttonIsPressed(pd.kButtonUp) then
    self:moveBy(0, -self.moveSpeed)
  elseif pd.buttonIsPressed(pd.kButtonDown) then
    self:moveBy(0, self.moveSpeed)
  end

  local collisions = self:overlappingSprites()
  if #collisions >= 1 then
      self:moveTo(self.startingX, self.startingY)
  end
end