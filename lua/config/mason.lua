-- ✅ Installer Mason et configurer les LSPs
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})


require("lspconfig").pyright.setup({}) -- LSP pour Python
require("lspconfig").denols.setup({}) -- LSP pour TypeScript/JavaScript (Deno)
require("lspconfig").lua_ls.setup({}) -- LSP pour Lua
require("lspconfig").marksman.setup({}) -- LSP pour Markdown
require("lspconfig").r_language_server.setup({}) -- LSP pour R

-- 🔍 Linting automatique avec flake8 / eslint
require("lint").linters_by_ft = {
	python = { "flake8" },
	javascript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	pattern = "*.{py,js}",
	callback = function()
		require("lint").try_lint()
	end,
})

-- 🖊️ Formatage automatique avec conform.nvim
require("conform").setup({
	async = true,
	format_on_save = {
		-- Activer sur les fichiers correspondants à formatters_by_ft
		timeout_ms = 2000,
	},
	formatters_by_ft = {
		python = { "black" },
		javascript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		lua = { "stylua" },
	},
	-- Définir ici des options personnalisées si nécessaire
	formatters = {
		black = {
			prepend_args = { "--line-length", "78" },
		},
		prettier = {
			prepend_args = { "--tab-width", "4" },
		},
	},
})
