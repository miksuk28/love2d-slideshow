function love.load()
	love.window.setFullscreen(true, "desktop")

	w = love.graphics.getWidth()
	h = love.graphics.getHeight()

	dir = "memes"
	files = love.filesystem.getDirectoryItems(dir)
	image = love.graphics.newImage("/" .. dir .. "/" .. files[love.math.random(#files)])
end

function love.update(dt)
	img_w = image:getWidth()
	img_h = image:getHeight()
	sx = w / img_w
	sy = h / img_h
	ratio = sy * img_h
end

function love.draw()
	love.graphics.draw(image, (w/2) - (ratio / 2), 0, 0, math.min(sx, sy))
end

function love.keypressed(k)
	if k == "escape" then
		love.event.quit()
	end
end