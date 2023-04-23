local HwidTable = setmetatable({}, {
	__index = {
		Whitelisted_Hwids = {"4FE74802-5A7E-4A3E-A223-A4875FD5F1BD"},
	}
})

local KeyTable = setmetatable({}, {
	__index = {
		Keys = {HwidTable.Whitelisted_Hwids[1] = "wyxzeeysyuawzW"},
	}
})


if table.find(HwidTable.Whitelisted_Hwids, game:GetService("RbxAnalyticsService"):GetClientId()) then
	print("Whitelisted")
else
	print("Not Whitelisted")
end
