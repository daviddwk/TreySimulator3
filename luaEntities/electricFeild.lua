function create(x, y, width, height)
    entity = getNewEntity("baseLuaEntity")
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    setEntityX(entity, x * sizeMultiplier) 
    setEntityY(entity, y * sizeMultiplier)
    addEntityValue(entity, "orientation", "bool")
    setEntityValue(entity, "orientation", true)
    startEntityAnimation(entity, "electricFeildUp")
    addEntityCollisionBox(entity, 0, 0, width * sizeMultiplier, height * sizeMultiplier)
    addEntityToGroup(entity, "ElectricFeilds")
    return entity
end
