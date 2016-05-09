function create(x, y, width, height)
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    setEntityLabel(entity, "object")
    setEntityX(entity, ((rand() % width) + x) * sizeMultiplier + 1)
    setEntityY(entity, ((rand() % height) + y) * sizeMultiplier + 1)
    texture = "poster" .. rand() % 7 + 1
    startEntityAnimation(entity, texture)
    setEntityRenderWidth(entity, getAnimationWidth(texture))
    setEntityRenderHeight(entity, getAnimationHeight(texture))
    addEntityToGroup(entity, "Objectss")
    addEntityToRenderGroup(entity, "300Objects")
    return entity
end
