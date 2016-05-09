function create(x, y, width, height)
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    setEntityLabel(entity, "block")
    setEntityX(entity, x * sizeMultiplier)
    setEntityY(entity, y * sizeMultiplier)
    removeEntityFunction(entity, "render")
    addEntityCollisionBox(entity, 0, 0, width * sizeMultiplier, height * sizeMultiplier)
    addEntityToGroup(entity, "CollisionBlocks")
    return entity
end
