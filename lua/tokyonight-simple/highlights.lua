-- Highlights for tokyonight-simple
--
-- Philosophy (inspired by alabaster.nvim):
--   * Most syntax uses the default foreground. No rainbow.
--   * Color is reserved for things that genuinely benefit from it:
--       - comments (muted)
--       - strings
--       - constants / numbers / booleans
--       - diagnostics & errors
--   * Keywords, types, variables, functions, operators, punctuation:
--     plain foreground. Function *definitions* are bold instead of colored.
--   * UI chrome (statusline, search, diff, git signs) keeps real colors so
--     the editor remains usable.

local c = require("tokyonight-simple.palette")

local M = {}

function M.get()
	local fg     = c.fg
	local bg     = c.bg
	local none   = c.none

	-- The three "allowed" syntax colors
	local str    = c.green        -- strings
	local const  = c.orange       -- numbers, booleans, named constants
	local cmt    = c.fg_comment   -- comments

	return {
		-- ── Editor UI ──────────────────────────────────────────────────
		Normal            = { fg = fg, bg = bg },
		NormalNC          = { fg = fg, bg = bg },
		NormalFloat       = { fg = fg, bg = c.bg_float },
		FloatBorder       = { fg = c.dark3, bg = c.bg_float },
		FloatTitle        = { fg = fg, bg = c.bg_float, bold = true },

		Cursor            = { fg = bg, bg = fg },
		CursorLine        = { bg = c.bg_highlight },
		CursorColumn      = { bg = c.bg_highlight },
		CursorLineNr      = { fg = c.fg_dark, bold = true },
		LineNr            = { fg = c.fg_gutter },
		SignColumn        = { fg = c.fg_gutter, bg = none },
		FoldColumn        = { fg = c.fg_gutter, bg = none },
		Folded            = { fg = c.dark5, bg = c.bg_highlight },
		ColorColumn       = { bg = c.bg_highlight },
		Conceal           = { fg = c.dark5 },

		VertSplit         = { fg = c.bg_dark },
		WinSeparator      = { fg = c.bg_dark, bold = true },

		StatusLine        = { fg = c.fg_dark, bg = c.bg_statusline },
		StatusLineNC      = { fg = c.fg_gutter, bg = c.bg_statusline },
		TabLine           = { fg = c.dark5, bg = c.bg_statusline },
		TabLineFill       = { bg = c.bg_dark },
		TabLineSel        = { fg = fg, bg = bg, bold = true },
		WinBar            = { fg = c.fg_dark, bg = none },
		WinBarNC          = { fg = c.fg_gutter, bg = none },

		Pmenu             = { fg = fg, bg = c.bg_popup },
		PmenuSel          = { bg = c.bg_visual, bold = true },
		PmenuSbar         = { bg = c.bg_highlight },
		PmenuThumb        = { bg = c.fg_gutter },

		Visual            = { bg = c.bg_visual },
		VisualNOS         = { bg = c.bg_visual },

		Search            = { fg = fg, bg = c.bg_search },
		IncSearch         = { fg = bg, bg = c.orange },
		CurSearch         = { fg = bg, bg = c.orange },
		MatchParen        = { fg = c.orange, bold = true, underline = true },

		QuickFixLine      = { bg = c.bg_visual, bold = true },

		ModeMsg           = { fg = c.fg_dark, bold = true },
		MoreMsg           = { fg = fg },
		MsgArea           = { fg = c.fg_dark },
		WarningMsg        = { fg = c.yellow },
		ErrorMsg          = { fg = c.red_error },
		Question          = { fg = fg },
		Title             = { fg = fg, bold = true },
		Directory         = { fg = fg, bold = true },
		SpecialKey        = { fg = c.dark3 },
		NonText           = { fg = c.fg_gutter },
		EndOfBuffer       = { fg = bg },
		Whitespace        = { fg = c.fg_gutter },

		-- Spell
		SpellBad          = { sp = c.red, undercurl = true },
		SpellCap          = { sp = c.yellow, undercurl = true },
		SpellLocal        = { sp = c.cyan, undercurl = true },
		SpellRare         = { sp = c.magenta, undercurl = true },

		-- ── Syntax (intentionally minimal) ─────────────────────────────
		-- Anything not listed falls back to Normal.
		Comment           = { fg = cmt, italic = true },

		Constant          = { fg = const },
		String            = { fg = str },
		Character         = { fg = str },
		Number            = { fg = const },
		Float             = { fg = const },
		Boolean           = { fg = const },

		Identifier        = { fg = fg },
		Function          = { fg = c.purple, bold = true }, -- function name at def: bold + purple

		Statement         = { fg = fg },
		Conditional       = { fg = fg },
		Repeat            = { fg = fg },
		Label             = { fg = fg },
		Operator          = { fg = fg },
		Keyword           = { fg = fg },
		Exception         = { fg = fg },

		PreProc           = { fg = fg },
		Include           = { fg = fg },
		Define            = { fg = fg },
		Macro             = { fg = fg },
		PreCondit         = { fg = fg },

		Type              = { fg = fg },
		StorageClass      = { fg = fg },
		Structure         = { fg = fg },
		Typedef           = { fg = fg },

		Special           = { fg = fg },
		SpecialChar       = { fg = const },     -- escape sequences pop inside strings
		Tag               = { fg = fg },
		Delimiter         = { fg = fg },
		SpecialComment    = { fg = cmt, italic = true, bold = true },
		Debug             = { fg = c.orange },

		Underlined        = { underline = true },
		Bold              = { fg = c.purple, bold = true },
		Italic            = { italic = true },
		Ignore            = { fg = c.fg_gutter },
		Error             = { fg = c.red_error },
		Todo              = { fg = bg, bg = c.yellow, bold = true },

		-- ── Treesitter (mostly inherit; only the "allowed" colors stand out) ──
		["@comment"]              = { link = "Comment" },
		["@comment.documentation"]= { link = "Comment" },
		["@string"]               = { link = "String" },
		["@string.escape"]        = { fg = const },
		["@string.special"]       = { fg = const },
		["@character"]            = { link = "Character" },
		["@number"]               = { link = "Number" },
		["@float"]                = { link = "Float" },
		["@boolean"]              = { link = "Boolean" },
		["@constant"]             = { link = "Constant" },
		["@constant.builtin"]     = { link = "Constant" },
		["@constant.macro"]       = { link = "Constant" },

		["@variable"]             = { fg = fg },
		["@variable.builtin"]     = { fg = fg, italic = true },
		["@variable.parameter"]   = { fg = fg },
		["@variable.member"]      = { fg = fg },
		["@property"]             = { fg = fg },
		["@field"]                = { fg = fg },

		["@function"]             = { fg = fg },
		["@function.call"]        = { fg = fg },
		["@function.builtin"]     = { fg = fg },
		["@function.macro"]       = { fg = fg },
		["@function.method"]      = { fg = fg },
		["@function.method.call"] = { fg = fg },
		["@constructor"]          = { fg = c.purple, bold = true },

		["@keyword"]              = { fg = fg },
		["@keyword.function"]     = { fg = fg },
		["@keyword.return"]       = { fg = fg },
		["@keyword.operator"]     = { fg = fg },
		["@keyword.import"]       = { fg = fg },
		["@conditional"]          = { fg = fg },
		["@repeat"]               = { fg = fg },
		["@exception"]            = { fg = fg },
		["@operator"]             = { fg = fg },
		["@punctuation"]          = { fg = fg },
		["@punctuation.delimiter"]= { fg = fg },
		["@punctuation.bracket"]  = { fg = fg },
		["@punctuation.special"]  = { fg = fg },

		["@type"]                 = { fg = fg },
		["@type.builtin"]         = { fg = fg },
		["@type.definition"]      = { fg = c.purple, bold = true },
		["@attribute"]            = { fg = fg },
		["@namespace"]            = { fg = fg },
		["@module"]               = { fg = fg },
		["@label"]                = { fg = fg },

		["@tag"]                  = { fg = c.purple, bold = true },
		["@tag.attribute"]        = { fg = fg },
		["@tag.delimiter"]        = { fg = c.dark5 },

		["@text"]                 = { fg = fg },
		["@text.title"]           = { fg = c.purple, bold = true },
		["@text.literal"]         = { fg = str },
		["@text.uri"]             = { fg = c.cyan, underline = true },
		["@text.emphasis"]        = { italic = true },
		["@text.strong"]          = { fg = c.purple, bold = true },
		["@markup.strong"]        = { fg = c.purple, bold = true },
		["@markup.italic"]        = { italic = true },
		["@text.todo"]            = { link = "Todo" },
		["@text.note"]            = { fg = c.blue, bold = true },
		["@text.warning"]         = { fg = c.yellow, bold = true },
		["@text.danger"]          = { fg = c.red, bold = true },

		["@diff.plus"]            = { fg = c.git_add },
		["@diff.minus"]           = { fg = c.git_delete },
		["@diff.delta"]           = { fg = c.git_change },

		-- ── LSP semantic tokens ────────────────────────────────────────
		["@lsp.type.comment"]       = { link = "Comment" },
		["@lsp.type.string"]        = { link = "String" },
		["@lsp.type.number"]        = { link = "Number" },
		["@lsp.type.boolean"]       = { link = "Boolean" },
		["@lsp.type.enumMember"]    = { link = "Constant" },
		["@lsp.type.variable"]      = { fg = fg },
		["@lsp.type.parameter"]     = { fg = fg },
		["@lsp.type.property"]      = { fg = fg },
		["@lsp.type.function"]      = { fg = fg },
		["@lsp.type.method"]        = { fg = fg },
		["@lsp.type.keyword"]       = { fg = fg },
		["@lsp.type.type"]          = { fg = fg },
		["@lsp.type.class"]         = { fg = fg },
		["@lsp.type.struct"]        = { fg = fg },
		["@lsp.type.interface"]     = { fg = fg },
		["@lsp.type.namespace"]     = { fg = fg },
		["@lsp.type.macro"]         = { fg = fg },
		["@lsp.type.operator"]      = { fg = fg },
		["@lsp.typemod.variable.readonly"] = { fg = const },
		["@lsp.typemod.variable.defaultLibrary"] = { fg = fg, italic = true },
		["@lsp.typemod.function.declaration"] = { fg = c.purple, bold = true },
		["@lsp.typemod.method.declaration"]   = { fg = c.purple, bold = true },

		-- ── Diagnostics ────────────────────────────────────────────────
		DiagnosticError           = { fg = c.red_error },
		DiagnosticWarn            = { fg = c.yellow },
		DiagnosticInfo            = { fg = c.blue },
		DiagnosticHint            = { fg = c.teal },
		DiagnosticOk              = { fg = c.green },

		DiagnosticUnderlineError  = { sp = c.red_error, undercurl = true },
		DiagnosticUnderlineWarn   = { sp = c.yellow, undercurl = true },
		DiagnosticUnderlineInfo   = { sp = c.blue, undercurl = true },
		DiagnosticUnderlineHint   = { sp = c.teal, undercurl = true },

		DiagnosticVirtualTextError = { fg = c.red_error, bg = none },
		DiagnosticVirtualTextWarn  = { fg = c.yellow, bg = none },
		DiagnosticVirtualTextInfo  = { fg = c.blue, bg = none },
		DiagnosticVirtualTextHint  = { fg = c.teal, bg = none },

		DiagnosticUnnecessary      = { fg = c.dark3 },
		DiagnosticDeprecated       = { fg = c.dark5, strikethrough = true },

		-- ── LSP references / hover ─────────────────────────────────────
		LspReferenceText           = { bg = c.bg_highlight },
		LspReferenceRead           = { bg = c.bg_highlight },
		LspReferenceWrite          = { bg = c.bg_highlight, bold = true },
		LspSignatureActiveParameter = { fg = c.orange, bold = true },
		LspInlayHint               = { fg = c.dark3, bg = none, italic = true },

		-- ── Diff ───────────────────────────────────────────────────────
		DiffAdd                    = { bg = c.diff_add },
		DiffChange                 = { bg = c.diff_change },
		DiffDelete                 = { bg = c.diff_delete },
		DiffText                   = { bg = c.diff_text },

		diffAdded                  = { fg = c.git_add },
		diffRemoved                = { fg = c.git_delete },
		diffChanged                = { fg = c.git_change },
		diffFile                   = { fg = fg, bold = true },
		diffLine                   = { fg = c.dark5 },
		diffIndexLine              = { fg = c.dark5 },

		-- ── Git signs ──────────────────────────────────────────────────
		GitSignsAdd                = { fg = c.git_add },
		GitSignsChange             = { fg = c.git_change },
		GitSignsDelete             = { fg = c.git_delete },
		GitSignsAddNr              = { fg = c.git_add },
		GitSignsChangeNr           = { fg = c.git_change },
		GitSignsDeleteNr           = { fg = c.git_delete },

		-- ── Telescope ──────────────────────────────────────────────────
		TelescopeNormal            = { fg = fg, bg = c.bg_float },
		TelescopeBorder            = { fg = c.dark3, bg = c.bg_float },
		TelescopePromptBorder      = { fg = c.dark3, bg = c.bg_float },
		TelescopePromptTitle       = { fg = bg, bg = c.orange, bold = true },
		TelescopePreviewTitle      = { fg = bg, bg = c.green, bold = true },
		TelescopeResultsTitle      = { fg = bg, bg = c.blue, bold = true },
		TelescopeSelection         = { bg = c.bg_visual, bold = true },
		TelescopeMatching          = { fg = c.orange, bold = true },

		-- ── NvimTree / neo-tree ────────────────────────────────────────
		NvimTreeNormal             = { fg = c.fg_dark, bg = c.bg_sidebar },
		NvimTreeFolderIcon         = { fg = c.blue },
		NvimTreeFolderName         = { fg = c.fg_dark, bold = true },
		NvimTreeOpenedFolderName   = { fg = fg, bold = true },
		NvimTreeRootFolder         = { fg = c.magenta, bold = true },
		NvimTreeGitDirty           = { fg = c.git_change },
		NvimTreeGitNew             = { fg = c.git_add },
		NvimTreeGitDeleted         = { fg = c.git_delete },
		NvimTreeSpecialFile        = { fg = fg, underline = true },
		NvimTreeIndentMarker       = { fg = c.fg_gutter },

		NeoTreeNormal              = { fg = c.fg_dark, bg = c.bg_sidebar },
		NeoTreeDirectoryName       = { fg = c.fg_dark, bold = true },
		NeoTreeRootName            = { fg = c.magenta, bold = true },
		NeoTreeGitModified         = { fg = c.git_change },
		NeoTreeGitAdded            = { fg = c.git_add },
		NeoTreeGitDeleted          = { fg = c.git_delete },

		-- ── Markdown ───────────────────────────────────────────────────
		markdownH1                 = { fg = c.purple, bold = true },
		markdownH2                 = { fg = c.purple, bold = true },
		markdownH3                 = { fg = c.purple, bold = true },
		markdownCode               = { fg = str },
		markdownCodeBlock          = { fg = str },
		markdownLinkText           = { fg = c.cyan, underline = true },
		markdownUrl                = { fg = c.cyan, underline = true },

		-- ── WhichKey ───────────────────────────────────────────────────
		WhichKey                   = { fg = c.orange, bold = true },
		WhichKeyGroup              = { fg = c.blue },
		WhichKeyDesc               = { fg = fg },
		WhichKeySeparator          = { fg = c.dark3 },
		WhichKeyFloat              = { bg = c.bg_float },
		WhichKeyBorder             = { fg = c.dark3, bg = c.bg_float },
	}
end

return M
