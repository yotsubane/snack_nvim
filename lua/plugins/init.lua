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
	{
		"liuchengxu/space-vim-dark",
		"yassinebridi/vim-purpura",
		"ttak0422/morimo",
		"zootedb0t/citruszest.nvim",
		"tomasr/molokai",
		"lissaferreira/dalton-vim",
		"NLKNguyen/papercolor-theme",
		"ayu-theme/ayu-vim",
	},
	{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{
		"Biscuit-Theme/nvim",
		as = "biscuit",
	},
	{ "projekt0n/github-nvim-theme", name = "github-theme" },
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
	-- CSV
	{ "mechatroner/rainbow_csv" },
	-- Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Trouble and todo
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{ "mrjones2014/smart-splits.nvim" },
}
