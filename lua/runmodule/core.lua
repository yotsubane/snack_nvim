-- runmodule/core.lua
local M = {}

local config = require("runmodule.config")
local utils = require("runmodule.utils")
local Snacks = require("snacks")

M.win = nil
local current_line_idx = 0
local is_updating_line = false

local function process_lines(buf, lines_acc, data)
	if not data then
		return
	end

	for _, line in ipairs(data) do
		if line and line ~= "" then
			-- Détecter si c'est une mise à jour de ligne (contient \r ou commence par \r)
			local has_carriage_return = line:find("\r")

			if has_carriage_return then
				-- Séparer par \r pour gérer les mises à jour multiples
				local parts = vim.split(line, "\r", { plain = true })

				for i, part in ipairs(parts) do
					if part ~= "" then
						if i == 1 and not line:match("^\r") then
							-- Premier part sans \r au début = nouvelle ligne normale
							table.insert(lines_acc, part)
							current_line_idx = #lines_acc
						else
							-- Mise à jour de la ligne courante
							if current_line_idx > 0 and current_line_idx <= #lines_acc then
								lines_acc[current_line_idx] = part
							else
								table.insert(lines_acc, part)
								current_line_idx = #lines_acc
							end
						end
					end
				end
				is_updating_line = true
			else
				-- Ligne normale
				if is_updating_line then
					-- Si on était en train de mettre à jour, cette nouvelle ligne termine la mise à jour
					is_updating_line = false
				end

				-- Wrap si la ligne dépasse la limite
				local wrap_limit = 100
				while #line > wrap_limit do
					local part = line:sub(1, wrap_limit)
					table.insert(lines_acc, part)
					line = line:sub(wrap_limit + 1)
				end
				table.insert(lines_acc, line)
				current_line_idx = #lines_acc
			end
		end
	end

	vim.schedule(function()
		if vim.api.nvim_buf_is_valid(buf) then
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines_acc)

			-- Auto-scroll vers le bas si on n'est pas en train de mettre à jour une ligne
			if M.win and not is_updating_line then
				local win_id = M.win.win
				if win_id and vim.api.nvim_win_is_valid(win_id) then
					vim.api.nvim_win_set_cursor(win_id, { #lines_acc, 0 })
				end
			end
		end
	end)
end

function M.run_current_module()
	local file = vim.fn.expand("%:p")
	local cwd = vim.fn.getcwd()
	local relpath = vim.fn.fnamemodify(file, ":~:.")
	local module = utils.get_module_name(relpath)

	local cmd = { config.options.command, "-u", "-m", module }

	local buf = vim.api.nvim_create_buf(false, true)

	-- Reset des variables
	current_line_idx = 0
	is_updating_line = false

	M.win = Snacks.win({
		title = "▶️ Module: " .. module,
		minimal = true,
		width = config.options.popup.width or 0.8,
		height = config.options.popup.height or 0.6,
		border = config.options.popup.border or "rounded",
		filetype = config.options.popup.filetype or "plaintext",
		buf = buf,
		keys = {
			q = "close",
			["<Esc>"] = "close",
		},
	})

	local lines = {}

	vim.fn.jobstart(cmd, {
		stdout_buffered = false,
		stderr_buffered = false,
		pty = true, -- Important pour capturer les caractères de contrôle
		on_stdout = function(_, data)
			process_lines(buf, lines, data)
		end,
		on_stderr = function(_, data)
			if data then
				for _, line in ipairs(data) do
					if line ~= "" then
						table.insert(lines, "[stderr] " .. line)
						current_line_idx = #lines
					end
				end
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(buf) then
						vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
					end
				end)
			end
		end,
		on_exit = function(_, code)
			is_updating_line = false
			table.insert(lines, "")
			table.insert(lines, "[Process exited with code: " .. code .. "]")
			vim.schedule(function()
				if vim.api.nvim_buf_is_valid(buf) then
					vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
				end
			end)
		end,
	})
end

function M.copy_run_command()
    local file = vim.fn.expand("%:p")
    local relpath = vim.fn.fnamemodify(file, ":~:.")
    local module = utils.get_module_name(relpath)

    local cmd = { config.options.command, "-u", "-m", module }
    local cmd_str = table.concat(cmd, " ")

    -- Copier dans le presse-papier
    vim.fn.setreg("+", cmd_str) -- Utilise le registre système (nécessite +clipboard)
    vim.fn.setreg("", cmd_str) -- Et le registre par défaut

    -- Feedback visuel
    vim.notify("Commande copiée : " .. cmd_str, vim.log.levels.INFO, { title = "runmodule" })
end

function M.setup_keymaps()
    vim.keymap.set("n", config.options.keymap, M.run_current_module, {
        desc = "Exécuter le module Python courant",
    })
    -- Nouveau raccourci pour copier la commande
    vim.keymap.set("n", "<leader>C", M.copy_run_command, {
        desc = "Copier la commande d'exécution du module",
    })
end

return M
