return {

  -------------------------------------------------------
  -- 🖼  IMAGE PREVIEW (PNG/JPG/GIF/SVG)
  -------------------------------------------------------
  {
    "adelarsq/image_preview.nvim",
    event = "VeryLazy",
    config = function()
      require("image_preview").setup({
        tmux_show_only_in_pane = true,
      })
    end,
  },

  -------------------------------------------------------
  -- 📄 PDF PREVIEW (Split Window)
  -------------------------------------------------------
  {
    "nvim-lua/popup.nvim",
    lazy = true,
  },

  -------------------------------------------------------
  -- 📝 MARKDOWN PREVIEW (Glow — VSCode Style)
  -------------------------------------------------------
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = function()
      require("glow").setup({
        style = "dark",
        width = 120,
      })
    end,
  },

  -------------------------------------------------------
  -- 🔭 TELESCOPE MEDIA FILE PREVIEW (Images + Video + PDF)
  -------------------------------------------------------
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("media_files")
    end,
  },

}

