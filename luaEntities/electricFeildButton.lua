function create(x, y, feildX, feildY, feildWidth, feildHeight)
    entity = getNewEntity("button", x, y)
    addEntityValue(entity, "feild", "entity")
    setEntityValue(entity, "feild", createEntity("electricFeild", feidX, feildY, feildWidth, feildHeight))
    removeEntityFunction(entity, "press")
    addEntityFunction(entity, "press", "void")
    return entity
end

function press(entity)
    orientation = getEntityValue(getEntityValue(entity, "feild"), "orientation")
    if orientation then
        setEntityValue(getEntityValue(entity, "feild"), "orientation", false)
        startEntityAnimation(entity, "electricFeildDown")
    else
        setEntityValue(getEntityValue(entity, "feild"), "orientation", true)
        startEntityAnimation(entity, "electricFeildUp")
    end
end
