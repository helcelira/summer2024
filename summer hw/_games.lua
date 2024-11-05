require "_auth"
require "_scoreboard"
require "songgame"
require "cardgame"
require "dicegame"

--menu functions

function menu()
  menu = 1
  while menu > 0 do
    while menu1 == 1 do
      print("Welcome to the game collection!")
      print("Press X to register, Press Y to login")
      choice1 = string.upper(io.read())
      if choice == "Y" then
        success = log()
      elseif success == true then
        menu = 2
      elseif choice == "X" then
      success = reg()
      elseif success == true then
        menu = 2
      else
        print("invalid option, please try again")
      end
    end
    if success == false then
      print("Registration/Login failure, Please try again")
    end
    if choice3 == true then
      choice = 0
    end
  end
    if logsuccess == 1 then
      print("Welcome, player "..username)
      print("Press X to play the song game!")
      print("Press Y to play the card game!")
      print("Press Z to play the board game!")
      choice2 = string.upper(io.read())
    end
  while menu2 == 2 do
    if choice2 == "X" then
      song()
      choice3 = discretion()
    elseif choice2 == "Y" then
      card()
      choice3 = discretion()
    elseif choice2 == "Z" then
      dice()
      choice3 = discretion()
    else
      print("invalid option, please try again")
    end
    if choice3 == true then
      menu = 1
    end
  end
end

function discretion()
  print("Do you want to log out? Press X to logout, Press any character to remain")
  discretion = string.upper(io.read())
  if discretion == "X" then
    return true
  else
    return false
  end
end

function song()
  local songchoice = nil
  print("Press X to enter a new song")
  print("Press Y to play a game of song matching")
  print("Press Z to print the highscore table")
  if choice == "Y" then
    songgame()
    print("Thanks for playing!")
  end
  if choice == "X" then
    newsong()
  end
  if choice == "Z" then
    songscore()
  end
end

function card()
  local cardchoice = nil
  print("Press Y to play a game of cards")
  print("Press Z to print the highscore table")
  if choice == "Y" then
    cardgame()
    print("Thanks for playing!")
  end
  if choice == "Z" then
    cardscore()
  end
end

function dice()
  local dicechoice = nil
  print("Press Y to play a game of dice rolling")
  print("Press Z to print the highscore table")
  if choice == "Y" then
    dicegame()
    print("Thanks for playing!")
  end
  if choice == "Z" then
    dicescore()
  end
end

menu()