-- Flash Colorscheme for Neovim
-- Dunkelrot mit Gold - passend zu Alacritty & Tmux

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "flash"
vim.o.termguicolors = true

-- Flash Theme Farben
local c = {
  -- Basis
  bg = "#1a0a0a",
  bg_light = "#2a1515",
  bg_lighter = "#4a1a1a",
  bg_selection = "#5c1a1a",

  -- Gold Toene
  gold = "#f0c674",
  gold_bright = "#f0b800",
  gold_dim = "#d4a000",
  yellow = "#e5a800",
  yellow_bright = "#ffd700",

  -- Rot Toene
  red = "#cc2929",
  red_bright = "#ff4444",
  red_dark = "#8b3a3a",
  red_medium = "#a04040",
  red_light = "#b85454",
  magenta = "#cc5555",

  -- Extras
  white = "#fffacd",
  gray = "#6a4a4a",
  none = "NONE",
}

-- Helper function
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
hi("Normal", { fg = c.gold, bg = c.bg })
hi("NormalFloat", { fg = c.gold, bg = c.bg_light })
hi("FloatBorder", { fg = c.red, bg = c.bg_light })
hi("Cursor", { fg = c.bg, bg = c.gold_bright })
hi("CursorLine", { bg = c.bg_light })
hi("CursorColumn", { bg = c.bg_light })
hi("ColorColumn", { bg = c.bg_light })
hi("LineNr", { fg = c.gray })
hi("CursorLineNr", { fg = c.gold_bright, bold = true })
hi("SignColumn", { fg = c.gold, bg = c.bg })
hi("VertSplit", { fg = c.red_dark, bg = c.bg })
hi("WinSeparator", { fg = c.red_dark, bg = c.bg })
hi("Folded", { fg = c.gold_dim, bg = c.bg_light })
hi("FoldColumn", { fg = c.gray, bg = c.bg })
hi("NonText", { fg = c.bg_lighter })
hi("SpecialKey", { fg = c.bg_lighter })
hi("Whitespace", { fg = c.bg_lighter })

-- Statusline
hi("StatusLine", { fg = c.gold_bright, bg = c.red })
hi("StatusLineNC", { fg = c.gold_dim, bg = c.bg_lighter })
hi("WildMenu", { fg = c.bg, bg = c.gold_bright })

-- Tabline
hi("TabLine", { fg = c.gold, bg = c.bg_lighter })
hi("TabLineFill", { bg = c.bg })
hi("TabLineSel", { fg = c.bg, bg = c.gold_bright, bold = true })

-- Suche & Visual
hi("Search", { fg = c.bg, bg = c.gold_bright })
hi("IncSearch", { fg = c.bg, bg = c.yellow_bright })
hi("CurSearch", { fg = c.bg, bg = c.yellow_bright })
hi("Visual", { bg = c.bg_selection })
hi("VisualNOS", { bg = c.bg_selection })

-- Popup Menu
hi("Pmenu", { fg = c.gold, bg = c.bg_light })
hi("PmenuSel", { fg = c.bg, bg = c.gold_bright })
hi("PmenuSbar", { bg = c.bg_lighter })
hi("PmenuThumb", { bg = c.gold })

-- Messages
hi("ErrorMsg", { fg = c.red_bright, bold = true })
hi("WarningMsg", { fg = c.yellow, bold = true })
hi("ModeMsg", { fg = c.gold_bright, bold = true })
hi("MoreMsg", { fg = c.gold_bright })
hi("Question", { fg = c.gold_bright })

-- Diff
hi("DiffAdd", { fg = c.gold_bright, bg = c.bg_light })
hi("DiffChange", { fg = c.yellow, bg = c.bg_light })
hi("DiffDelete", { fg = c.red, bg = c.bg_light })
hi("DiffText", { fg = c.bg, bg = c.gold })

-- Spelling
hi("SpellBad", { undercurl = true, sp = c.red_bright })
hi("SpellCap", { undercurl = true, sp = c.yellow })
hi("SpellLocal", { undercurl = true, sp = c.gold })
hi("SpellRare", { undercurl = true, sp = c.magenta })

-- Diagnostics
hi("DiagnosticError", { fg = c.red_bright })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.gold })
hi("DiagnosticHint", { fg = c.gold_dim })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red_bright })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.gold })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.gold_dim })

-- Syntax Highlighting
hi("Comment", { fg = c.gray, italic = true })
hi("Constant", { fg = c.gold_bright })
hi("String", { fg = c.yellow })
hi("Character", { fg = c.yellow })
hi("Number", { fg = c.gold_bright })
hi("Boolean", { fg = c.gold_bright })
hi("Float", { fg = c.gold_bright })

hi("Identifier", { fg = c.gold })
hi("Function", { fg = c.gold_bright, bold = true })

hi("Statement", { fg = c.red })
hi("Conditional", { fg = c.red })
hi("Repeat", { fg = c.red })
hi("Label", { fg = c.red_light })
hi("Operator", { fg = c.gold })
hi("Keyword", { fg = c.red, bold = true })
hi("Exception", { fg = c.red_bright })

hi("PreProc", { fg = c.red_medium })
hi("Include", { fg = c.red })
hi("Define", { fg = c.red_medium })
hi("Macro", { fg = c.red_medium })
hi("PreCondit", { fg = c.red_medium })

