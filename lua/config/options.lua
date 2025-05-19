-- BASIC
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- Info column
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
-- Line
vim.opt.statusline = "[%{mode()}] %f %y %m %r %= %l,%c "
vim.opt.laststatus = 2
vim.o.cmdheight = 0

-- Yank
local map = vim.keymap.set

-- Yank vers le clipboard système
map({ "n", "v" }, "<C-c>", '"+y')
map({ "n", "v" }, "<C-x>", '"+x')
map({ "n" }, "<tab>", "<c-w>w", { desc = "Go other pane" })

-- Transparent
require("transparent").setup({
	-- table: default groups
	groups = {
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLine",
		"CursorLineNr",
		"StatusLine",
		"StatusLineNC",
		"EndOfBuffer",
		"SnacksPicker",
	},
	-- table: additional groups that should be cleared
	extra_groups = {},
	-- table: groups you don't want to clear
	exclude_groups = {},
	-- function: code to be executed after highlight groups are cleared
	-- Also the user event "TransparentClear" will be triggered
	on_clear = function() end,
})
require("lualine").setup({
	winbar = {
		lualine_a = { require("doing").status },
	},
})
