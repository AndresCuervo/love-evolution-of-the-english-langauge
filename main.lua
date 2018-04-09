suit = require 'suit'

-- time_periods = [
-- 'Proto-Sinatic',
-- 'Phoenician',
-- 'Ancient Greek',
-- 'Ancient Latin',
-- 'Roman',
-- 'Modern English'
-- ]


function love.load()
    img = love.graphics.newImage('alphabets.jpg')

    xOffset =  400
    yCharacterOffset = 110

    slider = {value = 1, min = 0, max = 2}
    rectangleHeight = {value = 40, min = 0, max = 100}
    rectangleWidth  = {value = 40, min = 0, max = 100}

    -- Difference between each is roughly 100 pixels?

    love.window.setMode( img:getWidth() * 1.5, img:getHeight() )
    love.keyboard.setKeyRepeat( true )
    love.graphics.setBackgroundColor(255, 0, 255)
end

function love.draw()
    local x, y = love.mouse.getPosition() -- get the position of the mouse

    love.graphics.setColor( 0.1, 0.1, 0.1)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

    love.graphics.reset()
    love.graphics.draw(img, xOffset, 0)

    love.graphics.setColor( 1.0, 0, 0, 0.4)
    love.graphics.rectangle("fill", x - rectangleWidth.value * 0.5, y - rectangleHeight.value * 0.5, rectangleWidth.value,  rectangleHeight.value)

    love.graphics.reset()
    -- new_quad = love.graphics.newQuad(x - xOffset, y, rectangleWidth.value, rectangleHeight.value, img:getDimensions())
    new_quad = love.graphics.newQuad(x - rectangleWidth.value * 0.5 - xOffset, (y - rectangleHeight.value * 0.5 + yCharacterOffset) % love.graphics.getHeight(), rectangleWidth.value, rectangleHeight.value, img:getDimensions())
    -- love.graphics.rectangle("fill", , , rectangleWidth.value,  rectangleHeight.value)
    love.graphics.draw(img, new_quad, 10, 50)

    love.graphics.print(x .. ", " .. y, x + rectangleWidth.value * 0.5, y - rectangleHeight.value * 0.5)

    suit.draw()
end



local show_message = false
local input = {text = ""}

function love.update(dt)
    suit.Input(input, 100,100,200,30)
    suit.Label("Input text: "..input.text, {align="left"}, 100,150,200,30)

    -- Put a button on the screen. If hit, show a message.
    if suit.Button("Hello, World!", 100, 250, 300,30).hit then
        show_message = not show_message
    end

    -- if the button was pressed at least one time, but a label below
    if show_message then
        suit.Label("How are you today?", 100,300, 300,30)
    end

    suit.Slider(rectangleHeight, 100,400, 200,20)
    suit.Label(tostring(rectangleHeight.value), 300, 400, 200,20)
end

-- forward keyboard events
function love.textinput(t)
    suit.textinput(t)
end

function love.keypressed(key)
    suit.keypressed(key)
end
