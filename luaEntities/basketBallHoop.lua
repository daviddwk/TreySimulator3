function create(x, y)
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    startEntityAnimation(entity, "basketBallHoop")
    setEntityLabel(entity, "basketBallHoop")
    setEntityX(entity, x * sizeMultiplier + 1)
    setEntityY(entity, y * sizeMultiplier + 1)
    addEntityCollisionBox(entity, 29, 54, 1, 2) --left hoop
    addEntityCollisionBox(entity, 57, 54, 1, 2) --right hoop
    addEntityCollisionBox(entity, 34, 54, 19, 2) --in hoop
    setEntityRenderWidth(entity, getAnimationWidth("basketBallHoop"))
    setEntityRenderHeight(entity, getAnimationHeight("basketBallHoop"))
    addEntityFunction(entity, "dunk", "void")
    addEntityToGroup(entity, "BasketBallHoops")
    addEntityToRenderGroup(entity, "390BasketBallHoops")
    return entity
end

function dunk(entity)
    function checkDunk(basketBall)
        if entityStaticCollidesWithEntity(basketball, 0, entity, 2) then
            print("SCORE")
        end
    end
    forEachEntityInGroup("Basketballs", "checkDunk")
end
