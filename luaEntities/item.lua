function create(x, y, texture)
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    setEntityLabel(entity, "item")
    setEntityX(entity, x * sizeMultiplier)
    setEntityY(entity, y * sizeMultiplier - getAnimationHeight(texture))
    setEntityRenderWidth(entity, getAnimationWidth(texture))
    setEntityRenderHeight(entity, getAnimationHeight(texture))
    startEntityAnimation(entity, texture)
    addEntityCollisionBox(entity, 0, 0, getAnimationWidth(texture), getAnimationHeight(texture))
    addEntityFunction(entity, "update", "void")
    addEntityFunction(entity, "action", "void")
    addEntityToGroup(entity, "Items")
    addEntityToRenderGroup(entity, "500Items")
    return entity
end

function action(entity)
end

function update(entity)
    setEntityDeltaY(entity, getEntityDeltaY(entity) + (getDeltaTime() * getGlobalValue("gravitySpeed")))
    if entityXMovementCollidesWithGroup(entity, 0 ,"CollisionBlocks", 0) then
        setEntityDeltaX(entity, 0)
    end
    if entityYMovementCollidesWithGroup(entity, 0 ,"CollisionBlocks", 0) then
        setEntityDeltaY(entity, 0)
        setEntityDeltaX(entity, 0)
    end
    if entityMovementCollidesWithGroup(entity, 0, "CollisionBlocks", 0) then
        setEntityDeltaX(entity, 0)
        setEntityDeltaY(entity, 0)
    end
end
