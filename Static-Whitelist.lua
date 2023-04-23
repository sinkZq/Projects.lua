local m = setmetatable({}, {
	__index = {
		Whitelisted_Hwids = {"4FE74802-5A7E-4A3E-A223-A4875FD5F1BD"},
		Whitelisted_UserIds = {4266349299}
	}
})

local function IsWhitelisted(Argument : boolean): ()
	assert(type(Argument) == "boolean", "Boolean type required")
	if Argument == true 
		return true
	elseif Argument == false
		return false
	end
end

if table.find(m.Whitelisted_Hwids, game:GetService("RbxAnalyticsService"):GetClientId()) then
	return IsWhitelisted(true)
end

if IsWhitelisted() then
	print("Whitelisted")
else
	print("Not Whitelisted")
end
