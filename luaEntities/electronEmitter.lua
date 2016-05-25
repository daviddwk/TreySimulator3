function create(x, y)
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    setEntityX(entity, x * sizeMultiplier)
    setEntityY(entity, y * sizeMultiplier)
    startEntityAnimation(entity, "electronEmitter")
    setEntityRenderWidth(entity, getAnimationWidth("electronEmitter"))
    setEntityRenderHeight(entity, getAnimationHeight("electronEmitter"))
    addEntityToGroup(entity, "ElectronEmitters")
    addEntityToRenderGroup(entity, "550ElectronEmitters")
    return entity
end
