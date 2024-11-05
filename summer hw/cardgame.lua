require "_scoreboard"
cards = {} --deck

function dupevalue(value) --check if new value is not already used
  for _, taken in pairs(cards) do
    if value == taken then
      return false
    end
  end
  return true
end

function selspace() --selects a number that is not in table cards, then add said number to table cards
  local x = false
  while x == false do
    local y = math.random(1,30)
    x = dupevalue(y)
    if x == true then
      table.insert(cards,y)
    end
  end
end

function initdeck() -- creates a randomized deck of numbers from 1-30
  for x=1,30 do
    selspace()
  end
end
function tablextract() --extracts number from table, deletes relevant entry and then returns number
  re = cards[1]
  table.remove(cards[1])
end
function translatecard(card) --collosal if statement
  if card <= 10 then
    return "red" .. card, 1 , card
  elseif card <= 20 then
    return "black" .. card, 2, card - 10
  elseif card <= 30 then
    return "yellow" .. card, 3, card - 20
  end
end
function comparecard(card1,card2)  --collosal if statement
  local x = 0
  local y = 0
  
  _, x, card1 = translatecard(card1)
  _, y, card2 = translatecard(card2)
  
  if x == y then
    print("The colours of the cards are the same")
    if card1 > card2 then
      print("card1 is the winner")
      return true
    else
      print("card2 is the winner")
      return false
    end
  end
  if x == 1 and y == 3 then
    return true
  elseif x > y then
    return true
  else
    return false
  end
end

function cardgame(username1, username2)
  math.randomseed(os.time)
  initdeck()
  player1 = {}
  player2 = {}
  for x=1,15 do
    table.insert(player1,tablextract())
    table.insert(player2,tablextract())
    compared = comparecard(player1[x],player2[x])
    if compared == true then
      print("player ", username1, " wins the round!")
      table.insert(player1,player2[x])
      table.remove(player2,x)
    elseif compared == false then
      print("player ", username2, " wins the round!")
      table.insert(player1,player2[x])
      table.remove(player2,x)
    end
  end
  
  if table.maxn(player1) > table.maxn(player2) then
    print("player ", username1, " wins the game!")
    print("Their deck was: ", player1)
    outputscore()
  else
    print("player ", username2, " wins the game!")
    print("Their deck was: ", player2)
    outputscore()
  end
end

function cardscore()
  readscore("cardscore.txt")
end