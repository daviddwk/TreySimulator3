function create(x, y, width, height)
	sizeMultiplier = getGlobalValue("sizeMultiplier")
	entity = getNewEntity("baseLuaEntity")
	setEntityLabel(entity, "object")
	setEntityX(entity, (rand() % width) + x + 1)
	setEntityY(entity, (rand() % height) + y + 1)
  number = randPaul() % 7
  if number == 0 then
    texture = "poster1"
  elseif number == 1 then
    texture = "poster2"
  elseif number == 2 then
    texture = "poster3"
  elseif number == 3 then
    texture = "poster4"
  elseif number == 4 then
    texture = "poster5"
  elseif number == 5 then
    texture = "poster6"
  else
    texture = "poster7"
  end
  startEntityAnimation(entity, texture)
  setEntityRenderWidth(entity, getAnimationWidth(texture))
	setEntityRenderHeight(entity, getAnimationHeight(texture))
	addEntityToGroup(entity, "Objectss")
	addEntityToRenderGroup(entity, "300Objects")
	return entity
end
