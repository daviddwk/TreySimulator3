
addGlobalValue("xWanted", "double")
addGlobalValue("yWanted", "double")

screenSpeedMultiplier = 4

function update()
    setScreenX((getDeltaTime() * screenSpeedMultiplier * (getGlobalValue("xWanted") - getScreenX())) + getScreenX())
    setScreenY((getDeltaTime() * screenSpeedMultiplier * (getGlobalValue("yWanted") - getScreenY())) + getScreenY())
end
