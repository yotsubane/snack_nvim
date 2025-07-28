-- runmodule/init.lua
local M = {}

local config = require("runmodule.config")
local core = require("runmodule.core")

function M.setup(user_config)
	config.setup(user_config)
	core.setup_keymaps()
end

function M.run()
	core.run_current_module()
end

return M
