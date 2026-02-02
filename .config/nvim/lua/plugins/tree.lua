return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = { width = 32 },
      renderer = {
        highlight_git = true,
        icons = { show = { folder = true, file = true } },
      },
      actions = {
        open_file = { quit_on_open = false },
      },
    })

    vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { silent = true })
  end,
}
