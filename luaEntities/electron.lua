function create(x, y, deltaX, charge)
    entity = getNewEntity("baseLuaEntity")
    setEntityLabel(entity, "electron")
    setEntityX(entity, x)
    setEntityY(entity, y)
    setEntityDeltaX(entity, deltaX)
    addEntityValue(entity, "charge", "bool")
    setEntityValue(entity, "charge", charge)
    addEntityValue(entity, "timeAlive", "double")
    setEntityValue(entity, "timeAlive", 0)
    if getEntityValue(entity, "charge") then
        texture = "positron"
    else
        texture = "electron"
    end
    startEntityAnimation(entity, texture)
    setEntityRenderWidth(entity, getAnimationWidth(texture))
    setEntityRenderHeight(entity, getAnimationHeight(texture))
    addEntityCollisionBox(entity, 0, 0, getAnimationWidth(texture), getAnimationHeight(texture))
    addEntityFunction(entity, "update", "void")
    addEntityToGroup(entity, "Electrons")
    addEntityToRenderGroup(entity, "550Electrons")
    return entity
end

function update(entity)
    feildApplied = false

    function feildForce(feildEntity)
        if entityStaticCollidesWithEntity(entity, 0, feildEntity, 0) then
            if (getEntityValue(feildEntity, "orientation") and getEntityValue(entity, "charge")) or
            (getEntityValue(feildEntity, "orientation") == false and getEntityValue(entity, "charge") == false) then
                setEntityDeltaY(entity, getEntityDeltaY(entity) - (getDeltaTime() * getGlobalValue("gravitySpeed")))
                feildApplied = true
            else
                setEntityDeltaY(entity, getEntityDeltaY(entity) + (getDeltaTime() * getGlobalValue("gravitySpeed")))
                feildApplied = true
            end
        end
    end

    forEachEntityInGroup("ElectricFeilds", "feildForce")

    if feildApplied then
        setEntityValue(entity, "timeAlive", 0)
    else
        setEntityValue(entity, "timeAlive", getEntityValue(entity, "timeAlive") + getDeltaTime())
    end
    
    if getEntityValue(entity, "timeAlive") > 3 then
       deleteEntity(entity) 
    end
end
