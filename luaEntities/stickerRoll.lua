function create(x, y)
  entity = getNewEntity("item", x, y, "stickerRoll")
  removeEntityFunction(entity, "action")
  addEntityFunction(entity, "action", "void")
  return entity
end

function action(entity)
  number = randPaul() % 3
  if number == 0 then
    sticker = "sticker1"
  elseif number == 1 then
    sticker = "sticker2"
  else
    sticker = "sticker3"
  end
  stickerEntity = createEntity("object", getEntityX(entity) + (rand() % getAnimationWidth(sticker)), getEntityY(entity) + (rand() % getAnimationHeight(sticker)), sticker, false, false)
  removeEntityFromAllRenderGroups(stickerEntity)
  addEntityToRenderGroup(stickerEntity, "310Stickers")
end
