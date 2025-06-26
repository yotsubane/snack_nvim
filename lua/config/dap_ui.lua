local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸", current_frame = "�marker" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				{ id = "repl", size = 0.45 },
				{ id = "console", size = 0.55 },
			},
			size = 10,
			position = "bottom",
		},
	},
	expand_lines = vim.fn.has("nvim-0.7"),
	ignore_missing_adapters = false,
	hidden = { "child_processes", "console" },
	render = {
		max_type_length = nil, -- Can be integer value
	},
})

-- Ouvre l'interface utilisateur de débogage lors du débogage
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>du", dapui.toggle, opts)
