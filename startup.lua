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
createEntity("animation", 0, 0, getAnimationWidth("school") * sizeMultiplier, getAnimationHeight("school") * sizeMultiplier, "school")
createEntity("animation", 0, 1000 * sizeMultiplier, getAnimationWidth("cafeteria") * sizeMultiplier, getAnimationHeight("cafeteria") * sizeMultiplier, "cafeteria")

--collisions
    --main school
        --horizontal
createEntity("block", 100, 432, 2055, 16)--first floor
createEntity("block", 476, 337, 529, 17)--first hallway ceiling left to right
createEntity("block", 1095, 337, 99, 17)
createEntity("block", 1471, 337, 368, 17)
createEntity("block", 1178, 282, 309, 17)--library ceiling
createEntity("block", 100, 266, 2055, 16)--second floor and some roof
createEntity("block", 476, 171, 402, 17)--second hallway ceiling left to right
createEntity("block", 1178, 171, 661, 17)
createEntity("block", 862, 100, 332, 16)--small commons ceiling
        --vertical
createEntity("block", 100, 266, 16, 182)--pillar
createEntity("block", 160, 266, 16, 129)--main commons wall left
createEntity("block", 476, 171, 16, 224)--main commons wall left and second wall left
createEntity("block", 989, 266, 16, 88)--ramp walls left to right
createEntity("block", 1095, 266, 16, 88)
createEntity("block", 1178, 266, 16, 129)--library walls left to right
createEntity("block", 1471, 266, 16, 129)
createEntity("block", 1823, 171, 16, 224)--gym wall left and second wall right
createEntity("block", 2139, 266, 16, 182)--gym wall right
createEntity("block", 862, 100, 16, 88)--small commons left to right
createEntity("block", 1178, 100, 16, 88)
createEntity("block", 1637, 171, 16, 58)--bathroom wall
        --cafeteria
createEntity("block", 0, (166 + 1000), 472, 16)--floor
createEntity("block", 316, (71 + 1000), 156, 17)
createEntity("block", 0, (0 + 1000), 472, 16)--roof
createEntity("block", 0, (0 + 1000), 16, 129)
createEntity("block", 316, (0 + 1000), 16, 129)
createEntity("block", 456, (0 + 1000), 16, 182)

--entities
    --1st floor
        --large commons
createEntity("object", 176 , 282, "ceilingLights", false, true)
createEntity("object", 192, 432 , "glassOffice", true, false)
createEntity("object", 321 , 432 - (getAnimationHeight("officeHole") / sizeMultiplier), "officeHole", true, false)
createEntity("stickerRoll", 449, 432)
        --first hallway
for i = 0,5 + rand() % 10 do
    createEntity("poster", 492, 354, 497, 41)
end
createEntity("animatedTeleporter", 540, 432, 16, 166 + 1000, "cafeteriaDoor", true)--cafeteria doors
createEntity("object", 614, 432, "barrelTrashCan",true, false)
for j = 0,1 do
    for i = 0,10 do
        createEntity("object", (660) + (i * getAnimationWidth("locker")) / sizeMultiplier + (j * getAnimationWidth("locker") * 11) / sizeMultiplier + (j * 33), 432, "locker", true, false)
    end
end
createEntity("object", 950, 432, "waterFountain", true, false)
createEntity("object", 970, 432, "waterFountain", true, false)
createEntity("teleporter", 1005, 432, 90, 150, 1047, 266, false)--ramp
createEntity("teleporter", 1005, 266, 90, 27, 1051, 432, false)--ramp
createEntity("item", 1127, 432, "pottedPlant")
        --library
        --hallway before gym
createEntity("object", 1768, 432, "waterFountain", true, false)
createEntity("object", 1788, 432, "waterFountain", true, false)
for i = 0,2 do
    createEntity("object", 1503 + (i * getAnimationWidth("trophyCase")) / sizeMultiplier + (i * 33), 432, "trophyCase", true, false)
end
        --gym
createEntity("basketBall", 2012, 432)
createEntity("basketBallHoop", 1883, 336)
createEntity("basketBallHoop", 2067, 336)

    --2nd floor
        --first hallway
for i = 0,5 + rand() % 10 do
    createEntity("poster", 492, 188, 386, 41)
end
for j = 0,1 do
    for i = 0,10 do
        createEntity("object", (508) + (i * getAnimationWidth("locker")) / sizeMultiplier + (j * getAnimationWidth("locker") * 11) / sizeMultiplier + (j * 33), 266, "locker", true, false)
    end
end
createEntity("object", 805, 266, "waterFountain", true, false)
createEntity("object", 825, 266, "waterFountain", true, false)
        --small commons
        --second hallway
for i = 0,5 + rand() % 10 do
    createEntity("poster", 1194, 188, 427, 41)
end
for j = 0,1 do
    for i = 0,10 do
        createEntity("object", 1243 + (i * getAnimationWidth("locker")) / sizeMultiplier + (j * getAnimationWidth("locker") * 11) / sizeMultiplier + 33, (266), "locker", true, false)
    end
end
createEntity("object", 1580, 266, "waterFountain", true, false)
createEntity("object", 1600, 266, "waterFountain", true, false)
        --restroom

    --cafeteria
for i = 0,2 do
    createEntity("object", (48 + (i * 16)) + (i * getAnimationWidth("lunchTable")) / sizeMultiplier, 1000 + 166, "lunchTable", true, false)
end
