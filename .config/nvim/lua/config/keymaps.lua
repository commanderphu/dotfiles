-- Keymap Helper
local map = vim.keymap.set

-- SPACE als Leader (VSCode-Favorit)
vim.g.mapleader = " "

------------------------------------------------------------
-- 📝 Basis
------------------------------------------------------------
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Schneller ESC
map("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

------------------------------------------------------------
-- 🪟 Window Navigation (VSCode Style)
------------------------------------------------------------
map("n", "<C-h>", "<C-w>h", { desc = "Move Left" })
map("n", "<C-l>", "<C-w>l", { desc = "Move Right" })
map("n", "<C-j>", "<C-w>j", { desc = "Move Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move Up" })

------------------------------------------------------------
-- 📁 File Explorer (VSCode-like)
------------------------------------------------------------
map("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle Explorer" })

------------------------------------------------------------
-- 🔍 Search / Telescope (VSCode-like)
------------------------------------------------------------
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<C-S-f>", "<cmd>Telescope live_grep<CR>", { desc = "Search in Project" })

------------------------------------------------------------
-- 🖥 Terminal (VSCode Style: CTRL+T)
------------------------------------------------------------
map("n", "<C-t>", "<cmd>ToggleTerm<CR>", { silent = true, desc = "Open Terminal" })

------------------------------------------------------------
-- 🔧 LSP Navigation (wie VSCode)
------------------------------------------------------------
map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "<F12>", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gh", vim.lsp.buf.hover, { desc = "Hover Info" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
map("n", "<leader>.", vim.lsp.buf.code_action, { desc = "Code Action" })

------------------------------------------------------------
-- 📌 Tabs / Buffers (VSCode-like)
------------------------------------------------------------
map("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Prev Buffer" })

------------------------------------------------------------
-- 🔥 Quality-of-Life
------------------------------------------------------------
-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear Search Highlight" })

-- Close current buffer
map("n", "<leader>c", ":bd<CR>", { desc = "Close Buffer" })
