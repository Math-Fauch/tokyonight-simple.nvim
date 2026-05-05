-- Tokyonight Storm palette
-- Source: https://github.com/folke/tokyonight.nvim
local M = {}

M.colors = {
	-- Backgrounds
	bg              = "#24283b",
	bg_dark         = "#1f2335",
	bg_highlight    = "#292e42",
	bg_visual       = "#2e3c64",
	bg_search       = "#3d59a1",
	bg_float        = "#1f2335",
	bg_statusline   = "#1f2335",
	bg_sidebar      = "#1f2335",
	bg_popup        = "#1f2335",

	-- Foregrounds
	fg              = "#c0caf5",
	fg_dark         = "#a9b1d6",
	fg_gutter       = "#3b4261",
	fg_comment      = "#565f89",

	-- Greys
	dark3           = "#545c7e",
	dark5           = "#737aa2",
	terminal_black  = "#414868",

	-- Accents (used sparingly, alabaster-style)
	blue            = "#7aa2f7",
	cyan            = "#7dcfff",
	cyan_bright     = "#b4f9f8",
	teal            = "#1abc9c",
	green           = "#9ece6a",
	green_bright    = "#73daca",
	yellow          = "#e0af68",
	orange          = "#ff9e64",
	red             = "#f7768e",
	red_error       = "#db4b4b",
	magenta         = "#bb9af7",
	purple          = "#9d7cd8",

	-- Diff
	diff_add        = "#20303b",
	diff_change     = "#1f2231",
	diff_delete     = "#37222c",
	diff_text       = "#394b70",

	-- Git
	git_add         = "#449dab",
	git_change      = "#6183bb",
	git_delete      = "#914c54",

	none            = "NONE",
}

return M.colors
