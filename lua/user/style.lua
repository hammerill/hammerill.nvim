-- @brief Style user config for hammerill.nvim
--
-- Assumes the plugin manager was loaded.

-- Apply Substrata theme
vim.cmd [[colorscheme substrata]]

-- Load lualine status bar
require("lualine").setup({
  options = { theme = require("lualine.themes.ayu_mirage") },
})
