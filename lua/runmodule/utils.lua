-- runmodule/utils.lua
local M = {}

function M.get_module_name(filepath)
	-- remove .py, replace slashes with dots
	local module = filepath:gsub("%.py$", ""):gsub("/", "."):gsub("\\", ".")
	return module
end

return M
