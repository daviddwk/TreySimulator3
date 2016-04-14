function create(x, y)
  entity = getNewEntity("item", x, y, "basketBall")
  removeEntityFunction(entity, "action")
  addEntityFunction(entity, "action", "void")
  removeEntityFunction(entity, "update")
  addEntityFunction(entity, "update", "void")
  return entity
end

function update(entity)
  setEntityDeltaY(entity, getEntityDeltaY(entity) + (getDeltaTime() * getGlobalValue("gravitySpeed")))
  if entityXMovementCollidesWithGroup(entity, 0, "CollisionBlocks", 0) or entityXMovementCollidesWithGroup(entity, 0, "basketBallHoop", 0) or entityXMovementCollidesWithGroup(entity, 0, "basketBallHoop", 1) then
    setEntityDeltaX(entity, -getEntityDeltaX(entity) / 2)
  end
	if entityYMovementCollidesWithGroup(entity, 0 ,"CollisionBlocks", 0) or entityYMovementCollidesWithGroup(entity, 0, "basketBallHoop", 0) or entityYMovementCollidesWithGroup(entity, 0, "basketBallHoop", 1) then
    setEntityDeltaX(entity, getEntityDeltaX(entity) / 2)
		setEntityDeltaY(entity, -getEntityDeltaY(entity) / 2)
	elseif entityMovementCollidesWithGroup(entity, 0, "CollisionBlocks", 0) or entityMovementCollidesWithGroup(entity, 0, "basketBallHoop", 0) or entityMovementCollidesWithGroup(entity, 0, "basketBallHoop", 1) then
    setEntityDeltaX(entity, -getEntityDeltaX(entity) / 2)
    setEntityDeltaY(entity, -getEntityDeltaY(entity) / 2)
  end
end

function action(entity)
  setEntityValue(getGlobalValue("player"), "holdingItem", getNullEntity())
  if getEntityRenderFlip(entity) then
    setEntityDeltaX(entity, -100 + getEntityDeltaX(entity))
  else
    setEntityDeltaX(entity, 100 + getEntityDeltaX(entity))
  end
  setEntityDeltaY(entity, -500 + getEntityDeltaY(entity))

end
