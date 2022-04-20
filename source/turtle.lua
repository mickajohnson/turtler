local gfx <const> = playdate.graphics
local pd <const> = playdate

import "car"
import "prize"
import "wall"

class('Turtle').extends(gfx.sprite)

function Turtle:init(game)
  Turtle.super.init(self)
  self.moveSpeed = 5
  self.startingX = 200
  self.startingY = 220
  self.game = game
  
  local turtleImage = gfx.image.new('images/player')

  self:setImage(turtleImage)
  self:setCollideRect(0, 0, self:getSize())
  self:setGroups(TURTLE_GROUP)
  self:setCollidesWithGroups({WALL_GROUP, PRIZE_GROUP, CAR_GROUP})
end

function Turtle:resetPosition()
  self:moveTo(self.startingX, self.startingY)
end

function Turtle:hitByCar()
  self.game:loseLife()
  if self.game.lives == 0 then
    self.game:gameOver()
  else
    self:resetPosition()
  end
end

function Turtle:getPrize()
  self.game:gainPrize()
  if self.game.score == 3 then
    self.game:gameOver()
  else
    self:resetPosition()
  end
end

function Turtle:moveBy(x, y)
  local actualX, actualY = self:moveWithCollisions(self.x + x, self.y + y)
  -- self:moveTo(actualX, actualY)
end

function Turtle:update()
  Turtle.super.update(self)

  if self.game.lives ~= 0 and self.game.score ~= 3 then
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

function Turtle:collisionResponse(other)
  if other:isa(Wall) then
      return "slide"
  else
      return "overlap"
  end
end