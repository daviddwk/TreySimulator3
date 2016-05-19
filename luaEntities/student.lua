function create()
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    setEntityLabel(entity, "student")
    destinations = {{555, 566, 663}, {580, 654, 782}}
    heights = {432, 266}
    floor = rand() % 2 + 1
    spawn = rand() % 3 + 1
    door = rand() % 3 + 1
    addEntityValue(entity, "destination", "double")
    setEntityValue(entity, "destination", destinations[floor][door] * sizeMultiplier)
    if destinations[floor][spawn] > destinations[floor][door] then
        setEntityDeltaX(entity, -100)
    elseif destinations[floor][spawn] < destinations[floor][door] then
        setEntityDeltaX(entity, 100)
    else
        
    end
    addEntityFunction(entity, "update", "void")
    texture = "student" .. rand() % 3 + 1
    texture = "treyWalking"
    setEntityX(entity, destinations[floor][spawn] * sizeMultiplier)
    setEntityY(entity, (heights[floor] * sizeMultiplier) - getAnimationHeight(texture))
    setEntityRenderWidth(entity, getAnimationWidth(texture))
    setEntityRenderHeight(entity, getAnimationHeight(texture))
    startEntityAnimation(entity, texture)
    addEntityToGroup(entity, "Students")
    addEntityToRenderGroup(entity, "400Students")
    return entity
end

function update(entity)
    if getEntityDeltaX(entity) > 0 and getEntityX(entity) > getEntityValue(entity, "destination") then
        deleteEntity(entity)
    elseif getEntityDeltaX(entity) < 0 then
        setEntityRenderFlip(entity, true)
        if getEntityX(entity) < getEntityValue(entity, "destination") then
            deleteEntity(entity)
        end
    elseif getEntityDeltaX(entity) == 0 then
        deleteEntity(entity)
    end
end
