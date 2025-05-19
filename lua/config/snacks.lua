local M = {}

-- Options
M.opts = {
	notifier = {
		enabled = true,
		timeout = 1000,
	},
	dashboard = { enabled = true },
	bigfile = { enabled = true },
	dim = { enabled = true },
	git = { enabled = true },
	indent = { enabled = true },
	picker = { enabled = true },
	explorer = { enabled = true },
	quickfile = { enabled = true },
	rename = { enabled = true },
	scope = { enabled = true },
	toggle = { enabled = true },
	win = { enabled = true },
	words = { enabled = true },
	zen = { enabled = true },

	styles = {
		notification = {
			wo = { wrap = true },
		},
	},
}

-- Snacks
M.keys = {
	-- Top Pickers & Explorer
	{
		"<leader><space>",
		function()
			Snacks.picker.smart()
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>,",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>/",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>:",
		function()
			Snacks.picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<leader>e",
		function()
			Snacks.explorer({ layout = { fullscreen = true, layout = { dropout = false } }, auto_close = true })
		end,
		desc = "Explorer",
	},
	{
		"<leader>q",
		function()
			Snacks.explorer()
		end,
		desc = "Explorer",
	},
	-- find
	{
		"<leader>fc",
		function()
			Snacks.picker.files({
				cwd = vim.fn.stdpath("config"),
				on_show = function()
					vim.cmd.stopinser()
				end,
			})
		end,
		desc = "Find Config File",
	},
	{
		"<leader>fs",
		function()
			Snacks.picker.smart({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>ff",
		function()
			Snacks.picker.files({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Find Files",
	},
	{
		"<leader>fg",
		function()
			Snacks.picker.git_files({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Find Git Files",
	},
	{
		"<leader>fp",
		function()
			Snacks.picker.projects({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Projects",
	},
	-- git
	{
		"<leader>gb",
		function()
			Snacks.picker.git_branches({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Git Branches",
	},
	{
		"<leader>gl",
		function()
			Snacks.picker.git_log({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Git Log",
	},
	{
		"<leader>gs",
		function()
			Snacks.picker.git_status({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Git Status",
	},
	{
		"<leader>gd",
		function()
			Snacks.picker.git_diff({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Git Diff (Hunks)",
	},
	-- Grep
	{
		"<leader>sb",
		function()
			Snacks.picker.lines()
		end,
		desc = "Buffer Lines",
	},
	{
		"<leader>sB",
		function()
			Snacks.picker.grep_buffers()
		end,
		desc = "Grep Open Buffers",
	},
	{
		"<leader>sg",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep",
	},
	-- search 05 59 04 69 20
	{
		'<leader>s"',
		function()
			Snacks.picker.registers()
		end,
		desc = "Registers",
	},
	{
		"<leader>s/",
		function()
			Snacks.picker.search_history()
		end,
		desc = "Search History",
	},
	{
		"<leader>sa",
		function()
			Snacks.picker.autocmds()
		end,
		desc = "Autocmds",
	},
	{
		"<leader>sC",
		function()
			Snacks.picker.commands()
		end,
		desc = "Commands",
	},
	{
		"<leader>sd",
		function()
			Snacks.picker.diagnostics({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Diagnostics",
	},
	{
		"<leader>sD",
		function()
			Snacks.picker.diagnostics_buffer({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Buffer Diagnostics",
	},
	{
		"<leader>sh",
		function()
			Snacks.picker.help()
		end,
		desc = "Help Pages",
	},
	{
		"<leader>sH",
		function()
			Snacks.picker.highlights()
		end,
		desc = "Highlights",
	},
	{
		"<leader>si",
		function()
			Snacks.picker.icons()
		end,
		desc = "Icons",
	},
	{
		"<leader>sj",
		function()
			Snacks.picker.jumps()
		end,
		desc = "Jumps",
	},
	{
		"<leader>sk",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "Keymaps",
	},
	{
		"<leader>sl",
		function()
			Snacks.picker.loclist()
		end,
		desc = "Location List",
	},
	{
		"<leader>sm",
		function()
			Snacks.picker.marks({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Marks",
	},
	{
		"<leader>sp",
		function()
			Snacks.picker.lazy()
		end,
		desc = "Search for Plugin Spec",
	},
	{
		"<leader>sq",
		function()
			Snacks.picker.qflist()
		end,
		desc = "Quickfix List",
	},
	{
		"<leader>su",
		function()
			Snacks.picker.undo({
				on_show = function()
					vim.cmd.stopinsert()
				end,
			})
		end,
		desc = "Undo History",
	},
	{
		"<leader>uC",
		function()
			Snacks.picker.colorschemes({
				confirm = function(picker, item)
					picker:close()
					if item then
						picker.preview.state.colorscheme = nil
						vim.schedule(function()
							vim.cmd("colorscheme " .. item.text)
						end)
						vim.schedule(function()
							local config_file = vim.fn.stdpath("config") .. "/lua/config/theme.lua"
							local content = "vim.cmd('colorscheme " .. item.text .. "')\n"
							local file = io.open(config_file, "w")
							if not file then
								print("Erreur lors de l'ouverture du fihcier: " .. config_file)
								return
							end
							file:write(content)
							file:close()
						end)
					end
				end,
				on_show = function()
					vim.cmd.stopinser()
				end,
			})
		end,
		desc = "Colorschemes",
	},
	-- LSP
	{
		"gd",
		function()
			Snacks.picker.lsp_definitions()
		end,
		desc = "Goto Definition",
	},
	{
		"gD",
		function()
			Snacks.picker.lsp_declarations()
		end,
		desc = "Goto Declaration",
	},
	{
		"gr",
		function()
			Snacks.picker.lsp_references()
		end,
		nowait = true,
		desc = "References",
	},
	{
		"gI",
		function()
			Snacks.picker.lsp_implementations()
		end,
		desc = "Goto Implementation",
	},
	{
		"gy",
		function()
			Snacks.picker.lsp_type_definitions()
		end,
		desc = "Goto T[y]pe Definition",
	},
	{
		"<leader>ss",
		function()
			Snacks.picker.lsp_symbols()
		end,
		desc = "LSP Symbols",
	},
	{
		"<leader>sS",
		function()
			Snacks.picker.lsp_workspace_symbols()
		end,
		desc = "LSP Workspace Symbols",
	},
	-- Other
	{
		"<leader>z",
		function()
			Snacks.zen()
		end,
		desc = "Toggle Zen Mode",
	},
	{
		"<leader>n",
		function()
			Snacks.notifier.show_history()
		end,
		desc = "Notification History",
	},
	{
		"<leader>bd",
		function()
			Snacks.bufdelete()
		end,
		desc = "Delete Buffer",
	},
	{
		"<leader>cR",
		function()
			Snacks.rename.rename_file()
		end,
		desc = "Rename File",
	},
	{
		"<leader>gg",
		function()
			Snacks.lazygit()
		end,
		desc = "Lazygit",
	},
	{
		"<leader>un",
		function()
			Snacks.notifier.hide()
		end,
		desc = "Dismiss All Notifications",
	},
}

-- Initialisation personnalisée (exécutée au chargement du plugin)
M.init = function()
	vim.api.nvim_create_autocmd("User", {
		pattern = "VeryLazy",
		callback = function()
			-- Débogage et personnalisations
			_G.dd = function(...)
				Snacks.debug.inspect(...)
			end
			_G.bt = function()
				Snacks.debug.backtrace()
			end
			vim.print = _G.dd -- Remplace `print` par Snacks

			-- Activer les raccourcis de bascule
			Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
			Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
			Snacks.toggle.diagnostics():map("<leader>uD")
			Snacks.toggle
				.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
				:map("<leader>uc")
			Snacks.toggle.treesitter():map("<leader>uT")
			Snacks.toggle.inlay_hints():map("<leader>uh")
			Snacks.toggle.indent():map("<leader>ug")
			Snacks.toggle.dim():map("<leader>ud")
			Snacks.toggle.words():map("<leader>uw")
		end,
	})
end

return M
