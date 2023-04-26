-- // var to decide wether whitelisted or not
local Whitelisted = false 

-- // giving tables metatables bypasses majority of hookmetamethods // __index, __newindex, __namecall
local StatusTable = setmetatable({}, {
    __index = {
        Whitelisted = {"21EE95CC-BE44-4067-94F0-A18216EF2339", 4266349299},
    }
})

local KeyTable = setmetatable({}, {
    __index = {
        Key = {"wyxzeeysyuawzW"},
    }
})

-- // converting whitelisted bool to a string // output string
local function ConvertBool(value: boolean): ()
    assert(type(value) == "boolean", "boolean required")
    if (value == true) then
        value = "Whitelisted"
    elseif (value == false) then
        value = "Not whitelisted"
    end
    return value
end

-- // anti hooks // http spies
task.spawn(function()
    while task.wait(1) do
        local suc1, err1 = pcall(http.request)
        local suc2, err2 = pcall(game.HttpGet)

        if (suc1 or suc2) or (err1 ~= "bad argument #1 to 'request' (expected table, got nil)" or err2 ~= "bad argument #1 to 'httpget' (expected userdata, got nil)") then
            game:GetService("Players").LocalPlayer:Kick("HTTP SPY")
        end
    end
end)

if (type(getgenv().Key) ~= "string") then
    Whitelisted = false  
end

-- // checking user whitelist // key
if (getgenv().Key ~= KeyTable.Key[1]) then
    Whitelisted = false
else
    Whitelisted = true
end

-- // hardware-id
if (StatusTable.Whitelisted[1] ~= game:GetService("RbxAnalyticsService"):GetClientId()) then
    Whitelisted = false
else
    Whitelisted = true
end

-- // user-id
if (StatusTable.Whitelisted[2] ~= game:GetService("Players").LocalPlayer.UserId) then
    Whitelisted = false
else
    Whitelisted = true  
end

print(ConvertBool(Whitelisted))
