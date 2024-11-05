require("_scoreboard")
function registersong(formattedsong)
  local song = io.open("songgame.txt","a")
  song:write(formattedsong .. "\n")
  song:close()
end

function formatsong(song,artist)
  if checksong(song) and checksong(artist) == true then
    return song .. "/" .. artist
  end
end

function symbolcheck(text) --checks for symbols
  if string.find(text,"%W") then
    return false
  end
end

function selectsong(length)
  selected = math.random(1,length)
  local allsongs = {}
  for x in length do
    table.insert(allsongs,x)
  end
  return selected[table.maxn(allsongs)]
end

function listlength()
  local length = 0
  for _ in io.lines'songgame.txt' do
    length = length + 1
  end
  return length
end

function newsong()
  print("Enter new song name")
  local songname = io.read()
  print("Enter new artist name")
  local artist = io.read()
return artist
end

function decodesong(selected)
  local song = string.sub(entry,1,string.find(selected,"/")-1) --retrieves song
  local artist = string.sub(entry,1,string.find(selected,"/")+1)
  return song, artist
end

function formatsong(value)
  local value = string.upper(value)
  local characters = {}
  local formatted = {}
  local nexttrue = 0
  for i,char in ipairs(value) do
      table.insert(characters, i, char)
  end
  for i,_ in characters do
    if i == 1 then
      table.insert(formatted, char[i])
    end
    if string.gmatch("%w") == true then
      nexttrue = 1
    end
    if nexttrue == 1 then
      table.insert(formatted, char[i])
      nexttrue = 0
    end
    if nexttrue == 0 then
      table.insert(formatted, "_")
    end
  end
  formatted = table.concat(formatted)
  return formatted
end

function songgame()
  local score = 0
  local tries = 2
  math.randomseed(os.time)
  local length = listlength() --takes account of the length of list
    local selected = selectsong(length)
    song, artist = decodesong(selected)
    formattedsong = formatsong(song)
  while tries > 0 do
    if try == true then
      print("Song name: "..formattedsong)
      print("Artist name: "..artist)
      print("Guess the name of the Song below:")
      answer = string.lower(io.read())
      song = string.lower(song)
    end
    if answer == song then
      if tries == 3 then
        print("You have correctly guessed the name of the song!")
        score = score + 2
        try = true
      else
        print("You have guessed the right answer on the second try!")
        score = score + 1
        try = true
      end
    elseif tries >= 0 then
        print("Please try again!")
        tries = tries - 1
        try = false
    else
        print("Game Over! Tries have been exhausted.")
        try = false
    end
  end
end

function songscore()
  readscore("songscore.txt")
end