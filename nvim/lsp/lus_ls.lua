local lsp = require("lsp")
return {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
}

