-- Neo-tree - File Explorer
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = { ".git", "node_modules", ".cache" },
        },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = "none",
          ["<cr>"] = "open",
          ["o"] = "open",
          ["s"] = "open_vsplit",
          ["S"] = "open_split",
          ["a"] = { "add", config = { show_path = "relative" } },
          ["d"] = "delete",
          ["r"] = "rename",
          ["c"] = "copy",
          ["m"] = "move",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["H"] = "toggle_hidden",
        },
      },
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
    })

    vim.keymap.set("n", "<C-b>", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", { desc = "Focus file explorer" })
  end,
}
