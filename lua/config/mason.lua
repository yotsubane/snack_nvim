-- ============================== Mason UI =============================
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- ============================ LSP servers ============================
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "denols",
    "lua_ls",
    "marksman",
    -- "r_language_server",
    "sqlls",
  },
})

-- Config des LSP


vim.lsp.config('pyright', {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

vim.lsp.config('denols', {})
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
})
vim.lsp.config('marksman', {})
vim.lsp.config('sqlls', {})

-- Active tout ce que tu as configuré ci-dessus
vim.lsp.enable('pyright')
vim.lsp.enable('denols')
vim.lsp.enable('lua_ls')
vim.lsp.enable('marksman')
vim.lsp.enable('sqlls')


-- ============================= Linting ===============================
require("lint").linters_by_ft = {
	python = { "flake8" },
	javascript = { "eslint" },
	sql = { "sqlfluff" },
}

-- Lint en continu : sur sauvegarde ET à chaque sortie du mode insertion
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	pattern = "*.py",
	callback = function()
		require("lint").try_lint()
	end,
})

-- =========================== Formatting ==============================
require("conform").setup({
  async = true,
  formatters_by_ft = {
    -- python = { "ruff_format" },
	python = {"black"},
    javascript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    lua = { "stylua" },
    sql = { "sql_formatter" },
  },
  formatters = {
    -- ruff_format = {
    --   command = "ruff",
    --   args = { "format", "-" },
    --   stdin = true,
    -- },
	black = {
		prepend_args = { "--line-length", "60"},
	},
    prettier = {
      prepend_args = { "--tab-width", "4" },
    },
    sql_formatter = {
      command = "sql-formatter",
      args = { "--language", "tsql" },
      stdin = true,
    },
  },
})

-- Commande de formatage
vim.api.nvim_create_user_command("Format", function()
  require("conform").format({ async = true })
end, {})

vim.keymap.set("n", "<leader>F", ":Format<CR>", { desc = "Format current buffer" })

-- ========================= Diagnostics =============================
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- ========================= Pyright config (important !) ==============
-- Ajoute dans la racine de ton projet Python un fichier "pyrightconfig.json" :
-- {
--   "exclude": ["**/node_modules", "**/.venv", "**/env", "**/venv", "**/__pycache__", ".git", ".mypy_cache", ".pytest_cache"]
-- }
-- Cela accélère l'indexation Pyright et évite les ralentissements dans Neovim.
