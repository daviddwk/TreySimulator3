function create(x, y)
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    startEntityAnimation(entity, "button")
    setEntityX(entity, x * sizeMultiplier + 1)
    setEntityY(entity, (y * sizeMultiplier + 1) - getAnimationHeight("button"))
    setEntityRenderWidth(entity, getAnimationWidth("button"))
    setEntityRenderHeight(entity, getAnimationHeight("button"))
    addEntityCollisionBox(entity, 0, 0, getAnimationWidth("button"), getAnimationHeight("button"))
    addEntityFunction(entity, "press", "void")
    addEntityToGroup(entity, "Buttons")
    addEntityToRenderGroup(entity, "550Buttons")
    return entity
end

function press(entity)
end
