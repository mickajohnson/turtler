local gfx <const> = playdate.graphics
local pd <const> = playdate

class('Prize').extends(gfx.sprite)

function Prize:init(x, y)
  Prize.super.init(self)
  
  local prizeImage = gfx.image.new('images/prize')
  self:setImage(prizeImage)
  self:moveTo(x, y)
  self:setCollideRect(0, 0, self:getSize())
  self:setGroups(PRIZE_GROUP)
  self:add()
end
