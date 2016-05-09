function create(x, y)
    entity = getNewEntity("item", x, y, "stickerRoll")
    removeEntityFunction(entity, "action")
    addEntityFunction(entity, "action", "void")
    return entity
end

function action(entity)
    sizeMultiplier = getGlobalValue("sizeMultiplier")
    sticker = "sticker" .. rand() % 4 + 1
    stickerEntity = createEntity("object", (getEntityX(entity) + (rand() % getAnimationWidth("stickerRoll")))/sizeMultiplier ,(getEntityY(entity) + (rand() % getAnimationHeight("stickerRoll")))/ sizeMultiplier, sticker, false, false)
    removeEntityFromAllRenderGroups(stickerEntity)
    addEntityToRenderGroup(stickerEntity, "310Stickers")
end
