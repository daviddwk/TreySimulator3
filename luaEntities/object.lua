function create(x, y, texture, fromBottom, foreground)
	sizeMultiplier = getGlobalValue("sizeMultiplier")
	entity = getNewEntity("baseLuaEntity")
	startEntityAnimation(entity, texture)
	setEntityLabel(entity, "object")
	setEntityX(entity, x + 1)
	if fromBottom then
		setEntityY(entity, (y - getAnimationHeight(texture)) + 1)
	else
		setEntityY(entity, y + 1)
	end
  setEntityRenderWidth(entity, getAnimationWidth(texture))
	setEntityRenderHeight(entity, getAnimationHeight(texture))
	addEntityToGroup(entity, "Objects")
  if foreground then
		addEntityToRenderGroup(entity, "500Objects")
  else
		addEntityToRenderGroup(entity, "300Objects")
  end
	return entity
end
