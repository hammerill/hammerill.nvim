-- @brief Coding plugins list for hammerill.nvim

return {
  "hrsh7th/nvim-cmp",                                   -- Autocompletion
  {
    "nvim-treesitter/nvim-treesitter",                  -- Semantic syntax highlighting
    branch = "master",
  },
  "tpope/vim-fugitive",                                 -- Git commands from editor
  "lewis6991/gitsigns.nvim",                            -- Git signs on the left
  "ThePrimeagen/vim-be-good",                           -- Learn Vim game
  {
    "nvim-telescope/telescope.nvim",                    -- File selector
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-tree/nvim-tree.lua",                          -- File tree on the left
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
