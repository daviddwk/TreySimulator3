--constants
addGlobalValue("gravitySpeed", "double")
setGlobalValue("gravitySpeed", 500)
addGlobalValue("sizeMultiplier", "double")
setGlobalValue("sizeMultiplier", 3)
sizeMultiplier = getGlobalValue("sizeMultiplier")

--player
addGlobalValue("player", "entity")
playerEntity = createEntity("player", 224 * sizeMultiplier, 320 * sizeMultiplier)
setGlobalValue("player", playerEntity)

--background textures
createEntity("block", 0, 0, getAnimationWidth("school") * sizeMultiplier, getAnimationHeight("school") * sizeMultiplier, "school", false)
createEntity("block", 0, 1000 * sizeMultiplier, getAnimationWidth("cafeteria") * sizeMultiplier, getAnimationHeight("cafeteria") * sizeMultiplier, "cafeteria", false)

--collisions
  --main school
    --horizontal
createEntity("block", 100 * sizeMultiplier, 432 * sizeMultiplier, 2055 * sizeMultiplier, 16 * sizeMultiplier, "", true)--first floor
createEntity("block", 476 * sizeMultiplier, 337 * sizeMultiplier, 529 * sizeMultiplier, 17 * sizeMultiplier, "", true)--first hallway ceiling left to right
createEntity("block", 1095 * sizeMultiplier, 337 * sizeMultiplier, 99 * sizeMultiplier, 17 * sizeMultiplier, "", true)
createEntity("block", 1471 * sizeMultiplier, 337 * sizeMultiplier, 368 * sizeMultiplier, 17 * sizeMultiplier, "", true)
createEntity("block", 1178 * sizeMultiplier, 282 * sizeMultiplier, 309 * sizeMultiplier, 17 * sizeMultiplier, "", true)--library ceiling
createEntity("block", 100 * sizeMultiplier, 266 * sizeMultiplier, 2055 * sizeMultiplier, 16 * sizeMultiplier, "", true)--second floor and some roof
createEntity("block", 476 * sizeMultiplier, 171 * sizeMultiplier, 402 * sizeMultiplier, 17 * sizeMultiplier, "", true)--second hallway ceiling left to right
createEntity("block", 1178 * sizeMultiplier, 171 * sizeMultiplier, 661 * sizeMultiplier, 17 * sizeMultiplier, "", true)
createEntity("block", 862 * sizeMultiplier, 100 * sizeMultiplier, 332 * sizeMultiplier, 16 * sizeMultiplier, "", true)--small commons ceiling
    --vertical
createEntity("block", 100 * sizeMultiplier, 266 * sizeMultiplier, 16 * sizeMultiplier, 182 * sizeMultiplier, "", true)--pillar
createEntity("block", 160 * sizeMultiplier, 266 * sizeMultiplier, 16 * sizeMultiplier, 129 * sizeMultiplier, "", true)--main commons wall left
createEntity("block", 476 * sizeMultiplier, 171 * sizeMultiplier, 16 * sizeMultiplier, 224 * sizeMultiplier, "", true)--main commons wall left and second wall left
createEntity("block", 989 * sizeMultiplier, 266 * sizeMultiplier, 16 * sizeMultiplier, 88 * sizeMultiplier, "", true)--ramp walls left to right
createEntity("block", 1095 * sizeMultiplier, 266 * sizeMultiplier, 16 * sizeMultiplier, 88 * sizeMultiplier, "", true)
createEntity("block", 1178 * sizeMultiplier, 266 * sizeMultiplier, 16 * sizeMultiplier, 129 * sizeMultiplier, "", true)--library walls left to right
createEntity("block", 1471 * sizeMultiplier, 266 * sizeMultiplier, 16 * sizeMultiplier, 129 * sizeMultiplier, "", true)
createEntity("block", 1823 * sizeMultiplier, 171 * sizeMultiplier, 16 * sizeMultiplier, 224 * sizeMultiplier, "", true)--gym wall left and second wall right
createEntity("block", 2139 * sizeMultiplier, 266 * sizeMultiplier, 16 * sizeMultiplier, 182 * sizeMultiplier, "", true)--gym wall right
createEntity("block", 862 * sizeMultiplier, 100 * sizeMultiplier, 16 * sizeMultiplier, 88 * sizeMultiplier, "", true)--small commons left to right
createEntity("block", 1178 * sizeMultiplier, 100 * sizeMultiplier, 16 * sizeMultiplier, 88 * sizeMultiplier, "", true)
createEntity("block", 1637 * sizeMultiplier, 171 * sizeMultiplier, 16 * sizeMultiplier, 58 * sizeMultiplier, "", true)--bathroom wall
  --cafeteria
