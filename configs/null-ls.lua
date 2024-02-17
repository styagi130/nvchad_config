local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

local opts = {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
  },
  on_attach = function(client, bufnr)
     if client.supports_method("textDocument/formatting") then
       vim.api.nvim_clear_autocmds({
         group = augroup,
         buffer = bufnr,
       })
     end
   end
}
return opts
