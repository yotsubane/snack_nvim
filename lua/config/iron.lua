local iron = require("iron.core")
local view = require("iron.view")
local common = require("iron.fts.common")

local function open_image(file)
	if vim.fn.filereadable(file) == 1 then
		local absolute_path = vim.fn.fnamemodify(file, ":p")
		if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
			vim.fn.system('start "" ' .. vim.fn.shellescape(absolute_path))
		elseif vim.fn.has("unix") == 1 then
			vim.fn.system("xdg-open " .. vim.fn.shellescape(absolute_path))
		elseif vim.fn.has("mac") == 1 then
			vim.fn.system("open " .. vim.fn.shellescape(absolute_path))
		else
			print("Plateforme non prise en charge.")
		end
	else
		print("Fichier introuvable : " .. file)
	end
end

iron.setup({
	config = {
		scratch_repl = true,
		repl_definition = {
			sh = {
				command = { "zsh" },
			},
			python = {
				command = { "ipython" },
				format = common.bracketed_paste_python,
				block_dividers = { "# %%", "#%%" },
			},
		},
		repl_filetype = function(bufnr, ft)
			return ft
		end,
		repl_open_cmd = view.split.vertical("30%"),
		-- repl_open_cmd = view.split.vertical.botright("30%"),

		callback = function()
			local image_path = "plot.png"

			vim.defer_fn(function()
				open_image(image_path)
			end, 2000)
		end,
	},
	keymaps = {
		toggle_repl = "<space>rr",
		restart_repl = "<space>rR",
		send_motion = "<space>ic",
		visual_send = "<space>ic",
		send_file = "<space>if",
		send_line = "<space>il",
		send_paragraph = "<space>ip",
		send_until_cursor = "<space>iu",
		send_mark = "<space>im",
		send_code_block = "<space>ib",
		send_code_block_and_move = "<space>in",
		mark_motion = "<space>mc",
		mark_visual = "<space>mc",
		remove_mark = "<space>md",
		cr = "<space>i<cr>",
		interrupt = "<space>i<space>",
		exit = "<space>iq",
		clear = "<space>cl",
	},
	highlight = {
		italic = true,
	},
	ignore_blank_lines = true,
})

vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
