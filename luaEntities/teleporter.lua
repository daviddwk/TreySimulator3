function create(x, y, width, height, destinationX, destinationY, removeScreenLag)
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    setEntityLabel(entity, "teleporter")
    setEntityX(entity, x * sizeMultiplier)
    setEntityY(entity, (y - height) * sizeMultiplier)
    addEntityValue(entity, "destinationX", "double")
    addEntityValue(entity, "destinationY", "double")
    setEntityValue(entity, "destinationX", destinationX * sizeMultiplier)
    setEntityValue(entity, "destinationY", destinationY * sizeMultiplier)
    addEntityCollisionBox(entity, 0, 0, width * sizeMultiplier, height * sizeMultiplier)
    addEntityValue(entity, "removeScreenLag", "bool")
    setEntityValue(entity, "removeScreenLag", removeScreenLag)
    removeEntityFunction(entity, "render")
    addEntityToGroup(entity, "Teleporters")
    return entity
end
