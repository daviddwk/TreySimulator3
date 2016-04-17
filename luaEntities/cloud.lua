function create()
	sizeMultiplier = getGlobalValue("sizeMultiplier")
	entity = getNewEntity("baseLuaEntity")
	setEntityLabel(entity, "cloud")
	setEntityX(entity, -300 * sizeMultiplier)
	setEntityY(entity, (rand() % 200) * sizeMultiplier )
  setEntityDeltaX(entity, (rand() % 190) + 10)
  setEntityRenderWidth(entity, ((rand() % 50) + 150) * sizeMultiplier)
	setEntityRenderHeight(entity, ((rand() % 30) + 90) * sizeMultiplier)
	addEntityFunction(entity, "update", "void")
  number = randPaul() % 3
  if number == 0 then
    startEntityAnimation(entity, "cloud1")
  elseif number == 1 then
    startEntityAnimation(entity, "cloud2")
  else
	   startEntityAnimation(entity, "cloud3")
  end
	addEntityToGroup(entity, "Clouds")
	addEntityToRenderGroup(entity, "100Clouds")
  return entity
end

function update(entity)
	if getEntityX(entity) > (2255 + 300) * 4 then
		deleteEntity(entity)
	end
end
