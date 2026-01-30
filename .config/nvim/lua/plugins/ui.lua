-- UI Enhancements
return {
  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Which-key (Keybinding Help)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = { enabled = true, suggestions = 20 },
        },
        win = {
          border = "rounded",
        },
      })

      -- Gruppen registrieren
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>h", group = "Git Hunk" },
        { "<leader>s", group = "Split" },
        { "<leader>t", group = "Toggle/Terminal" },
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Code" },
        { "<leader>r", group = "Rename/Restart" },
      })
    end,
  },

  -- Noice (Better UI)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        timeout = 2000,
        max_width = 60,
        render = "compact",
        stages = "fade",
      })

      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        routes = {
          { filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
        },
      })
    end,
  },

  -- Buffer Line (Tabs)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "thin",
          show_buffer_close_icons = true,
          show_close_icon = false,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          offsets = {
            { filetype = "neo-tree", text = "File Explorer", highlight = "Directory", separator = true },
          },
        },
      })
    end,
  },

  -- Colorizer (Color Preview)
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        "*",
        css = { css = true },
        html = { names = false },
      })
    end,
  },
}
