local img
local frames = {}
local pos = {x = 100, y = 100}

local currentFrame = 1
local timer = 0

function love.load()
  img = love.graphics.newImage( 'images/man.png' )
  local hframes, width, height = 6, img:getDimensions()
  w = width / hframes
  frames[1] = love.graphics.newQuad( 0, 0, w, 32, img:getDimensions())
  frames[2] = love.graphics.newQuad(w, 0, w, 32, img:getDimensions())
  frames[3] = love.graphics.newQuad(2 * w, 0, w, 32, img:getDimensions())
  love.graphics.setBackgroundColor(0.5, 0.5, 0.02)
end

function love.draw()
  love.graphics.draw(img, frames[currentFrame], pos.x, pos.y, 0, 2, 2)
  love.graphics.print(timer)
end


function love.update(dt)

  timer = timer + dt
  if timer > 0.1 then
    if currentFrame > 2 then
      currentFrame = 1
    else currentFrame = currentFrame + 1 end
    timer = 0
  end

  if love.keyboard.isDown('a') then pos.x = pos.x - 4 end
  if love.keyboard.isDown('d') then pos.x = pos.x + 4 end
  if love.keyboard.isDown('w') then pos.y = pos.y - 4 end
  if love.keyboard.isDown('s') then pos.y = pos.y + 4 end

end