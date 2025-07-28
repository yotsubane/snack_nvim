-- Création du Module
local M = {}

local config = require("pydoc.config")
local core = require("pydoc.core")

function M.setup(user_config)
	config.setup(user_config)
	core.setup_keymaps()
end

function M.show()
	core.show_pydoc()
end

return M
