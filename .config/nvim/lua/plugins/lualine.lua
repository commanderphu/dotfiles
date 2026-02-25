-- Lualine - Statusline — NEOTERRA Theme
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local neoterra = {
      normal = {
        a = { fg = "#0B0E14", bg = "#D6A419", gui = "bold" },
        b = { fg = "#AAB2C5", bg = "#1F2638" },
        c = { fg = "#6B7280", bg = "#0B0E14" },
      },
      insert = {
        a = { fg = "#0B0E14", bg = "#F0B90B", gui = "bold" },
        b = { fg = "#AAB2C5", bg = "#1F2638" },
        c = { fg = "#6B7280", bg = "#0B0E14" },
      },
      visual = {
        a = { fg = "#E6E9EF", bg = "#8F1D2C", gui = "bold" },
        b = { fg = "#AAB2C5", bg = "#1F2638" },
        c = { fg = "#6B7280", bg = "#0B0E14" },
      },
      replace = {
        a = { fg = "#E6E9EF", bg = "#C53030", gui = "bold" },
        b = { fg = "#AAB2C5", bg = "#1F2638" },
        c = { fg = "#6B7280", bg = "#0B0E14" },
      },
      command = {
        a = { fg = "#0B0E14", bg = "#A07810", gui = "bold" },
        b = { fg = "#AAB2C5", bg = "#1F2638" },
        c = { fg = "#6B7280", bg = "#0B0E14" },
      },
      inactive = {
        a = { fg = "#6B7280", bg = "#0B0E14" },
        b = { fg = "#6B7280", bg = "#0B0E14" },
        c = { fg = "#6B7280", bg = "#0B0E14" },
      },
    }

    require("lualine").setup({
      options = {
        theme = neoterra,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { statusline = { "neo-tree" } },
      },
      sections = {
        lualine_a = {
          { "mode", icon = "" },
        },
        lualine_b = {
          { "branch", icon = "" },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            diff_color = {
              added    = { fg = "#43A047" },
              modified = { fg = "#D6A419" },
              removed  = { fg = "#C53030" },
            },
          },
        },
        lualine_c = {
          { "filename", path = 1, symbols = { modified = " ●", readonly = " " } },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
            diagnostics_color = {
              error = { fg = "#C53030" },
              warn  = { fg = "#D6A419" },
              info  = { fg = "#AAB2C5" },
              hint  = { fg = "#6B7280" },
            },
          },
          { "filetype", icon_only = true },
        },
        lualine_y = { "encoding", "fileformat" },
        lualine_z = { "location", "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
