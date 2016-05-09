function create(x, y, destinationX, destinationY, texture, removeScreenLag)
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    setEntityLabel(entity, "animatedTeleporter")
    setEntityX(entity, x * sizeMultiplier)
    setEntityY(entity, y * sizeMultiplier - getAnimationHeight(texture) + 1)
    setEntityRenderWidth(entity, getAnimationWidth(texture))
    setEntityRenderHeight(entity, getAnimationHeight(texture))
    startEntityAnimation(entity, texture)
    addEntityCollisionBox(entity, 0, 0, getAnimationWidth(texture), getAnimationHeight(texture))
    addEntityValue(entity, "destinationX", "double")
    addEntityValue(entity, "destinationY", "double")
    setEntityValue(entity, "destinationX", destinationX * sizeMultiplier)
    setEntityValue(entity, "destinationY", destinationY * sizeMultiplier)
    addEntityValue(entity, "removeScreenLag", "bool")
    setEntityValue(entity, "removeScreenLag", removeScreenLag)
    addEntityToRenderGroup(entity, "350Teleporters")
    addEntityToGroup(entity, "Teleporters")
    return entity
end

--make it able to get enitity animation legnth and play entity animation before teleporting
--move teleportation here
