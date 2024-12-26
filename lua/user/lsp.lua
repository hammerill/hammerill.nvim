-- @brief LSP user config for hammerill.nvim
--
-- Assumes the plugin manager was loaded.

local lsp = require("lspconfig")
local cmp_source = require("cmp_nvim_lsp").default_capabilities()

-- Bash
lsp.bashls.setup({
  capabilities = cmp_source,
})

-- C/C++
lsp.clangd.setup({
  capabilities = cmp_source,
})

-- Python
lsp.pyright.setup({
  capabilities = cmp_source,
})

-- JS/TS
lsp.ts_ls.setup({
  capabilities = cmp_source,
})

-- Tailwind CSS
lsp.tailwindcss.setup({
  capabilities = cmp_source,
})
