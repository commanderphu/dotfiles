return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      transparent_background = false,
      integrations = {
        cmp = true,
        treesitter = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
