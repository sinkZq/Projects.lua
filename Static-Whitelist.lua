local HwidTable = setmetatable({}, {
	__index = {
		Whitelisted = {"4FE74802-5A7E-4A3E-A223-A4875FD5F1BD", 4266349299},
	}
})

local KeyTable = setmetatable({}, {
	__index = {
		Key = {"wyxzeeysyuawzW"},
	}
})

if getgenv().Key ~= KeyTable.Key[1] or HwidTable.Whitelisted[1] ~= game:GetService("RbxAnalyticsService"):GetClientId() or HwidTable.Whitelisted[2] ~= game:GetService("Players").LocalPlayer.UserId then
    print("Not Whitelisted")
else
    print("Whitelisted")
end
