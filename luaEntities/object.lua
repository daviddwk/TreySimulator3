function create(x, y, texture, fromBottom, foreground)
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    startEntityAnimation(entity, texture)
    setEntityLabel(entity, "object")
    setEntityX(entity, x * sizeMultiplier + 1)
    if fromBottom then
        setEntityY(entity, (y * sizeMultiplier - getAnimationHeight(texture)) + 1)
    else
        setEntityY(entity, y * sizeMultiplier + 1)
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
