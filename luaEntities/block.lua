function create(x, y, width, height, texture, collides)
	entity = getNewEntity("baseLuaEntity")
	setEntityLabel(entity, "block")
	setEntityX(entity, x)
	setEntityY(entity, y)
	setEntityRenderHeight(entity, height)
	setEntityRenderWidth(entity, width)
	startEntityAnimation(entity, texture)
	if collides == true then
		removeEntityFunction(entity, "render")
		addEntityCollisionBox(entity, 0, 0, width, height)
		addEntityToGroup(entity, "CollisionBlocks")
	else
		addEntityToGroup(entity, "TextureBlocks")
		addEntityToRenderGroup(entity, "210TextureBlocks")
	end
	return entity
end
