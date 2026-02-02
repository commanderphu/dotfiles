return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "javascript", "typescript",
        "json", "yaml", "bash", "dockerfile", "python",
      },
      highlight = { enable = true },
    })
  end,
}

