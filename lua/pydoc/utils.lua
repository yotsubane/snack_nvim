local M = {}

function M.command_exists(cmd)
	return vim.fn.executable(cmd) == 1
end

function M.format_output(text)
	return text:match("^%s*(.-)%s*$")
end

return M
