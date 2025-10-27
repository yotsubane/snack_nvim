
vim.o.updatetime = 700

vim.diagnostic.config({
  virtual_text = false,  -- ❌ plus à droite
  signs = true,          -- ✅ garde les symboles à gauche
  underline = true,      -- souligne les erreurs
  update_in_insert = false,
  severity_sort = true,  -- trie les erreurs par gravité
  virtual_lines = false
})


-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function()
--     vim.lsp.buf.hover()
--   end
-- })
-- OVERLAPPING
vim.opt.shellslash = true
-- FOLD
vim.opt.foldcolumn = "0"
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

require("mini.sessions").setup()

-- Yank
local map = vim.keymap.set

-- Yank vers le clipboard système
map({ "n", "v" }, "<C-y>", '"+y')  -- copier
map("n", "<C-Y>", '"+Y')           -- copier la ligne
map({ "n", "v" }, "<C-p>", '"+p')  -- coller après
map({ "n", "v" }, "<C-P>", '"+P')  -- coller avant
map({ "n", "v" }, "<C-x>", '"+x')  -- couper
map({ "n" }, "<leader>w", "<c-w>w", { desc = "Go other pane" })
map({ "n" }, "<leader>bD", ":%bd|e#<cr>", { desc = "delete other buffers" })
map({ "i" }, "jj", "<ESC>")
map({ "i" }, "jk", "<ESC>")
map({ "n" }, ")m", "]m")
map({ "n" }, "(m", "[m")

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
-- Completion
vim.opt.pumheight = 10
require("mini.completion").setup({
	delay = { completion = 100, info = 100, signature = 50 },
	window = {
		info = { height = 10, width = 50, border = "single" },
		signature = { height = 10, width = 50, border = "single" },
	},

	lsp_completion = {
		source_func = "completefunc",
		auto_setup = true,
		process_items = nil,
		snippet_insert = nil,
	},
	fallback_action = "<C-n>",
	mappings = {
		force_twostep = "<C-Space>",
		force_fallback = "<A-Space>",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},

	set_vim_settings = true,
})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"python",
		"javascript",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
		"regex",
		"sql",
		"csv",
	},
	ignore_install = { "org" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "NeogitStatus", "org", "nvcheatsheet", "neo-tree" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
		vim.opt_local.foldcolumn = "0"
	end,
})
