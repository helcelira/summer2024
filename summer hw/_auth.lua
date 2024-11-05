--login and register functions
regfail = 0
logfail = 0
logsuccess = 0
function log() --logs the player into the game
  print("please enter your username")
  local username = io.read()
  print("please enter your password (case sensitive)")
  local password = io.read()
  if authread(authformat(username,password)) == true then
    return true
  else
    return false
  end
end

function reg() --registers a new player
  print("please note that new usernames must not be duplicates of existing usernames")
  print("new usernames must only be alphabetic and passwords must also not contain symbols")
  local regfail = 0
  print("please enter a new username")
  local newusername = io.read()
  print("please enter a new password")
  local newpassword = io.read()
  
  local isduplicate = namecheck(newusername) --input validation
  local hassymbols = symbolcheck(newpassword)
  local hassymbols2 = symbolcheck(newpassword)
  if isduplicate == true then
    print("please pick another username")
    print("returning user to main menu...")
    regfail = 1
    return
  
  elseif hassymbols == true then
    print("please pick another username")
    print("returning user to main menu...")
    regfail = 1
    return
  
  elseif hassymbols2 == true then
    print("please enter another password")
    print("returning user to main menu...")
    regfail = 1
    return
  else 
    authwrite(authformat(newusername,newpassword))
    print("registration successful!")
    print("returning user to main menu...")
    regfail = 1
  end
  if regfail == 1 then
    return false
  end
end

-- auth functions
function authwrite(newpasskey) --writes passkey into auth.txt
  local output = io.open("auth.txt", "a")
  io.output(output)
  io.write(newpasskey)
  io.close(output)
end

function authread(input) --checks for matches in auth.txt
  local passkeys = {}
  for line in io.lines("auth.txt") do
    table.insert(passkeys, line)
  end
  for _, x in ipairs(passkeys) do
    if x == input then
      return true
    end
  end
      return false
end

function symbolcheck(text) --checks for symbols in username/password
  if string.find(text,"%A") then
    return false
  end
end

function namecheck() --checks for duplicates of username for registering purposes
    local passkeys = {}
  for line in io.lines("auth.txt") do
    table.insert(passkeys, line) --creates table with lines in auth.txt
  end
  for _, x in ipairs(passkeys) do
    local username = string.sub(entry,1,string.find(x,"/")-1) --removes "/" and password
    if username == input then
      return true
    end
  end
      return false
end
  
function authformat(newusername,newpassword) --formats username and password into a single line
  return newusername .. "/" .. newpassword
end
