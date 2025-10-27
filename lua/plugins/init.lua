return {
	{
		'sunnytamang/neodoc.nvim',
		config = function()
			require('neodoc').setup({
				keymap = '<leader>g',
				docstring_style = 'numpy'
			})
		end
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- toujours la dernière version stable
		dependencies = {
		  "nvim-lua/plenary.nvim",
		},
		opts = {
		  workspaces = {
			{
			  name = "notes",
			  path = "C:/Users/davidd/Desktop/work", -- adapte le chemin
			},
		  },

		  templates = {
			  folder = "C:/Users/davidd/modele_obsi",
			  date_format = "%Y-%m-%d-%a",
			  time_format = "%H:%M",
		  },
		},
  	},
	{
	  "GCBallesteros/jupytext.nvim",
	  config = true,
	  -- Depending on your nvim distro or config you may need to make the loading not lazy
	  -- lazy=false,
	},
	{
		"arminveres/md-pdf.nvim",
		branch = "main", -- you can assume that main is somewhat stable until releases will be made
		lazy = true,
		keys = {
			{
				"<leader>gr",
				function()
					require("md-pdf").convert_md_to_pdf()
				end,
				desc = "Markdown preview",
			},
		},
		---@type md-pdf.config
		opts = {},
	},
	-- MARKS
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},
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
		"Mofiqul/vscode.nvim",
		"katawful/kat.nvim",
		"rebelot/kanagawa.nvim",
		"ptdewey/monalisa-nvim",
	},
	{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"Biscuit-Theme/nvim",
		as = "biscuit",
	},
	{
		"everviolet/nvim",
		name = "evergarden",
		priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
		opts = {
			theme = {
				variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
				accent = "green",
			},
			editor = {
				transparent_background = false,
				sign = { color = "none" },
				float = {
					color = "mantle",
					invert_border = false,
				},
				completion = {
					color = "surface0",
				},
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "catppuccin/nvim", name = "catppuccin" },
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
	{ "nvim-treesitter/nvim-treesitter", dependencies = { "OXY2DEV/markview.nvim" }, lazy = false },
	-- Mardown
	-- {
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	-- 	opts = {},
	-- },
	{
		"OXY2DEV/markview.nvim",
		lazy = false,

		priority = 49,
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
	-- DAP
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	-- Fold
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup({
				open_fold_hl_timeout = 150,
				close_fold_kinds_for_ft = {
					["*"] = { "imports", "comment" },
				},
				preview = {
					mappings = {
						scroll_down = "<C-d>",
						scroll_up = "<C-u>",
					},
				},
			})

			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.fillchars = [[eob: ,foldclose:>,foldopen:v,fold: ,foldsep: ]]
		end,
	},
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {
			-- your options here
		},
	},
}
