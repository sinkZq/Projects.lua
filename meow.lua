-- // Variables
local ScriptName = "A" -- // Name of The Script To Decompile 
local TraceFeedback = false -- // Outputs The Amount of Attempts To Locate Script Trace
local SplitOperator = " "
local ByteTable, AllowedByteDecompileTypes = {}, {"LocalScript", "ModuleScript"}
