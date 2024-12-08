-- @brief Keymaps user config for hammerill.nvim
--
-- Assumes the plugin manager was loaded.

-- Editor keymaps
vim.keymap.set("n", "<C-u>", "<C-u>zt", { desc = "Keep cursor at top when scroll up" })
vim.keymap.set("n", "<C-d>", "<C-d>zt", { desc = "Keep cursor at top when scroll down" })

-- LSP keymaps
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP rename a symbol" })

-- Telescope keymaps
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