hi("Type", { fg = c.gold_bright })
hi("StorageClass", { fg = c.red })
hi("Structure", { fg = c.gold_bright })
hi("Typedef", { fg = c.gold_bright })

hi("Special", { fg = c.yellow_bright })
hi("SpecialChar", { fg = c.yellow_bright })
hi("Tag", { fg = c.red })
hi("Delimiter", { fg = c.gold })
hi("SpecialComment", { fg = c.gray, bold = true })
hi("Debug", { fg = c.red_bright })

hi("Underlined", { fg = c.gold, underline = true })
hi("Ignore", { fg = c.gray })
hi("Error", { fg = c.red_bright, bg = c.bg, bold = true })
hi("Todo", { fg = c.bg, bg = c.gold_bright, bold = true })

-- Treesitter
hi("@variable", { fg = c.gold })
hi("@variable.builtin", { fg = c.red_light })
hi("@variable.parameter", { fg = c.gold })
hi("@constant", { fg = c.gold_bright })
hi("@constant.builtin", { fg = c.gold_bright })
hi("@module", { fg = c.gold })
hi("@label", { fg = c.red_light })

hi("@string", { fg = c.yellow })
hi("@string.escape", { fg = c.yellow_bright })
hi("@string.regexp", { fg = c.yellow_bright })
hi("@character", { fg = c.yellow })
hi("@number", { fg = c.gold_bright })
hi("@boolean", { fg = c.gold_bright })
hi("@float", { fg = c.gold_bright })

hi("@function", { fg = c.gold_bright, bold = true })
hi("@function.builtin", { fg = c.gold_bright })
hi("@function.call", { fg = c.gold_bright })
hi("@function.method", { fg = c.gold_bright })
hi("@constructor", { fg = c.gold_bright })

hi("@keyword", { fg = c.red, bold = true })
hi("@keyword.function", { fg = c.red })
hi("@keyword.operator", { fg = c.red })
hi("@keyword.return", { fg = c.red })
hi("@keyword.conditional", { fg = c.red })
hi("@keyword.repeat", { fg = c.red })
hi("@keyword.import", { fg = c.red })
hi("@keyword.exception", { fg = c.red_bright })

hi("@operator", { fg = c.gold })
hi("@punctuation", { fg = c.gold })
hi("@punctuation.bracket", { fg = c.gold })
hi("@punctuation.delimiter", { fg = c.gold })
hi("@punctuation.special", { fg = c.yellow_bright })

hi("@type", { fg = c.gold_bright })
hi("@type.builtin", { fg = c.gold_bright })
hi("@attribute", { fg = c.red_medium })
hi("@property", { fg = c.gold })

hi("@comment", { fg = c.gray, italic = true })
hi("@comment.todo", { fg = c.bg, bg = c.gold_bright, bold = true })
hi("@comment.note", { fg = c.bg, bg = c.gold, bold = true })
hi("@comment.warning", { fg = c.bg, bg = c.yellow, bold = true })
hi("@comment.error", { fg = c.bg, bg = c.red_bright, bold = true })

hi("@tag", { fg = c.red })
hi("@tag.attribute", { fg = c.gold })
hi("@tag.delimiter", { fg = c.gray })

-- Git Signs
hi("GitSignsAdd", { fg = c.gold_bright })
hi("GitSignsChange", { fg = c.yellow })
hi("GitSignsDelete", { fg = c.red })

-- Telescope
hi("TelescopeBorder", { fg = c.red, bg = c.bg })
hi("TelescopePromptBorder", { fg = c.gold_bright, bg = c.bg })
hi("TelescopeResultsBorder", { fg = c.red_dark, bg = c.bg })
hi("TelescopePreviewBorder", { fg = c.red_dark, bg = c.bg })
hi("TelescopeSelection", { fg = c.gold_bright, bg = c.bg_selection })
hi("TelescopeSelectionCaret", { fg = c.gold_bright })
hi("TelescopeMatching", { fg = c.yellow_bright, bold = true })

-- NvimTree / Neo-tree
hi("NvimTreeFolderIcon", { fg = c.gold_bright })
hi("NvimTreeFolderName", { fg = c.gold })
hi("NvimTreeOpenedFolderName", { fg = c.gold_bright })
hi("NvimTreeRootFolder", { fg = c.red, bold = true })
hi("NvimTreeGitDirty", { fg = c.yellow })
hi("NvimTreeGitNew", { fg = c.gold_bright })

-- Indent Blankline
hi("IndentBlanklineChar", { fg = c.bg_lighter })
hi("IndentBlanklineContextChar", { fg = c.red_dark })

-- Which Key
hi("WhichKey", { fg = c.gold_bright })
hi("WhichKeyGroup", { fg = c.red })
hi("WhichKeyDesc", { fg = c.gold })
hi("WhichKeySeparator", { fg = c.gray })

-- Dashboard
hi("DashboardHeader", { fg = c.gold_bright })
hi("DashboardCenter", { fg = c.gold })
hi("DashboardFooter", { fg = c.gray })

-- Match Paren
hi("MatchParen", { fg = c.yellow_bright, bg = c.bg_selection, bold = true })

-- Title
hi("Title", { fg = c.gold_bright, bold = true })

-- Directory
hi("Directory", { fg = c.gold_bright })

print("⚡ Flash theme loaded!")
