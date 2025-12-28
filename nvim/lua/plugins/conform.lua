-- formater
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fm",
      function() require("conform").format({ async = true, lsp_fallback = true }) end,
      mode = "",
      desc = "Format buffer",
    
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },
      go = { "goimports", "gofmt" },
      lua = { "stylua" },
      bash = { "shfmt" },
      json = { "jq" },
      yaml = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}

