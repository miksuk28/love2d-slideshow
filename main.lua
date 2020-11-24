function love.load()
	love.window.setFullscreen(true, "desktop")

	w = love.graphics.getWidth()
	h = love.graphics.getHeight()

	dir = "memes"
	files = love.filesystem.getDirectoryItems(dir)
	image = love.graphics.newImage("/" .. dir .. "/" .. files[love.math.random(#files)])
	image = love.graphics.newImage("/testing/memes/2.jpg")
end

function love.update(dt)
	image = love.graphics.newImage("/" .. dir .. "/" .. files[love.math.random(#files)])
	love.timer.sleep(2)

	img_w = image:getWidth()
	img_h = image:getHeight()
	sx = w / img_w
	sy = h / img_h
	ratio_h = sy * img_h
	ratio_w = sy * img_w
end

function love.draw()
	love.graphics.draw(image, (w/2) - (ratio_w / 2), (h/2) - (ratio_h / 2), 0, math.min(sx, sy))
end

function love.keypressed(k)
	if k == "escape" then
		love.event.quit()
	end
end