createEntity("block", 0 * sizeMultiplier, (166 + 1000) * sizeMultiplier, 472 * sizeMultiplier, 16 *sizeMultiplier, "", true)--floor
createEntity("block", 316 * sizeMultiplier, (71 + 1000) * sizeMultiplier, 156 * sizeMultiplier, 17 * sizeMultiplier, "", true)
createEntity("block", 0 * sizeMultiplier, (0 + 1000) * sizeMultiplier, 472 * sizeMultiplier, 16 *sizeMultiplier, "", true)--roof
createEntity("block", 0 * sizeMultiplier, (0 + 1000) * sizeMultiplier, 16 * sizeMultiplier, 129 * sizeMultiplier, "", true)
createEntity("block", 316 * sizeMultiplier, (0 + 1000) * sizeMultiplier, 16 * sizeMultiplier, 129 * sizeMultiplier, "", true)
createEntity("block", 456 * sizeMultiplier, (0 + 1000) * sizeMultiplier, 16 * sizeMultiplier, 182 * sizeMultiplier, "", true)

--entities
  --1st floor
    --large commons
createEntity("object", 176 * sizeMultiplier, 282 * sizeMultiplier, "ceilingLights", false, true)
createEntity("object", 192 * sizeMultiplier, 432 * sizeMultiplier, "glassOffice", true, false)
createEntity("object", 321 * sizeMultiplier, (432 * sizeMultiplier) - getAnimationHeight("officeHole"), "officeHole", true, false)
createEntity("stickerRoll", 449 * sizeMultiplier, 432 * sizeMultiplier)
    --first hallway
for i = 0,5 + rand() % 10 do
  createEntity("poster", 492 * sizeMultiplier, 354 * sizeMultiplier, 497 * sizeMultiplier, 41 * sizeMultiplier)
end
createEntity("animatedTeleporter", 508 * sizeMultiplier, 432 * sizeMultiplier, 16 * sizeMultiplier, (166 + 1000) * sizeMultiplier, "door", true)--cafeteria doors
for j = 0,1 do
  for i = 0,10 do
    createEntity("object", (660 * sizeMultiplier) + (i * getAnimationWidth("locker")) + (j * getAnimationWidth("locker") * 11) + (j * 100), (432 * sizeMultiplier), "locker", true, false)
  end
end
createEntity("object", 950 * sizeMultiplier, 432 * sizeMultiplier, "waterFountain", true, false)
createEntity("object", 970 * sizeMultiplier, 432 * sizeMultiplier, "waterFountain", true, false)
createEntity("teleporter", 1005 * sizeMultiplier, 432 * sizeMultiplier, 90 * sizeMultiplier, 150 * sizeMultiplier, 1047 * sizeMultiplier, 266 * sizeMultiplier, false)--ramp
createEntity("teleporter", 1005 * sizeMultiplier, 266 * sizeMultiplier, 90 * sizeMultiplier, 27 * sizeMultiplier, 1051 * sizeMultiplier, 432 * sizeMultiplier, false)--ramp
createEntity("item", 1127 * sizeMultiplier, 432 * sizeMultiplier, "pottedPlant")
    --library
    --hallway before gym
createEntity("object", 1768 * sizeMultiplier, 432 * sizeMultiplier, "waterFountain", true, false)
createEntity("object", 1788 * sizeMultiplier, 432 * sizeMultiplier, "waterFountain", true, false)
for i = 0,2 do
  createEntity("object", (1503 * sizeMultiplier) + (i * getAnimationWidth("trophyCase")) + (i * 100), (432 * sizeMultiplier), "trophyCase", true, false)
end
    --gym
createEntity("basketBall", 2012 * sizeMultiplier, 432 * sizeMultiplier)
createEntity("basketBallHoop", 1883 * sizeMultiplier, 336 * sizeMultiplier)
createEntity("basketBallHoop", 2067 * sizeMultiplier, 336 * sizeMultiplier)

  --2nd floor
    --first hallway
for i = 0,5 + rand() % 10 do
  createEntity("poster", 492 * sizeMultiplier, 188 * sizeMultiplier, 386 * sizeMultiplier, 41 * sizeMultiplier)
end
for j = 0,1 do
  for i = 0,10 do
    createEntity("object", (508 * sizeMultiplier) + (i * getAnimationWidth("locker")) + (j * getAnimationWidth("locker") * 11) + (j * 100), (266 * sizeMultiplier), "locker", true, false)
  end
end
createEntity("object", 805 * sizeMultiplier, 266 * sizeMultiplier, "waterFountain", true, false)
createEntity("object", 825 * sizeMultiplier, 266 * sizeMultiplier, "waterFountain", true, false)
    --small commons
    --second hallway
for i = 0,5 + rand() % 10 do
  createEntity("poster", 1194 * sizeMultiplier, 188 * sizeMultiplier, 427 * sizeMultiplier, 41 * sizeMultiplier)
end
for j = 0,1 do
  for i = 0,10 do
    createEntity("object", (1243 * sizeMultiplier) + (i * getAnimationWidth("locker")) + (j * getAnimationWidth("locker") * 11) + (j * 100), (266 * sizeMultiplier), "locker", true, false)
  end
end
createEntity("object", 1580 * sizeMultiplier, 266 * sizeMultiplier, "waterFountain", true, false)
createEntity("object", 1600 * sizeMultiplier, 266 * sizeMultiplier, "waterFountain", true, false)
    --restroom

  --cafeteria
for i = 0,2 do
    createEntity("object", ((32 + (i * 16)) * sizeMultiplier) + (i * getAnimationWidth("lunchTable")), (1000 + 166) * sizeMultiplier, "lunchTable", true, false)
end
