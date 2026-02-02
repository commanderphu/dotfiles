-- Leader MUSS ganz oben stehen
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 🧩 Lazy Plugin Manager
require("config.lazy")

-- ⚙️ Editor Options
require("config.options")

-- 🎹 Keymaps
require("config.keymaps")

-- 🧠 LSP (Neovim 0.11 API)
require("config.lsp")

