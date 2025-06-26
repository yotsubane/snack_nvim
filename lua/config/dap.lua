local dap = require("dap")

dap.adapters.python = {
	type = "executable",
	command = "python",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			-- Utilise l'environnement virtuel actif, sinon utilise le Python système par défaut
			local venv = os.getenv("VIRTUAL_ENV")
			if venv then
				return path.join(venv, "Scripts", "python.exe")
			else
				return "python.exe"
			end
		end,
	},
}

local opts = { noremap = true, silent = true }
vim.fn.sign_define("DapBreakpoint", { text = "🐞", texthl = "Error", linehl = "", numhl = "" })
vim.keymap.set("n", "<F5>", dap.continue, opts)
vim.keymap.set("n", "<F10>", dap.step_over, opts)
vim.keymap.set("n", "<F11>", dap.step_into, opts)
vim.keymap.set("n", "<F12>", dap.step_out, opts)
vim.keymap.set("n", "<leader>b", function()
	dap.toggle_breakpoint()
end, opts)
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, opts)
vim.keymap.set("n", "<leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, opts)
vim.keymap.set("n", "<leader>dr", dap.repl.open, opts)
vim.keymap.set("n", "<leader>dl", function()
	dap.run_last()
end, opts)
