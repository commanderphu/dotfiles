-- NEOTERRA Dashboard (alpha-nvim)
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- ── Header ───────────────────────────────────────────────────
    dashboard.section.header.val = {
      "",
      "",
      "              ╱╲              ",
      "             ╱  ╲             ",
      "            ╱    ╲            ",
      "           ╱  ^^  ╲           ",
      "          ╱────────╲          ",
      "",
      "    N  E  O  T  E  R  R  A    ",
      "    sovereign · dark · minimal",
      "",
    }

    dashboard.section.header.opts = {
      hl = "NeotDashHeader",
      position = "center",
    }

    -- ── Buttons ──────────────────────────────────────────────────
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File",      ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent Files",   ":Telescope oldfiles<CR>"),
      dashboard.button("g", "  Live Grep",      ":Telescope live_grep<CR>"),
      dashboard.button("n", "  New File",       ":ene <BAR> startinsert<CR>"),
      dashboard.button("c", "  Config",         ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("l", "  Lazy",           ":Lazy<CR>"),
      dashboard.button("q", "  Quit",           ":qa<CR>"),
    }

    for _, btn in ipairs(dashboard.section.buttons.val) do
      btn.opts.hl = "NeotDashButton"
      btn.opts.hl_shortcut = "NeotDashShortcut"
    end

    -- ── Footer ───────────────────────────────────────────────────
    local function footer()
      local stats = require("lazy").stats()
      return string.format(
        "^ NEOTERRA  ·  %d plugins loaded  ·  %s",
        stats.loaded,
        os.date("%d.%m.%Y")
      )
    end

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "NeotDashFooter"

    -- ── Layout ───────────────────────────────────────────────────
    dashboard.config.layout = {
      { type = "padding", val = 4 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    -- ── Highlights ───────────────────────────────────────────────
    vim.api.nvim_set_hl(0, "NeotDashHeader",   { fg = "#D6A419", bold = true })
    vim.api.nvim_set_hl(0, "NeotDashButton",   { fg = "#AAB2C5" })
    vim.api.nvim_set_hl(0, "NeotDashShortcut", { fg = "#D6A419", bold = true })
    vim.api.nvim_set_hl(0, "NeotDashFooter",   { fg = "#6B7280", italic = true })

    alpha.setup(dashboard.config)

    -- Beim Öffnen von Dateien aus Dashboard heraus StatusLine wiederherstellen
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        vim.opt.showtabline = 0
        vim.opt.laststatus = 0
      end,
    })
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      callback = function()
        vim.opt.showtabline = 2
        vim.opt.laststatus = 3
      end,
    })
  end,
}
