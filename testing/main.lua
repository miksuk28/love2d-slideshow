function love.load()
	love.window.setFullscreen(true, "desktop")

	w = love.graphics.getWidth()
	h = love.graphics.getHeight()
	--image = love.graphics.newImage("/memes/6.jpg")
	dir = "memes"
	files = love.filesystem.getDirectoryItems(dir)
	image = love.graphics.newImage("/" .. dir .. "/" .. files[love.math.random(#files)])
	--time between each image
	slide_time = 2
end

function love.update(dt)
	love.timer.sleep(slide_time)
	image = love.graphics.newImage("/" .. dir .. "/" .. files[love.math.random(#files)])

	img_w = image:getWidth()
	img_h = image:getHeight()
	sx = w / img_w
	sy = h / img_h
	ratio = sy * img_h
end

function love.draw()
	if img_w <= img_h then
		love.graphics.draw(image, (w/2) - (ratio_w / 2), 0, 0, math.min(sx, sy))
	elseif img_w > img_h then
		love.graphics.draw(image, 0, 0, 0, math.min(sx, sy))
	end
end

function love.keypressed(k)
	if k == "escape" then
		love.event.quit()
	end
end