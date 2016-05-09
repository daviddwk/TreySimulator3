function create()
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    setEntityLabel(entity, "cloud")
    setEntityX(entity, -300 * sizeMultiplier)
    setEntityY(entity, (rand() % 200) * sizeMultiplier )
    setEntityDeltaX(entity, (rand() % 140) + 10)
    setEntityRenderWidth(entity, ((rand() % 50) + 150) * sizeMultiplier)
    setEntityRenderHeight(entity, ((rand() % 30) + 90) * sizeMultiplier)
    addEntityFunction(entity, "update", "void")
    startEntityAnimation(entity, "cloud" .. rand() % 3 + 1)
    addEntityToGroup(entity, "Clouds")
    addEntityToRenderGroup(entity, "100Clouds")
    return entity
end

function update(entity)
    if getEntityX(entity) > (2255 + 300) * 4 then
        deleteEntity(entity)
    end
end
