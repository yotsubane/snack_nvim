-- ../nvim/pydoc/core.lua
local M = {}

local config = require("pydoc.config")
local utils = require("pydoc.utils")
local Snacks = require("snacks")

M.win = nil

function M.show_pydoc()
	local word = vim.fn.expand("<cword>")
	if not word or word == "" then
		vim.notify("Aucun mot sous le curseur", vim.log.levels.WARN)
		return
	end

	local cmd = config.options.command
	local output = vim.fn.system(cmd .. " " .. word)
	if vim.v.shell_error ~= 0 then
		vim.notify("Erreur lors de l'exécution : " .. cmd .. " " .. word, vim.log.levels.ERROR)
		return
	end

	if M.win and M.win:buf_valid() and M.win:win_valid() then
		M.win:close()
	end

	M.win = Snacks.win({
		title = "🐍 PyDoc: " .. word,
		minimal = true,
		width = config.options.popup.width or 0.8,
		height = config.options.popup.height or 0.6,
		border = config.options.popup.border or "rounded",
		filetype = config.options.popup.filetype or "markdown",
		text = vim.split(output, "\n"),
		keys = {
			q = "close",
			["<Esc>"] = "close",
			["<CR>"] = function(self)
				self:close()
			end,
		},
	})
end

function M.setup_keymaps()
	vim.keymap.set("n", config.options.keymap or "<leader>pd", M.show_pydoc, {
		desc = "Afficher documentation Python pour le mot sous le curseur",
	})
end

return M
