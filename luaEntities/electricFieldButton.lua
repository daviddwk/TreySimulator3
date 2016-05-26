function create(x, y, fieldX, fieldY, fieldWidth, fieldHeight)
    entity = getNewEntity("button", x, y)
    addEntityValue(entity, "field", "entity")
    setEntityValue(entity, "field", createEntity("electricField", fieldX, fieldY, fieldWidth, fieldHeight))
    removeEntityFunction(entity, "press")
    addEntityFunction(entity, "press", "void")
    return entity
end

function press(entity)
    orientation = getEntityValue(getEntityValue(entity, "field"), "orientation")
    if orientation then
        setEntityValue(getEntityValue(entity, "field"), "orientation", false)
        startEntityAnimation(getEntityValue(entity, "field"), "electricFieldDown")
    else
        setEntityValue(getEntityValue(entity, "field"), "orientation", true)
        startEntityAnimation(getEntityValue(entity, "field"), "electricFieldUp")
    end
end
