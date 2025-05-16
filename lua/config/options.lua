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


-- Yank
local map = vim.keymap.set

-- Yank vers le clipboard système
map('n', 'y', '"+y')
map('n', 'yy', '"+Y')
-- Coller depuis le clipboard système
map({'n', 'v'}, 'p', '"+p', { desc = 'Paste from system clipboard' })
map({'n', 'v'}, 'P', '"+P', { desc = 'Paste before from system clipboard' })
