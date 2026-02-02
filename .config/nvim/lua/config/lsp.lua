-- Mason Installer
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "pyright",
    "bashls",
    "yamlls",
    "dockerls",
    "jsonls",
  }
})

-- Capabilities (Completion)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Keybinds per LSP-Buffer
local on_attach = function(client, bufnr)
  local map = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
  end

  map("n", "<F12>", vim.lsp.buf.definition)
  map("n", "<F2>", vim.lsp.buf.rename)
  map("n", "gh", vim.lsp.buf.hover)
  map("n", "<leader>.", vim.lsp.buf.code_action)
  map("n", "gr", vim.lsp.buf.references)
end

-- Neue LSP API (Neovim 0.11)
local lsp_start = function(server_name, config)
  local final_cfg = vim.tbl_deep_extend("force", {
    name = server_name,
    cmd = config.cmd,
    root_dir = config.root_dir,
    filetypes = config.filetypes,
    capabilities = capabilities,
    on_attach = on_attach,
  }, config)

  vim.lsp.start(final_cfg)
end

-- Server definitions using new style
local servers = {
  lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
  },
  ts_ls = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "javascript" },
  },
  pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
  },
  bashls = {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
  },
  yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yml" },
  },
  dockerls = {
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "dockerfile" },
  },
  jsonls = {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json" },
  },
}

-- Autostart LSP when opening a file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype
    for name, cfg in pairs(servers) do
      if cfg.filetypes and vim.tbl_contains(cfg.filetypes, ft) then
        lsp_start(name, cfg)
      end
    end
  end
})
