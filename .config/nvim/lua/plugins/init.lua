return {
  { import = "plugins.theme" },
  { import = "plugins.tree" },
  { import = "plugins.telescope" },
  { import = "plugins.treesitter" },
  { import = "plugins.cmp" },
  { import = "plugins.mason" },
  { import = "plugins.tabs" },
  { import = "plugins.statusline" },
  { import = "plugins.breadcrumbs" },
  { import = "plugins.terminal" },
  { import = "plugins.gitlens" },

  -- Dashboard (eigene Config)
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    priority = 900,
    config = function()
      require("config.dashboard")
    end,
  },
}

