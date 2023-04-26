-- // giving tables metatables bypasses majority of hookmetamethods // __index, __newindex, __namecall

local HwidTable = setmetatable({}, {
    __index = {
        Whitelisted = {"21EE95CC-BE44-4067-94F0-A18216EF2339", 4266349299},
    }
})

local KeyTable = setmetatable({}, {
    __index = {
        Key = {"wyxzeeysyuawzW"},
    }
})


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


-- // checking user whitelist // hwid, userid

if getgenv().Key ~= KeyTable.Key[1] or HwidTable.Whitelisted[1] ~= game:GetService("RbxAnalyticsService"):GetClientId() or HwidTable.Whitelisted[2] ~= game:GetService("Players").LocalPlayer.UserId then
    print("Not Whitelisted")
else
    print("Whitelisted")
end
