function create(x, y, emitterX, emitterY)
    entity = getNewEntity("button", x, y)
    addEntityValue(entity, "emitter", "entity")
    setEntityValue(entity, "emitter", createEntity("electronEmitter", emitterX, emitterY))
    removeEntityFunction(entity, "press")
    addEntityFunction(entity, "press", "void")
    return entity
end

function press(entity)
    charge = rand() % 2
    createEntity("electron", getEntityX(getEntityValue(entity, "emitter")) + getAnimationWidth("electronEmitter"), getEntityY(getEntityValue(entity, "emitter")) + (getAnimationHeight("electronEmitter") / 2) - (getAnimationHeight("electron") / 2), getGlobalValue("gravitySpeed"), charge == 0)
end
