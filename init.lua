-- @brief Entry point for hammerill.nvim config

-- Load user Vim config
require("user.vim")

-- Load lazy.nvim plugin manager
require("config.lazy")

-- Load user keymaps config
require("user.keymaps")

-- Load user LSP config
require("user.lsp")

-- Load user coding config
require("user.code")

-- Load user styling config
require("user.style")
