import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "turtle"
import "car"
import "lToRCar"

local gfx <const> = playdate.graphics
local pd <const> = playdate

local function initialize() 
    local turtleSprite = Turtle()
    turtleSprite:add()

    Car(430, 60, 5, 30)
    Car(200, 60, 5, 30)

    LToRCar(-30, 100, 3, 40)
    LToRCar(100, 100, 3, 40)
    LToRCar(240, 100, 3, 40)

    Car(430, 140, 7, 20)
    Car(150, 140, 7, 20)
    Car(300, 140, 7, 30)

    LToRCar(-30, 180, 5, 50)
    LToRCar(200, 180, 5, 50)
end

initialize()

function playdate.update() 
    gfx.sprite.update()
    pd.timer.updateTimers()
end