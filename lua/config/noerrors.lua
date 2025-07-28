-- init.lua ou diagnostic.lua
local M = {}

function M.setup()
	-- Configuration moderne des diagnostics
	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "✗",
				[vim.diagnostic.severity.WARN] = "⚠",
				[vim.diagnostic.severity.INFO] = "ℹ",
				[vim.diagnostic.severity.HINT] = "💡",
			},
			linehl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticLineError",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticLineNrError",
			},
		},
		virtual_text = {
			prefix = "●",
			spacing = 4,
		},
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = true,
			header = "",
			prefix = "",
		},
	})

	-- Keymaps pour les diagnostics
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set diagnostic loclist" })
end

return M
