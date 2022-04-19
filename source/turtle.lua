local gfx <const> = playdate.graphics
local pd <const> = playdate

import "car"
import "prize"

class('Turtle').extends(gfx.sprite)

function Turtle:init()
  Turtle.super.init(self)
  self.moveSpeed = 5
  self.startingX = 200
  self.startingY = 225
  self.lives = 5
  self.score = 0
  
  self:moveTo(self.startingX, self.startingY)
  local turtleImage = gfx.image.new('images/player')


  self:setImage(turtleImage)
  self:setCollideRect(0, 0, self:getSize())

end

function Turtle:hitByCar()
  self.lives -= 1
  if self.lives == 0 then
    -- self:remove()
    self:moveTo(600, 600)
  else
    self:moveTo(self.startingX, self.startingY)
  end
end

function Turtle:getPrize()
  self.score += 1
  if self.score == 3 then
    -- self:remove()
    self:moveTo(600, 600)
  else
    self:moveTo(self.startingX, self.startingY)
  end
end

function Turtle:update()
  Turtle.super.update(self)

  if self.lives == 0 or self.score == 3 then
    if playdate.buttonJustPressed(playdate.kButtonA) then
      self.lives = 5
      self.score = 0
  
      self:moveTo(self.startingX, self.startingY)
      -- self:add()
    end
  else

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
      for _, collisionSprite in pairs(collisions) do  
        if collisionSprite:isa(Prize) then
          self:getPrize()
          collisionSprite:remove()
        elseif collisionSprite:isa(Car) then
          self:hitByCar()
        end
      end
    end
  end
end
