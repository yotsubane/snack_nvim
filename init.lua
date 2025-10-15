vim.opt.termguicolors = true
require("config.lazy")
require("config.theme")
require("config.notebook")
require("config.options")
require("config.mason")
require("config.harpoon")
require("config.iron")
-- require("config.markdown")
require("config.split")
require("config.line")
require("config.dap")
require("config.dap_ui")
require("config.noerrors")
-- PYDOC
local pydoc = require("pydoc")

pydoc.setup()
-- RUN MODULE
require("runmodule").setup({
	keymap = "<leader>rm",
	popup = {
		width = 100,
		height = 40,
		border = "single",
	},
})
--
vim.keymap.del("n", "gc")
vim.keymap.del("n", "<leader>lp")
