return {
	-- Snacks
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = require("config.snacks").opts,
		keys = require("config.snacks").keys,
		init = require("config.snacks").init,
	},
	-- Themes
	{ "zootedb0t/citruszest.nvim" },
	{
		"Biscuit-Theme/nvim",
		as = "biscuit",
	},
	-- Transparency
	{ "xiyaowong/transparent.nvim" },
	-- Mini
	{ "echasnovski/mini.nvim" },
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	-- Linter
	{
		"mfussenegger/nvim-lint",
	},
	-- Formater
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	-- Which key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- TODO
	{
		"Hashino/doing.nvim",
		cmd = "Do",
		keys = {
			{
				"<leader>da",
				function()
					require("doing").add()
				end,
				{ desc = "Add Do" },
			},
			{
				"<leader>dn",
				function()
					require("doing").done()
				end,
				{ desc = " Done " },
			},
			{
				"<leader>de",
				function()
					require("doing").edit()
				end,
				{ desc = " Do edit" },
			},
		},
	},
	-- line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Iron
	{ "Vigemus/iron.nvim" },
	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter" },
	-- Mardown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
}
