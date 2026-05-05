-- tokyonight-simple
-- Tokyonight Storm palette, alabaster-style minimal highlighting.

local M = {}

local function set_terminal_colors()
	local c = require("tokyonight-simple.palette")
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

function M.load()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "tokyonight-simple"
	vim.o.background = "dark"

	set_terminal_colors()

	local highlights = require("tokyonight-simple.highlights").get()
	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
