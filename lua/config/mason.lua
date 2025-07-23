-- diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- mason setup
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- LSP servers
require("lspconfig").pyright.setup({})
require("lspconfig").denols.setup({})
require("lspconfig").lua_ls.setup({})
require("lspconfig").marksman.setup({})
require("lspconfig").r_language_server.setup({})
require("lspconfig").sqlls.setup({})

-- Linting
require("lint").linters.flake8.args = { "--max-line-length=100" }

require("lint").linters_by_ft = {
	python = { "flake8" },
	javascript = { "eslint" },
	sql = { "sqlfluff" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	pattern = "*.{py,js}",
	callback = function()
		require("lint").try_lint()
	end,
})

-- Formatting
require("conform").setup({
	async = true,
	format_on_save = {
		timeout_ms = 2000,
	},
	formatters_by_ft = {
		python = { "black" },
		javascript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		lua = { "stylua" },
		sql = { "sql_formatter" },
	},
	formatters = {
		black = {
			prepend_args = { "--line-length", "60" },
		},
		prettier = {
			prepend_args = { "--tab-width", "4" },
		},
		sql_formatter = {
			command = "sql-formatter",
			args = {
				"--language",
				"tsql",
			},
			stdin = true,
		},
	},
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
