-- @brief LSP user config for hammerill.nvim
--
-- Assumes the plugin manager was loaded.

local cmp_source = require("cmp_nvim_lsp").default_capabilities()

-- Define LSP server configurations
vim.lsp.config("bashls", {
  capabilities = cmp_source,
})

vim.lsp.config("clangd", {
  capabilities = cmp_source,
})

vim.lsp.config("pyright", {
  capabilities = cmp_source,

  settings = {
    python = {
      analysis = {
        diagnosticSeverityOverrides = {
          reportArgumentType = "none",
          reportAssignmentType = "none",
          reportAttributeAccessIssue = "none",
        },
      },
    },
  },
})

vim.lsp.config("ts_ls", {
  capabilities = cmp_source,
})

vim.lsp.config("tailwindcss", {
  capabilities = cmp_source,
})

-- Enable all configured servers
vim.lsp.enable({
  "bashls",
  "clangd",
  "pyright",
  "ts_ls",
  "tailwindcss",
})
