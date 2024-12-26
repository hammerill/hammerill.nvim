-- @brief Code user config for hammerill.nvim
--
-- Loads plugins that increase developer experience.
--
-- Assumes the plugin manager was loaded.

-- Load Git signs on the left
require("gitsigns").setup()

-- Load file tree on the left
require("nvim-tree").setup()

-- Load Treesitter syntax highlighter
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
    "bash", "cpp", "cmake", "php", "python", "html", "css", "javascript", "typescript",
  },
  highlight = {
    enable = true,
  },
})

-- Load autocompletion plugin
-- (assuming LSP source was configured elsewhere)
local cmp = require("cmp")
local keymaps = require("user.keymaps")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
  mapping = keymaps.exportCmpMapping(cmp),
})
