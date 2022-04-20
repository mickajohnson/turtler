import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "turtle"
import "car"
import "lToRCar"
import "prize"
import "game"
import "wall"

-- TODO
-- Add reset method to game object
-- redraw coin after die
-- player cannot exceed edge
-- tilemap

TURTLE_GROUP = 1
WALL_GROUP = 2
CAR_GROUP = 3
PRIZE_GROUP = 4

local gfx <const> = playdate.graphics
local pd <const> = playdate

local game = nil

local function initialize() 
    game = Game()

    local backgroundImage = gfx.image.new("images/background")
    gfx.sprite.setBackgroundDrawingCallback(
        function(x, y, width, height)
            gfx.setClipRect(x, y, width, height)
            backgroundImage:draw(0, 0)
            gfx.clearClipRect()
        end
    )
end

initialize()

function playdate.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
    game:update()
end