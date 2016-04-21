function create(x, y, width, height, destinationX, destinationY, removeScreenLag) --the origin of teleporters and teleportees is in their bettem lelt rather than top
	entity = getNewEntity("baseLuaEntity")
	setEntityLabel(entity, "teleporter")
	setEntityX(entity, x)
	setEntityY(entity, y - height)
  addEntityValue(entity, "destinationX", "double")
  addEntityValue(entity, "destinationY", "double")
  setEntityValue(entity, "destinationX", destinationX)
  setEntityValue(entity, "destinationY", destinationY)
  addEntityCollisionBox(entity, 0, 0, width, height)
  addEntityValue(entity, "removeScreenLag", "bool")
  setEntityValue(entity, "removeScreenLag", removeScreenLag)
  removeEntityFunction(entity, "render")
	addEntityToGroup(entity, "Teleporters")
  return entity
end
