function create(x, y, width, height, texture)
    entity = getNewEntity("baseLuaEntity")
    setEntityLabel(entity, "texture")
    setEntityX(entity, x)
    setEntityY(entity, y)
    setEntityRenderWidth(entity, width)
    setEntityRenderHeight(entity, height)
    startEntityAnimation(entity, texture)
    addEntityToGroup(entity, "AnimationBlocks")
    addEntityToRenderGroup(entity, "200AnimationBlocks")
    return entity
end
