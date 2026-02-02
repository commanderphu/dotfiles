-- 🌈 Catppuccin Theme Settings (Frappe + Green Accent)
require("catppuccin").setup({
  flavour = "frappe",
  transparent_background = false,

  color_overrides = {
    frappe = {
      -- Deine Green Accent Farbe
      green = "#a6d189",
      teal  = "#8bd5ca",
    },
  },

  custom_highlights = function(colors)
    return {
      -- Cursorline stärker sichtbar (VSCode Style)
      CursorLine = { bg = colors.base },

      -- Line numbers etwas softer
      LineNr = { fg = colors.overlay1 },
      CursorLineNr = { fg = colors.green, bold = true },

      -- Window Borders
      FloatBorder = { fg = colors.surface2 },
      WinSeparator = { fg = colors.surface1 },

      -- Telescope tuned
      TelescopeBorder = { fg = colors.surface1 },
      TelescopeTitle = { fg = colors.green, bold = true },

      -- NvimTree
      NvimTreeNormal = { bg = colors.mantle },
      NvimTreeFolderName = { fg = colors.green },

      -- Git Signs
      GitSignsAdd = { fg = colors.green },
      GitSignsChange = { fg = colors.yellow },
    }
  end,

  integrations = {
    treesitter = true,
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = true,
    mini = true,
    indent_blankline = { enabled = true },
  }
})

vim.cmd.colorscheme("catppuccin")
