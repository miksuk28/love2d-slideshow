function love.load()
	love.window.setFullscreen(true, "desktop")

	w = love.graphics.getWidth()
	h = love.graphics.getHeight()

	image = love.graphics.newImage("4.png")
end

function love.update(dt)
	img_w = image:getWidth()
	img_h = image:getHeight()
	sx = w / img_w
	sy = h / img_h
	ratio_x = sx * img_w
	ratio_y = sy * img_h
end

function love.draw()
	if img_w > img_h then
		love.graphics.draw(image, 0, 0, 0, math.min(sx, sy))
	elseif img_w < img_h then
		love.graphics.draw(image, (w/2) - (ratio_x / 2), 0, 0, math.min(sx, sy))
	end
end

function love.keypressed(k)
	if k == "escape" then
		love.event.quit()
	end
end