local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  filetypes = {"python", "lua"},
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.clangd.setup({
  filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
  on_attach = on_attach,
  capabilities = capabilities
})
