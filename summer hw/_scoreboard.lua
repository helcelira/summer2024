function checkscore(value, filename) --checks for scores lower than current score
  local entries = {}
  for line in io.lines(filename) do
    table.insert(entries, tonumber(string.match(value,"%d+")) )
  end
  if #entries == 0 then
    return true
  end
  
  for _, score in ipairs(entries) do
    if value < score then
      return false
    end
  end
  return true
end

function cleanscore(filename)
  local output = io.open(filename)
  local dirty = {}
  local clean = {}
  local clean1 = {}
  local clean2 = {}
  for x in io.lines(filename) do
    table.insert(dirty, x)
  end
  for _,x in dirty do
    table.insert(clean,string.gmatch(x, '%S+$'))
  end
  for _,y in dirty do
    table.insert(clean1,string.gmatch("%w+"))
  end
  table.sort(clean,"")
  for m,x,y in clean do
    table.insert(clean2, "player"..clean[m].."won with"..clean[1][m].."\n")
  end
end

function outputscore(username, score, filename) --writes score to highscore
  local output = io.open(filename, "a")
  if checkscore(score, filename) == true then
    local highscore = "player " .. username .. " won with" .. score .. "\n"
    output:write(highscore)
    output:close()
  end
end

function readscore(filename) --dumps xscore.txt to console
  local output = io.open(filename, "r")
  local dump = output:read("*all")
  print(dump)
  output:close()
end