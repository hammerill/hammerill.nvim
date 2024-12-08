-- @brief Code user config for hammerill.nvim
--
-- Loads plugins that increase developer experience.
--
-- Assumes the plugin manager was loaded.

-- Load Git signs on the left
require("gitsigns").setup()

-- Load Treesitter syntax highlighter
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
    "cpp", "cmake", "python", "html", "css", "javascript", "typescript",
  },
  highlight = {
    enable = true,
  },
})

-- Load autocompletion plugin
-- (assuming LSP source was configured elsewhere)
local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" }
  },
  mapping = {
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }
})
