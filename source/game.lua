local gfx <const> = playdate.graphics
local pd <const> = playdate

class('Game').extends()

function Game:init(x, y, speed, width)
  self.turtleSprite = Turtle(self)
  self.prizes = nil

  self:startGame()
end

function Game:startGame()
  self.lives = 5
  self.score = 0

  self.turtleSprite:resetPosition()
  self.turtleSprite:add()

  Car(430, 60, 5, 30)
  Car(200, 60, 5, 30)

  LToRCar(-30, 100, 3, 40)
  LToRCar(100, 100, 3, 40)
  LToRCar(240, 100, 3, 40)

  Car(430, 140, 7, 20)
  Car(250, 140, 7, 20)
  Car(300, 140, 7, 30)

  LToRCar(-30, 180, 5, 50)
  LToRCar(200, 180, 5, 50)

  Prize(150, 20)
  Prize(200, 20)
  Prize(250, 20)

  local leftWall = Wall(-8, 0, 10, 250)
  local rightWall = Wall(398, 0, 10, 250)
  local topWall = Wall(0, -8, 400, 10)
  local bottomWall = Wall(0, 238, 400, 10)
end

function Game:loseLife()
  self.lives -= 1
end

function Game:gainPrize()
  self.score += 1
end

function Game:gameOver()
  gfx.sprite.removeAll()
end

function Game:update()
  if self.lives == 0 or self.score == 3 then
    if playdate.buttonJustPressed(playdate.kButtonA) then
      self:startGame()
    end
  end

  if self.score == 3 then
    gfx.drawText("You Win!", 320, 5)
  elseif self.lives > 0 then
    gfx.drawText("Lives: " .. self.lives, 320, 5)
  else
    gfx.drawText("Game Over", 320, 5)
  end
end