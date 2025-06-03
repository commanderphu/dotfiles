-- lua/config/theme.lua

-- Stelle sicher, dass Lualine manuell geladen wird
require("lualine").setup({
    options = {
        theme = "catppuccin", -- Catppuccin Theme für Lualine
        section_separators = { left = "", right = "" },
        component_separators = "|",
    },
})

-- Setze Catppuccin Farbschema
require("catppuccin").setup({
    flavour = "frappe", -- oder "macchiato", "latte", "mocha"
    transparent_background = false,
    integrations = {
        treesitter = true,
        nvimtree = true,
        telescope = true,
        native_lsp = {
            enabled = true,
            underlines = {
                errors = { "undercurl" },
                warnings = { "undercurl" },
                hints = { "undercurl" },
            },
        },
    },
})

vim.cmd.colorscheme("catppuccin")  -- Setze das Farbschema
