function create(x, y)
  entity = getNewEntity("item", x, y, "stickerRoll")
  removeEntityFunction(entity, "action")
  addEntityFunction(entity, "action", "void")
  return entity
end

function action(entity)
  number = randPaul() % 4
  if number == 0 then
    sticker = "sticker1"
  elseif number == 1 then
    sticker = "sticker2"
  elseif number == 2 then
    sticker = "sticker3"
  else
    sticker = "sticker4"
  end
  stickerEntity = createEntity("object", getEntityX(entity) + (rand() % getAnimationWidth(sticker)), getEntityY(entity) + (rand() % getAnimationHeight(sticker)), sticker, false, false)
  removeEntityFromAllRenderGroups(stickerEntity)
  addEntityToRenderGroup(stickerEntity, "310Stickers")
end
