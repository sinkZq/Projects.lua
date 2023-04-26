-- // var to decide wether whitelisted or not
local WhitelistedSteps = 0 

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
    assert(type(value) == "number", "number required")
    if (value == 4) then
        value = "Whitelisted"
    elseif (value ~= 4) then
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
            game:GetService("Players").LocalPlayer:Kick("hookfunction")
        end
    end
end)

if (type(getgenv().Key) ~= "string") then
    WhitelistedSteps -= 1
else
    WhitelistedSteps += 1
end

-- // checking user whitelist // key
if (getgenv().Key ~= KeyTable.Key[1]) then
    WhitelistedSteps -= 1
else
    WhitelistedSteps += 1
end

-- // hardware-id
if (StatusTable.Whitelisted[1] ~= game:GetService("RbxAnalyticsService"):GetClientId()) then
    WhitelistedSteps -= 1
else
    WhitelistedSteps += 1
end

-- // user-id
if (StatusTable.Whitelisted[2] ~= game:GetService("Players").LocalPlayer.UserId) then
    WhitelistedSteps -= 1
else
    WhitelistedSteps += 1  
end

print(ConvertBool(WhitelistedSteps))
