local M = {}

M.defaults = {
	keymap = "<leader>P",
	command = "python -m pydoc",
	popup = {
		width = 110,
		height = 50,
		border = "rounded",
		filetype = "markdown",
	},
}

M.options = {}

function M.setup(user_config)
	M.options = vim.tbl_deep_extend("force", M.defaults, user_config or {})
end

return M
