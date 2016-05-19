up = false
down = false
left = false
right = false
movementSpeed = 250
jumpSpeed = 200
kickVerticleSpeed = 100
kickHorizontalSpeed = 50
kickHorizontalPower = 300
kickVerticlePower = 200

function leftHandle(pressed)
    if pressed then
        left = true
    else
        left = false
    end
end

function rightHandle(pressed)
    if pressed then
        right = true
    else
        right = false
    end
end

function upHandle(pressed)
    if pressed then
        up = true
    else
        up = false
    end
end

function pickUpHandle(pressed)
    if pressed then
        player = getGlobalValue("player")
            if getEntityValue(player, "holdingItem") == getNullEntity() then
                if entityStaticCollidesWithGroup(player, 0, "Items", 0) then
                    function getItems(object)
                        if entityStaticCollidesWithEntity(player, 0, object, 0) then
                            setEntityValue(player, "holdingItem", object)
                        end
                    end
                    forEachEntityInGroup("Items", "getItems")
                end
            else
                setEntityValue(player, "holdingItem", getNullEntity())
            end
    end
end

function useHandle(pressed)
    if pressed then
        player = getGlobalValue("player")
        if entityStaticCollidesWithGroup(player, 0, "Teleporters", 0) or entityStaticCollidesWithGroup(player, 0, "AnimatedTeleporters", 0)then
            teleportedThisFrame = false
            function teleport(teleporter)
                if entityStaticCollidesWithEntity(player, 0, teleporter, 0) and teleportedThisFrame == false then
                    teleportedThisFrame = true
                    setEntityX(player, getEntityValue(teleporter, "destinationX"))
                    setEntityY(player, getEntityValue(teleporter, "destinationY") - getAnimationHeight("treyStanding"))
                    if getEntityValue(teleporter, "removeScreenLag") == true then
                        setGlobalValue("xWanted", getEntityX(entity) - ((getScreenWidth() - getEntityRenderWidth(entity)) / 2))
                        setGlobalValue("yWanted", getEntityY(entity) - ((getScreenHeight() - getEntityRenderHeight(entity)) / 2) - (getScreenHeight() / 5))
                        setScreenX(getGlobalValue("xWanted"))
                        setScreenY(getGlobalValue("yWanted"))
                    end
                end
            end
            forEachEntityInGroup("Teleporters", "teleport")
            forEachEntityInGroup("AnimatedTeleporters", "teleport")
        elseif getEntityValue(player, "holdingItem") ~= getNullEntity() then
            callEntityFunction(getEntityValue(player, "holdingItem"), "action")
        end
    end
end
--arrowkoy handles
addKeyHandle(1073741904, "leftHandle")
addKeyHandle(1073741903, "rightHandle")
addKeyHandle(1073741906, "upHandle")
addKeyHandle(1073741905, "pickUpHandle")

addKeyHandle(string.byte("a"), "leftHandle")
addKeyHandle(string.byte("d"), "rightHandle")
addKeyHandle(string.byte("w"), "upHandle")
addKeyHandle(string.byte("s"), "pickUpHandle")
addKeyHandle(string.byte(" "), "upHandle")
addKeyHandle(string.byte("e"), "useHandle")


function create(x, y)
    entity = getNewEntity("baseLuaEntity")
    setEntityLabel(entity, "player")
    setEntityX(entity, x)
    setEntityY(entity, y)
    setEntityRenderHeight(entity, 99)
    setEntityRenderWidth(entity, 78)
    startEntityAnimation(entity, "treyStanding")
    addEntityCollisionBox(entity, 27, 19, 26, 80)--0:main collision
    addEntityCollisionBox(entity, 27, 19, 26, 80 + 1)--1:ground collision
    addEntityValue(entity, "holdingItem", "entity")
    addEntityFunction(entity, "update", "void")
    addEntityToGroup(entity, "Player")
    addEntityToRenderGroup(entity, "450Player")
    return entity
end

function update(entity)

    setEntityDeltaY(entity, getEntityDeltaY(entity) + (getGlobalValue("gravitySpeed") * getDeltaTime()))

    onGround = entityStaticCollidesWithGroup(entity, 1, "CollisionBlocks", 0)

    if onGround == true then
        setEntityDeltaX(entity, 0)
        if left then
            setEntityDeltaX(entity, movementSpeed * -1)
            setEntityRenderFlip(entity, true)
        end
        if right then
            setEntityDeltaX(entity, movementSpeed)
            setEntityRenderFlip(entity, false)
        end

        if left or right then
            if getCurrentEntityAnimation(entity) ~= "treyWalking" then
                startEntityAnimation(entity, "treyWalking")
            end
        else
            startEntityAnimation(entity, "treyStanding")
        end
        if up then
            --do player jump
            setEntityDeltaY(entity, jumpSpeed * -1)
            onGround = false
            startEntityAnimation(entity, "treyFalling")
        else
            if down then
            end
        end
    end

    --item Holding/colisions
    x, y, width, height = getEntityCollisionBox(entity, 0)
    itemHeld = getEntityValue(entity, "holdingItem")

    if itemHeld ~= getNullEntity() then --set item values to player's
        itemX, itemY, itemWidth, itemHeight = getEntityCollisionBox(itemHeld, 0)
        setEntityDeltaX(itemHeld, getEntityDeltaX(entity))
        setEntityDeltaY(itemHeld, getEntityDeltaY(entity))
        setEntityX(itemHeld, (getEntityX(entity) + x) - ((itemWidth - width) / 2))
        setEntityY(itemHeld, (getEntityY(entity) + y) - ((itemHeight - height) / 2))
        setEntityRenderFlip(itemHeld, getEntityRenderFlip(entity))
    end
    if itemHeld ~= getNullEntity() and entityXMovementCollidesWithGroup(itemHeld, 0, "CollisionBlocks", 0) then --if item collides set player delta to 0
        setEntityDeltaX(entity, 0)
    elseif entityXMovementCollidesWithGroup(entity, 0, "CollisionBlocks", 0) then --elseif player collides set delta 0
        setEntityDeltaX(entity, 0)
    end
    if itemHeld ~= getNullEntity() and entityYMovementCollidesWithGroup(itemHeld, 0, "CollisionBlocks", 0) then
        setEntityDeltaY(entity, 0)
    elseif entityYMovementCollidesWithGroup(entity, 0, "CollisionBlocks", 0) then
        setEntityDeltaY(entity, 0)
    end
    if itemHeld ~= getNullEntity() and entityMovementCollidesWithGroup(itemHeld, 0, "CollisionBlocks", 0) then
        setEntityDeltaX(entity, 0)
        setEntityDeltaY(entity, 0)
    elseif entityMovementCollidesWithGroup(entity, 0, "CollisionBlocks", 0) then
        setEntityDeltaX(entity, 0)
        setEntityDeltaY(entity, 0)
    end
    if itemHeld ~= getNullEntity() then --catch up item delta to the new player delta
        setEntityDeltaX(itemHeld, getEntityDeltaX(entity))
        setEntityDeltaY(itemHeld, getEntityDeltaY(entity))
    end

    setGlobalValue("xWanted", getEntityX(entity) - ((getScreenWidth() - getEntityRenderWidth(entity)) / 2))
    setGlobalValue("yWanted", getEntityY(entity) - ((getScreenHeight() - getEntityRenderHeight(entity)) / 2) - (getScreenHeight() / 5))

end
