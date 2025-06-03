-- lua/config/lsp.lua

-- Stelle sicher, dass Mason korrekt geladen ist
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "bashls", "jsonls" },  -- Beispiel LSPs
})

local lspconfig = require("lspconfig")

-- LSP-Anschluss
local on_attach = function(_, bufnr)
local opts = { buffer = bufnr, silent = true }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

-- Statt setup_handlers verwenden wir setup direkt für jeden Server
local servers = { "lua_ls", "bashls", "jsonls" }  -- Füge hier deine LSP-Server hinzu

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
    })
    end
