-- Tokyonight Day palette (light)
-- Source: https://github.com/folke/tokyonight.nvim
local M = {}

M.colors = {
	-- Backgrounds
	bg              = "#e1e2e7",
	bg_dark         = "#d0d5e3",
	bg_highlight    = "#c4c8da",
	bg_visual       = "#b7c1e3",
	bg_search       = "#7890dd",
	bg_float        = "#d0d5e3",
	bg_statusline   = "#d0d5e3",
	bg_sidebar      = "#d0d5e3",
	bg_popup        = "#d0d5e3",

	-- Foregrounds
	fg              = "#3760bf",
	fg_dark         = "#6172b0",
	fg_gutter       = "#a8aecb",
	fg_comment      = "#848cb5",

	-- Greys (now blue: only comments stay grey via fg_comment)
	dark3           = "#2e7de9",
	dark5           = "#2e7de9",
	terminal_black  = "#a1a6c5",

	-- Accents (used sparingly, alabaster-style)
	blue            = "#2e7de9",
	cyan            = "#007197",
	cyan_bright     = "#007ea8",
	teal            = "#118c74",
	green           = "#587539",
	green_bright    = "#387068",
	yellow          = "#8c6c3e",
	orange          = "#b15c00",
	red             = "#f52a65",
	red_error       = "#c64343",
	magenta         = "#9854f1",
	purple          = "#7847bd",

	-- Diff
	diff_add        = "#b7ced5",
	diff_change     = "#d5d9e4",
	diff_delete     = "#dababe",
	diff_text       = "#92a6d5",

	-- Git
	git_add         = "#4197a4",
	git_change      = "#506d9c",
	git_delete      = "#c47981",

	none            = "NONE",
}

return M.colors
