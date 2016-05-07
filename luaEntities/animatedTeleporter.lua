function create(x, y, destinationX, destinationY, texture, removeScreenLag)
	entity = getNewEntity("baseLuaEntity")
	setEntityLabel(entity, "animatedTeleporter")
	setEntityX(entity, x)
	setEntityY(entity, y - getAnimationHeight(texture) + 1)
  setEntityRenderWidth(entity, getAnimationWidth(texture))
  setEntityRenderHeight(entity, getAnimationHeight(texture))
  startEntityAnimation(entity, texture)
  addEntityCollisionBox(entity, 0, 0, getAnimationWidth(texture), getAnimationHeight(texture))
  addEntityValue(entity, "destinationX", "double")
  addEntityValue(entity, "destinationY", "double")
  setEntityValue(entity, "destinationX", destinationX)
  setEntityValue(entity, "destinationY", destinationY)
  addEntityValue(entity, "removeScreenLag", "bool")
  setEntityValue(entity, "removeScreenLag", removeScreenLag)
  addEntityToRenderGroup(entity, "350Teleporters")
  addEntityToGroup(entity, "Teleporters")
  return entity
end

--make it able to get enitity animation legnth and play entity animation before teleporting
--move teleportation here
