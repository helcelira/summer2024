require("_scoreboard")

function scoreconvert(num) --converts rolls into scores
  if num % 2 == 0 then
    return 10
  else 
    return -5
  end
end

function roll() --rolls numbers and determine the score of the player
  local roll1 = math.random(1,6)
  local roll2 = math.random(1,6)
  local score = 0
  score = score + scoreconvert(roll1) + scoreconvert(roll2)
  
  if roll1 == roll2 then --if 
    local roll3 = math.random(1,6)
    score = score + scoreconvert(roll3)
  end
  
  return score
end

function endroll()
  local roll = math.random(1,6)
  return scoreconvert(roll)
end

function dicegame(username1, username2)
  local player1 = 0
  local player2 = 0
  math.randomseed(os.time())
  for x = 5, 1, -1 do
    local y = 5 - x + 1
    print("round", y , "has started")
    local y = roll()
    print(username1, "gets", y, "points!")
    local z = roll()
    print(username2, "gets", z, "points!")
    player1 = player1 + y
    player2 = player2 + z
  end
  
  if player1 == player2 then
    print(username1, "is in a tie with", username2, "!")
    while player1 == player2 do
      player1,player2 = player1 + endroll(), player2 + endroll()
    end
  end
  
  if player1 > player2 then
    print(username1, "wins with:", player1, " points !")
    outputscore(username1,player1,"dicescore.txt")
  else 
    print(username2, "wins with:", player2, " points !")
    outputscore(username2,player2,"dicescore.txt")
  end
end

function dicescore()
  readscore("dicescore.txt")
end