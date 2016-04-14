
function update()
--	drawAnimationToScreen("GreenSquare", 0, false, 0, 0, 30, 30)
	function forEach(entity)

		i = getEntityCollisionBoxCount(entity)
		while i > 0 do
			i = i - 1

			x, y, width, height = getEntityCollisionBox(entity, i)
			drawAnimationToScreen("greenSquare", 0, false, math.floor((x + getEntityX(entity)) - getScreenX()), math.floor((y + getEntityY(entity)) - getScreenY()), width, height)
		end
	end
	forEachEntity("forEach")
end
