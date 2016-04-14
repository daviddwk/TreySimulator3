function create(x, y)
	entity = getNewEntity("baseLuaEntity")
	startEntityAnimation(entity, "basketBallHoop")
	setEntityLabel(entity, "basketBallHoop")
	setEntityX(entity, x + 1)
  setEntityY(entity, y + 1)
  addEntityCollisionBox(entity, 33, 54, 1, 2) --left hoop
  addEntityCollisionBox(entity, 53, 54, 1, 2) --right hoop
  addEntityCollisionBox(entity, 34, 54, 19, 2) --in hoop
  setEntityRenderWidth(entity, getAnimationWidth("basketBallHoop"))
	setEntityRenderHeight(entity, getAnimationHeight("basketBallHoop"))
	addEntityToGroup(entity, "basketBallHoop")
	addEntityToRenderGroup(entity, "390basketBallHoop")
	return entity
end
