-- Treesitter - Syntax Highlighting (Neovim 0.11+ compatible)
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  main = "nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash", "c", "cpp", "css", "dockerfile", "go", "html",
      "javascript", "json", "lua", "markdown", "markdown_inline",
      "python", "rust", "toml", "tsx", "typescript", "vim",
      "vimdoc", "yaml", "xml",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
