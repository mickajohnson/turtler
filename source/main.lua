import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "turtle"
import "car"
import "lToRCar"
import "prize"

-- TODO
-- redraw coin after die
-- tilemap
-- player cannot exceed edge

local gfx <const> = playdate.graphics
local pd <const> = playdate

local turtleSprite = nil

local function initialize() 
    turtleSprite = Turtle()
    turtleSprite:add()

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

    Prize(150, 10)
    Prize(200, 10)
    Prize(250, 10)
end

initialize()

function playdate.update() 
    gfx.sprite.update()
    pd.timer.updateTimers()

    if turtleSprite.score == 3 then
        gfx.drawText("You Win!", 320, 5)
    elseif turtleSprite.lives > 0 then
        gfx.drawText("Lives: " .. turtleSprite.lives, 320, 5)
    else
        gfx.drawText("Game Over", 320, 5)
    end

end