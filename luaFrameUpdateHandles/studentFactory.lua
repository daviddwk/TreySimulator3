timePassed = 0
studentTime = 0

function update()
    timePassed = getDeltaTime() + timePassed
    if timePassed > studentTime then
        timePassed = 0
        math.randomseed(rand())
        studentTime = math.random()
        createEntity("student")
    end
end
