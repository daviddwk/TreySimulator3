timePassed = 0
cloudTime = (rand() % 5) + 5

function update()
  timePassed = getDeltaTime() + timePassed
  if timePassed > cloudTime then
    timePassed = 0
    cloudTime = (rand() % 10) + 5
    createEntity("cloud")
  end
end
