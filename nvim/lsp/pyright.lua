local lsp = require("lsp")
return {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
  settings = {
    python = {
      pythonPath = vim.fn.exepath("python3") or ".venv/bin/python",
      venvPath = vim.fn.getcwd(),
      analysis = { autoSearchPaths = true, useLibraryCodeForTypes = true, diagnosticMode = "workspace" },
    },
  },
}

