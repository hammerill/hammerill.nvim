-- ebrief Keymaps user config for hammerill.nvim
--
-- Assumes the plugin manager was loaded.

-- Editor keymaps
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor in center when scroll up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor in center when scroll down" })

-- LSP keymaps
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP rename a symbol" })

-- Telescope keymaps
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })

-- File tree keymaps
local tree = require("nvim-tree.api").tree
vim.keymap.set("n", "<leader>to", tree.open, { desc = "File tree open" })
vim.keymap.set("n", "<leader>tc", tree.close, { desc = "File tree close" })
vim.keymap.set("n", "<leader>tt", tree.toggle, { desc = "File tree toggle" })
vim.keymap.set("n", "<leader>tf", tree.focus, { desc = "File tree focus" })
vim.keymap.set("n", "<leader>tr", tree.reload, { desc = "File tree reload" })

-- Define the object containing methods to export
local exported = {}

-- Export autocompletion plugin mapping
function exported.exportCmpMapping(cmp)
  return {
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
end

-- Export the defined object
return exported
