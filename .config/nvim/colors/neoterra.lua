-- NEOTERRA Colorscheme for Neovim
-- Sovereign dark — industrial, minimal, no RGB

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "neoterra"
vim.o.termguicolors = true

local c = {
  -- Backgrounds
  bg          = "#0B0E14",
  bg_surface  = "#121826",
  bg_panel    = "#161C2A",
  bg_elevated = "#1F2638",
  bg_hover    = "#252D40",

  -- Accent
  gold        = "#D6A419",
  gold_bright = "#F0B90B",
  gold_dim    = "#A07810",

  -- Red — nur für kritisches
  red         = "#8F1D2C",
  red_bright  = "#C53030",
  red_hover   = "#A32436",

  -- Text
  text        = "#E6E9EF",
  text_sec    = "#AAB2C5",
  text_muted  = "#6B7280",

  -- Functional
  green       = "#2E7D32",
  green_bright= "#43A047",
  cyan        = "#26A69A",
  blue        = "#2979CC",

  none        = "NONE",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ─────────────────────────────────────────────────────────────
-- Editor UI
-- ─────────────────────────────────────────────────────────────
hi("Normal",           { fg = c.text,       bg = c.bg })
hi("NormalFloat",      { fg = c.text,       bg = c.bg_panel })
hi("NormalNC",         { fg = c.text_sec,   bg = c.bg })
hi("FloatBorder",      { fg = c.bg_elevated,bg = c.bg_panel })
hi("FloatTitle",       { fg = c.gold,       bg = c.bg_panel, bold = true })

hi("Cursor",           { fg = c.bg,         bg = c.gold_bright })
hi("CursorLine",       { bg = c.bg_surface })
hi("CursorColumn",     { bg = c.bg_surface })
hi("ColorColumn",      { bg = c.bg_panel })

hi("LineNr",           { fg = c.bg_elevated })
hi("CursorLineNr",     { fg = c.gold,       bold = true })
hi("SignColumn",       { fg = c.text_muted, bg = c.bg })
hi("FoldColumn",       { fg = c.text_muted, bg = c.bg })
hi("Folded",           { fg = c.text_muted, bg = c.bg_surface })

hi("VertSplit",        { fg = c.bg_elevated, bg = c.bg })
hi("WinSeparator",     { fg = c.bg_elevated, bg = c.bg })

hi("StatusLine",       { fg = c.text_sec,  bg = c.bg_panel })
hi("StatusLineNC",     { fg = c.text_muted,bg = c.bg_surface })

hi("TabLine",          { fg = c.text_muted,bg = c.bg_panel })
hi("TabLineFill",      { bg = c.bg })
hi("TabLineSel",       { fg = c.gold,      bg = c.bg_elevated, bold = true })

hi("Pmenu",            { fg = c.text_sec,  bg = c.bg_panel })
hi("PmenuSel",         { fg = c.text,      bg = c.bg_elevated })
hi("PmenuSbar",        { bg = c.bg_panel })
hi("PmenuThumb",       { bg = c.bg_elevated })

hi("Search",           { fg = c.bg,        bg = c.gold })
hi("IncSearch",        { fg = c.bg,        bg = c.gold_bright, bold = true })
hi("CurSearch",        { fg = c.bg,        bg = c.gold_bright, bold = true })
hi("Substitute",       { fg = c.bg,        bg = c.red_bright })

hi("Visual",           { bg = c.bg_elevated })
hi("VisualNOS",        { bg = c.bg_elevated })

hi("MatchParen",       { fg = c.gold_bright, bold = true, underline = true })

hi("NonText",          { fg = c.bg_elevated })
hi("EndOfBuffer",      { fg = c.bg })
hi("Whitespace",       { fg = c.bg_elevated })
hi("SpecialKey",       { fg = c.bg_elevated })

hi("Title",            { fg = c.gold,      bold = true })
hi("Bold",             { bold = true })
hi("Italic",           { italic = true })
hi("Underlined",       { underline = true })

hi("ErrorMsg",         { fg = c.red_bright })
hi("WarningMsg",       { fg = c.gold })
hi("MoreMsg",          { fg = c.gold_bright })
hi("Question",         { fg = c.gold })
hi("ModeMsg",          { fg = c.gold,      bold = true })

hi("Directory",        { fg = c.gold })
hi("QuickFixLine",     { bg = c.bg_elevated })

hi("Conceal",          { fg = c.text_muted })
hi("SpellBad",         { undercurl = true, sp = c.red_bright })
hi("SpellCap",         { undercurl = true, sp = c.gold })
hi("SpellLocal",       { undercurl = true, sp = c.cyan })
hi("SpellRare",        { undercurl = true, sp = c.text_muted })

-- ─────────────────────────────────────────────────────────────
-- Syntax
-- ─────────────────────────────────────────────────────────────
hi("Comment",          { fg = c.text_muted, italic = true })
hi("SpecialComment",   { fg = c.text_muted, bold = true, italic = true })

hi("Constant",         { fg = c.gold })
hi("String",           { fg = c.text_sec })
hi("Character",        { fg = c.text_sec })
hi("Number",           { fg = c.gold_bright })
hi("Float",            { fg = c.gold_bright })
hi("Boolean",          { fg = c.gold, bold = true })

hi("Identifier",       { fg = c.text })
hi("Function",         { fg = c.gold_bright, bold = true })

hi("Statement",        { fg = c.gold })
hi("Conditional",      { fg = c.gold })
hi("Repeat",           { fg = c.gold })
hi("Label",            { fg = c.gold })
hi("Operator",         { fg = c.gold_dim })
hi("Keyword",          { fg = c.gold,       bold = true })
hi("Exception",        { fg = c.red_bright, bold = true })

hi("PreProc",          { fg = c.text_muted })
hi("Include",          { fg = c.text_muted })
hi("Define",           { fg = c.text_muted })
hi("Macro",            { fg = c.text_muted })

hi("Type",             { fg = c.text,       bold = true })
hi("StorageClass",     { fg = c.gold })
hi("Structure",        { fg = c.gold })
hi("Typedef",          { fg = c.gold })

hi("Special",          { fg = c.gold_dim })
hi("Delimiter",        { fg = c.text_muted })
hi("SpecialChar",      { fg = c.gold_dim })
hi("Tag",              { fg = c.gold })
hi("Debug",            { fg = c.red_bright })

hi("Error",            { fg = c.red_bright, bold = true })
hi("Todo",             { fg = c.bg, bg = c.gold, bold = true })

-- ─────────────────────────────────────────────────────────────
-- Treesitter
-- ─────────────────────────────────────────────────────────────
hi("@comment",                    { link = "Comment" })
hi("@comment.documentation",     { fg = c.text_muted, italic = true })
hi("@keyword",                    { link = "Keyword" })
hi("@keyword.function",          { fg = c.gold, bold = true })
hi("@keyword.operator",          { fg = c.gold_dim })
hi("@keyword.return",            { fg = c.gold, bold = true })
hi("@keyword.import",            { fg = c.text_muted })
hi("@function",                   { link = "Function" })
hi("@function.builtin",          { fg = c.gold_bright })
hi("@function.call",             { fg = c.gold_bright })
hi("@function.method",           { fg = c.gold_bright })
hi("@function.method.call",      { fg = c.gold_bright })
hi("@constructor",               { fg = c.text, bold = true })
hi("@parameter",                 { fg = c.text_sec })
hi("@variable",                  { fg = c.text })
hi("@variable.builtin",         { fg = c.gold_dim })
hi("@variable.member",          { fg = c.text_sec })
hi("@variable.parameter",       { fg = c.text_sec })
hi("@string",                     { link = "String" })
hi("@string.escape",             { fg = c.gold_dim })
hi("@string.special",            { fg = c.gold_dim })
hi("@number",                     { link = "Number" })
hi("@float",                      { link = "Float" })
hi("@boolean",                    { link = "Boolean" })
hi("@constant",                   { link = "Constant" })
hi("@constant.builtin",         { fg = c.gold, bold = true })
hi("@type",                       { link = "Type" })
hi("@type.builtin",             { fg = c.text, bold = true })
hi("@type.qualifier",           { fg = c.gold })
hi("@attribute",                  { fg = c.text_muted })
hi("@operator",                   { link = "Operator" })
hi("@punctuation.bracket",      { fg = c.text_muted })
hi("@punctuation.delimiter",    { fg = c.text_muted })
hi("@punctuation.special",      { fg = c.gold_dim })
hi("@tag",                        { fg = c.gold })
hi("@tag.builtin",              { fg = c.gold })
hi("@tag.attribute",            { fg = c.text_sec })
hi("@tag.delimiter",            { fg = c.text_muted })
hi("@markup.heading",           { fg = c.gold, bold = true })
hi("@markup.link",              { fg = c.gold, underline = true })
hi("@markup.link.url",         { fg = c.gold_dim, underline = true })
hi("@markup.raw",               { fg = c.text_sec })
hi("@markup.italic",            { italic = true })
hi("@markup.bold",              { bold = true })
hi("@markup.list",              { fg = c.gold_dim })
hi("@diff.plus",                 { fg = c.green_bright })
hi("@diff.minus",                { fg = c.red_bright })
hi("@diff.delta",                { fg = c.gold })

-- ─────────────────────────────────────────────────────────────
-- LSP
-- ─────────────────────────────────────────────────────────────
hi("DiagnosticError",            { fg = c.red_bright })
hi("DiagnosticWarn",             { fg = c.gold })
hi("DiagnosticInfo",             { fg = c.text_sec })
hi("DiagnosticHint",             { fg = c.text_muted })
hi("DiagnosticOk",               { fg = c.green_bright })

hi("DiagnosticUnderlineError",   { undercurl = true, sp = c.red_bright })
hi("DiagnosticUnderlineWarn",    { undercurl = true, sp = c.gold })
hi("DiagnosticUnderlineInfo",    { undercurl = true, sp = c.text_sec })
hi("DiagnosticUnderlineHint",    { undercurl = true, sp = c.text_muted })

hi("DiagnosticVirtualTextError", { fg = c.red_bright, bg = c.bg_surface, italic = true })
hi("DiagnosticVirtualTextWarn",  { fg = c.gold,       bg = c.bg_surface, italic = true })
hi("DiagnosticVirtualTextInfo",  { fg = c.text_muted, bg = c.bg_surface, italic = true })
hi("DiagnosticVirtualTextHint",  { fg = c.text_muted, bg = c.bg_surface, italic = true })

hi("LspReferenceText",           { bg = c.bg_elevated })
hi("LspReferenceRead",           { bg = c.bg_elevated })
hi("LspReferenceWrite",          { bg = c.bg_elevated, bold = true })
hi("LspInlayHint",               { fg = c.text_muted, bg = c.bg_surface, italic = true })

-- ─────────────────────────────────────────────────────────────
-- Git (gitsigns)
-- ─────────────────────────────────────────────────────────────
hi("GitSignsAdd",                { fg = c.green_bright })
hi("GitSignsChange",             { fg = c.gold })
hi("GitSignsDelete",             { fg = c.red_bright })
hi("GitSignsAddNr",              { fg = c.green_bright })
hi("GitSignsChangeNr",           { fg = c.gold })
hi("GitSignsDeleteNr",           { fg = c.red_bright })
hi("GitSignsAddLn",              { bg = "#0D1F0D" })
hi("GitSignsChangeLn",           { bg = "#1A1500" })
hi("GitSignsDeleteLn",           { bg = "#1A0808" })

hi("DiffAdd",                    { bg = "#0D1F0D" })
hi("DiffChange",                 { bg = "#1A1500" })
hi("DiffDelete",                 { fg = c.red, bg = "#1A0808" })
hi("DiffText",                   { bg = "#2A2200" })

-- ─────────────────────────────────────────────────────────────
-- Telescope
-- ─────────────────────────────────────────────────────────────
hi("TelescopeNormal",            { fg = c.text_sec, bg = c.bg_panel })
hi("TelescopeBorder",            { fg = c.bg_elevated, bg = c.bg_panel })
hi("TelescopeTitle",             { fg = c.gold, bg = c.bg_panel, bold = true })
hi("TelescopePromptNormal",      { fg = c.text, bg = c.bg_elevated })
hi("TelescopePromptBorder",      { fg = c.bg_elevated, bg = c.bg_elevated })
hi("TelescopePromptTitle",       { fg = c.bg, bg = c.gold, bold = true })
hi("TelescopePromptPrefix",      { fg = c.gold, bg = c.bg_elevated })
hi("TelescopeResultsNormal",     { fg = c.text_sec, bg = c.bg_panel })
hi("TelescopeResultsBorder",     { fg = c.bg_elevated, bg = c.bg_panel })
hi("TelescopeResultsTitle",      { fg = c.text_muted, bg = c.bg_panel })
hi("TelescopeSelection",         { fg = c.text, bg = c.bg_elevated })
hi("TelescopeSelectionCaret",    { fg = c.gold, bg = c.bg_elevated })
hi("TelescopeMatching",          { fg = c.gold_bright, bold = true })
hi("TelescopePreviewNormal",     { fg = c.text_sec, bg = c.bg_surface })
hi("TelescopePreviewBorder",     { fg = c.bg_elevated, bg = c.bg_surface })
hi("TelescopePreviewTitle",      { fg = c.text_muted, bg = c.bg_surface })

-- ─────────────────────────────────────────────────────────────
-- Neo-tree
-- ─────────────────────────────────────────────────────────────
hi("NeoTreeNormal",              { fg = c.text_sec, bg = c.bg })
hi("NeoTreeNormalNC",            { fg = c.text_muted, bg = c.bg })
hi("NeoTreeVertSplit",           { fg = c.bg_elevated, bg = c.bg })
hi("NeoTreeWinSeparator",        { fg = c.bg_elevated, bg = c.bg })
hi("NeoTreeEndOfBuffer",         { bg = c.bg })
hi("NeoTreeRootName",            { fg = c.gold, bold = true })
hi("NeoTreeFileName",            { fg = c.text_sec })
hi("NeoTreeFileNameOpened",      { fg = c.gold })
hi("NeoTreeDirectoryName",       { fg = c.text })
hi("NeoTreeDirectoryIcon",       { fg = c.gold_dim })
hi("NeoTreeFileIcon",            { fg = c.text_muted })
hi("NeoTreeIndentMarker",        { fg = c.bg_elevated })
hi("NeoTreeExpander",            { fg = c.text_muted })
hi("NeoTreeGitAdded",            { fg = c.green_bright })
hi("NeoTreeGitModified",         { fg = c.gold })
hi("NeoTreeGitDeleted",          { fg = c.red_bright })
hi("NeoTreeGitUntracked",        { fg = c.text_muted })
hi("NeoTreeGitConflict",         { fg = c.red_bright, bold = true })
hi("NeoTreeCursorLine",          { bg = c.bg_surface })
hi("NeoTreeSymbolicLinkTarget",  { fg = c.gold_dim })

-- ─────────────────────────────────────────────────────────────
-- nvim-cmp (Autocomplete)
-- ─────────────────────────────────────────────────────────────
hi("CmpNormal",                  { bg = c.bg_panel })
hi("CmpBorder",                  { fg = c.bg_elevated })
hi("CmpItemAbbr",                { fg = c.text_sec })
hi("CmpItemAbbrMatch",           { fg = c.gold_bright, bold = true })
hi("CmpItemAbbrMatchFuzzy",      { fg = c.gold, bold = true })
hi("CmpItemAbbrDeprecated",      { fg = c.text_muted, strikethrough = true })
hi("CmpItemMenu",                { fg = c.text_muted, italic = true })
hi("CmpItemKind",                { fg = c.gold_dim })
hi("CmpItemKindFunction",        { fg = c.gold_bright })
hi("CmpItemKindMethod",          { fg = c.gold_bright })
hi("CmpItemKindVariable",        { fg = c.text })
hi("CmpItemKindKeyword",         { fg = c.gold })
hi("CmpItemKindText",            { fg = c.text_sec })
hi("CmpItemSelected",            { bg = c.bg_elevated })

-- ─────────────────────────────────────────────────────────────
-- Which-key
-- ─────────────────────────────────────────────────────────────
hi("WhichKey",                   { fg = c.gold })
hi("WhichKeyGroup",              { fg = c.gold_bright, bold = true })
hi("WhichKeyDesc",               { fg = c.text_sec })
hi("WhichKeySeperator",          { fg = c.text_muted })
hi("WhichKeyFloat",              { bg = c.bg_panel })
hi("WhichKeyBorder",             { fg = c.bg_elevated, bg = c.bg_panel })
hi("WhichKeyValue",              { fg = c.text_muted })

-- ─────────────────────────────────────────────────────────────
-- Notify
-- ─────────────────────────────────────────────────────────────
hi("NotifyERRORBorder",          { fg = c.red })
hi("NotifyWARNBorder",           { fg = c.gold_dim })
hi("NotifyINFOBorder",           { fg = c.bg_elevated })
hi("NotifyDEBUGBorder",          { fg = c.text_muted })
hi("NotifyTRACEBorder",          { fg = c.text_muted })
hi("NotifyERRORIcon",            { fg = c.red_bright })
hi("NotifyWARNIcon",             { fg = c.gold })
hi("NotifyINFOIcon",             { fg = c.text_sec })
hi("NotifyDEBUGIcon",            { fg = c.text_muted })
hi("NotifyTRACEIcon",            { fg = c.text_muted })
hi("NotifyERRORTitle",           { fg = c.red_bright, bold = true })
hi("NotifyWARNTitle",            { fg = c.gold, bold = true })
hi("NotifyINFOTitle",            { fg = c.text_sec, bold = true })
hi("NotifyERRORBody",            { fg = c.text, bg = c.bg_panel })
hi("NotifyWARNBody",             { fg = c.text, bg = c.bg_panel })
hi("NotifyINFOBody",             { fg = c.text, bg = c.bg_panel })

-- ─────────────────────────────────────────────────────────────
-- BufferLine
-- ─────────────────────────────────────────────────────────────
hi("BufferLineBackground",       { fg = c.text_muted, bg = c.bg_surface })
hi("BufferLineBufferVisible",    { fg = c.text_muted, bg = c.bg_surface })
hi("BufferLineBufferSelected",   { fg = c.text, bg = c.bg, bold = true })
hi("BufferLineTab",              { fg = c.text_muted, bg = c.bg_surface })
hi("BufferLineTabSelected",      { fg = c.gold, bg = c.bg, bold = true })
hi("BufferLineTabSeparator",     { fg = c.bg, bg = c.bg_surface })
hi("BufferLineTabSeparatorSelected", { fg = c.bg, bg = c.bg })
hi("BufferLineFill",             { bg = c.bg_surface })
hi("BufferLineIndicatorSelected",{ fg = c.gold, bg = c.bg })
hi("BufferLineSeparator",        { fg = c.bg, bg = c.bg_surface })
hi("BufferLineModified",         { fg = c.gold_dim })
hi("BufferLineModifiedSelected", { fg = c.gold })
hi("BufferLineError",            { fg = c.red })
hi("BufferLineErrorSelected",    { fg = c.red_bright })
hi("BufferLineWarning",          { fg = c.gold_dim })
hi("BufferLineWarningSelected",  { fg = c.gold })
hi("BufferLineCloseButton",      { fg = c.text_muted, bg = c.bg_surface })
hi("BufferLineCloseButtonSelected", { fg = c.red_bright, bg = c.bg })

-- ─────────────────────────────────────────────────────────────
-- Noice
-- ─────────────────────────────────────────────────────────────
hi("NoicePopup",                 { bg = c.bg_panel })
hi("NoicePopupBorder",           { fg = c.bg_elevated, bg = c.bg_panel })
hi("NoiceCmdlinePopup",          { bg = c.bg_elevated })
hi("NoiceCmdlinePopupBorder",    { fg = c.gold, bg = c.bg_elevated })
hi("NoiceCmdlineIcon",           { fg = c.gold })
hi("NoiceCmdlinePopupTitle",     { fg = c.gold, bold = true })
hi("NoiceConfirm",               { bg = c.bg_panel })
hi("NoiceConfirmBorder",         { fg = c.gold, bg = c.bg_panel })

-- ─────────────────────────────────────────────────────────────
-- Indent Blankline
-- ─────────────────────────────────────────────────────────────
hi("IblIndent",                  { fg = c.bg_elevated })
hi("IblScope",                   { fg = c.bg_hover })
hi("IndentBlanklineChar",        { fg = c.bg_elevated })
hi("IndentBlanklineScopeChar",   { fg = c.bg_hover })
