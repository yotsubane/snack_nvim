-- runmodule/config.lua
local M = {}

M.defaults = {
	keymap = "<leader>R",
	command = "python",
	popup = {
		width = 0.8,
		height = 0.6,
		border = "rounded",
		filetype = "term",
	},
}

M.options = {}

function M.setup(user_config)
	M.options = vim.tbl_deep_extend("force", M.defaults, user_config or {})
end

return M
