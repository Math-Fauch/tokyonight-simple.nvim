-- tokyonight-simple
-- Tokyonight palette (Storm dark / Day light), alabaster-style minimal highlighting.

local M = {}

local function set_terminal_colors(c)
	vim.g.terminal_color_0  = c.bg
	vim.g.terminal_color_1  = c.red
	vim.g.terminal_color_2  = c.green
	vim.g.terminal_color_3  = c.yellow
	vim.g.terminal_color_4  = c.blue
	vim.g.terminal_color_5  = c.magenta
	vim.g.terminal_color_6  = c.cyan
	vim.g.terminal_color_7  = c.fg_dark
	vim.g.terminal_color_8  = c.terminal_black
	vim.g.terminal_color_9  = c.red
	vim.g.terminal_color_10 = c.green
	vim.g.terminal_color_11 = c.yellow
	vim.g.terminal_color_12 = c.blue
	vim.g.terminal_color_13 = c.magenta
	vim.g.terminal_color_14 = c.cyan
	vim.g.terminal_color_15 = c.fg
end

---@param style? "dark"|"light" (default "dark")
function M.load(style)
	style = style or "dark"

	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	if style == "light" then
		vim.g.colors_name = "tokyonight-simple-light"
		vim.o.background = "light"
	else
		vim.g.colors_name = "tokyonight-simple"
		vim.o.background = "dark"
	end

	local c = style == "light" and require("tokyonight-simple.palette_light")
		or require("tokyonight-simple.palette")

	set_terminal_colors(c)

	local highlights = require("tokyonight-simple.highlights").get(c)
	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
