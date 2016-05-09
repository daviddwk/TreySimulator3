function create(x, y)
    entity = getNewEntity("item", x, y, "basketBall")
    removeEntityFunction(entity, "action")
    addEntityFunction(entity, "action", "void")
    removeEntityFunction(entity, "update")
    addEntityFunction(entity, "update", "void")
    return entity
end

timeScored = 0

function update(entity)
    setEntityDeltaY(entity, getEntityDeltaY(entity) + (getDeltaTime() * getGlobalValue("gravitySpeed")))
    if entityXMovementCollidesWithGroup(entity, 0, "CollisionBlocks", 0)
    or entityXMovementCollidesWithGroup(entity, 0, "basketBallHoop", 0) or entityXMovementCollidesWithGroup(entity, 0, "basketBallHoop", 1)
    or entityXMovementCollidesWithGroup(entity, 0, "basketBall", 0) then
        setEntityDeltaX(entity, -getEntityDeltaX(entity))
    end
    if entityYMovementCollidesWithGroup(entity, 0 ,"CollisionBlocks", 0)
    or entityYMovementCollidesWithGroup(entity, 0, "basketBallHoop", 0) or entityYMovementCollidesWithGroup(entity, 0, "basketBallHoop", 1)
    or entityYMovementCollidesWithGroup(entity, 0, "basketBall", 0) then
        setEntityDeltaX(entity, getEntityDeltaX(entity) / 2)
        setEntityDeltaY(entity, -getEntityDeltaY(entity) / 2)
    elseif entityMovementCollidesWithGroup(entity, 0, "CollisionBlocks", 0)
    or entityMovementCollidesWithGroup(entity, 0, "basketBallHoop", 0) or entityMovementCollidesWithGroup(entity, 0, "basketBallHoop", 1)
    or entityMovementCollidesWithGroup(entity, 0, "basketBall", 0) then
        setEntityDeltaX(entity, -getEntityDeltaX(entity))
        setEntityDeltaY(entity, -getEntityDeltaY(entity))
    end
    if timeScored > 0 then
        timeScored = timeScored - getDeltaTime()
    end
    if entityStaticCollidesWithGroup(entity, 0, "basketBallHoop", 2)  and getEntityDeltaY(entity) > 0 then
        if timeScored <= 0 then
            print("score")
            timeScored = 1
        end
    end
end

function action(entity)
    setEntityValue(getGlobalValue("player"), "holdingItem", getNullEntity())
    if getEntityRenderFlip(entity) then
        setEntityDeltaX(entity, -100 + getEntityDeltaX(entity))
    else
        setEntityDeltaX(entity, 100 + getEntityDeltaX(entity))
    end
    setEntityDeltaY(entity, -400 + getEntityDeltaY(entity))
end
