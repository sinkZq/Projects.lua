-- // Variables
local Services, Functions, Tables, Numbers, Userdatas = {}, {}, {}, {}, {}

-- // Initialization function 
local function Init()
	for _, Service in game:GetChildren() do
		local Success, Error = pcall(function()
			table.insert(Services, Service.Name)
		end)
	end
	for FunctionName, Function in getrenv() do
		table.insert(Functions, tostring(FunctionName))
	end
	table.sort(Services) ; table.sort(Functions)
end

Init() 

-- // Constant Value Manipulation function
local function StringManipulation(Request : string, Constant: any, Index : number): () -- // Constant passing is optional
	assert(type(Request) == "string", "Passed Argument Must Be type(string)")
	Request = string.lower(Request)
	local ReWriteToAdd = ""
	if Request == "l" then
		ReWriteToAdd = "local var__" .. Index .. "__" .. tostring(Constant) .. " = "
	end
	if Request == "f" then
		ReWriteToAdd = Constant .. "()" -- // Adding function Memory Address + function Argument passing for eg. pcall(f)
	end
	if Request == "get" then
		ReWriteToAdd = "game:GetService" .. '("' .. tostring(Constant) .. '")'
	end
	return ReWriteToAdd
end

-- // Convert Constant Into Variables function
local function Convert(Constant : any): ()
	if table.find(Services, Constant) then
		for Index, Service in Services do
			if Service:find(Constant, 1) then
				Constant = StringManipulation("l", Constant, Index) .. StringManipulation("get", Constant)
				break
			end
		end
	end
	if table.find(Functions, Constant) then
		for Index, Function in Functions do
			if Function:find(Constant, 1) then
				Constant = StringManipulation("l", Constant, Index) .. StringManipulation("f", Constant)
				break
			end
		end
	end
	if type(Constant) == "number" then
		table.insert(Numbers, Constant) 
		for Index, Number in Numbers do
			if not tostring(Number):find("local", 1) then
				Constant = StringManipulation("l", Constant, math.random(1, 500)) .. tostring(Constant)
				break
			end
		end
	end
	if type(Constant) == "table" then
		table.insert(Tables, Constant)
		for Index, Table in Tables do
			if not tostring(Table):find("local", 1) then
				Constant = StringManipulation("l", "table", math.random(1, 500)) .. tostring(Constant)
				break
			end
		end
	end
	if type(Constant) == "userdata" then
		table.insert(Userdatas, Constant) 
		for Index, Userdata in Userdatas do
			if not tostring(Userdata):find("local", 1) then
				Constant = StringManipulation("l", "userdata", math.random(1, 500)) .. tostring(Constant)
				break
			end
		end
	end
	return Constant
end

-- // Output Recieved Constant function
local function Output(Constant : string): ()
	if not tostring(Constant):find("local", 1) then -- // Retrieves slacking constants ( typical case would be custom strings )
		Constant = StringManipulation("l", Constant, math.random(1, 500)) .. '"' .. tostring(Constant) .. '"'
	end
	return Constant
end

-- // Example of How To Use It
for i,v in getgc(false) do
	if type(v) == "function" and islclosure(v) and getinfo(v).source:find("Replicated", 1) then
		for i2,v2 in getconstants(v) do
			print(Output(Convert(v2))) 
		end
	end
end
