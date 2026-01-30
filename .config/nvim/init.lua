-- Neovim Config - Flash Theme + Modern Features
-- Mit lazy.nvim Plugin-Manager

-- Leader Key (vor Plugins setzen!)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins laden
require("lazy").setup("plugins", {
  change_detection = { notify = false },
  ui = {
    border = "rounded",
    icons = {
      cmd = "⌘", config = "🛠", event = "📅", ft = "📂",
      init = "⚙", keys = "🗝", plugin = "🔌", runtime = "💻",
      require = "🌙", source = "📄", start = "🚀", task = "📌",
      lazy = "💤",
    },
  },
})

-- Grundlegende Optionen
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.showmode = false
opt.pumheight = 10
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.completeopt = "menuone,noselect"
opt.fillchars = { eob = " ", vert = "│" }

-- Flash Theme laden (falls vorhanden, sonst fallback)
local ok = pcall(vim.cmd.colorscheme, "flash")
if not ok then
  vim.cmd.colorscheme("habamax")
end

-- Keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer Navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Resize
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move Lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Search
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Save/Quit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>x", ":x<CR>", { desc = "Save & Quit" })

-- Splits
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })

-- Terminal
keymap("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal" })
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- Lazy
keymap("n", "<leader>l", ":Lazy<CR>", { desc = "Lazy Plugin Manager" })

-- Cheatsheet
keymap("n", "<leader>?", ":vsplit ~/.config/nvim/cheatsheet.md<CR>", { desc = "Cheatsheet" })

-- Autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
  end,
})

augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  group = "TrimWhitespace",
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

augroup("LastPosition", { clear = true })
autocmd("BufReadPost", {
  group = "LastPosition",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
