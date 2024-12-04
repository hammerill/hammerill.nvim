# hammerill.nvim
My Neovim config (oh gosh i'm actually making one).

The idea is to have only minimal stuff installed so that you won't be lost when forced to use `vim` or even `vi` at some kind of remote server.

## Get Started
1. Install Neovim however you like so that `nvim` command will work.
2. Do a structured install of [`lazy.nvim`](https://lazy.folke.io/installation). This could be useful:
```bash
# Create folders structure
mkdir -p ~/.config/nvim/lua/config
mkdir -p ~/.config/nvim/lua/plugins
```

```bash
vim ~/.config/nvim/init.lua

# Fill init.lua with contents you see on the lazy.nvim page...
```

```bash
vim ~/.config/nvim/lua/config/lazy.lua

# Fill lazy.lua with contents you see on the lazy.nvim page...
```

```bash
# Now, just open Neovim and install lazy.nvim:
nvim

# Ignore errors and strange theming and just press Enter

## (inside Neovim) ##
:Lazy
<Shift + I> and <Shift + U>
q
:q
#####################
```

3. Create plugins file and fill it with anything you want to install:
  - [`tpope/vim-fugitive`](https://github.com/tpope/vim-fugitive) - plugin to call Git commands from within Neovim. This kind of name is basically just a link to any Vim-compatible plugin hosted on GitHub.
  - [`nvim-treesitter/nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) - syntax highlighter for Neovim. Basic Neovim does highlight by default, but this plugin does that semantically.
  - [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) - code analyzer for Neovim. It will show you warnings/errors in the files that use languages you configured LSP for (each one manually). It won't do auto-completion though. Install language analyzers for each language you want to support (such as Clang for C/C++ (even if GCC is used) and Pyright for Python) and add them to nvim/init.lua as shown below.
  - [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) - auto-completion plugin for Neovim. You have to provide a source for it, which we do just below. We will map the <kbd>Tab</kbd> key for it. Please note that <kbd>Tab</kbd> is the only key it will handle. All the other keys will be passed to Neovim directly.
  - [`hrsh7th/cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp) - LSP source for the auto-completion plugin. Using the code analyzer (LSP) we installed 2 lines above, it allows the auto-completion plugin to get all the data needed to show you when you're typing.
  - [`lewis6991/gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim) - shows Git signs on the left so you know whether this line was added/modified/deleted since the last Git staging.
  - [`nvim-lualine/lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim) - instead of default Vim status bar, it shows the more advanced and good looking one.
  - [`nvim-telescope/telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) - powerful file selector you can use with <kbd>Space</kbd>+<kbd>ff</kbd> (search for files in the project), <kbd>Space</kbd>+<kbd>fb</kbd> (switch between last loaded files) or <kbd>Space</kbd>+<kbd>fg</kbd> (search for text inside the files in the project). Don't forget to install the `ripgrep`.
```bash
vim ~/.config/nvim/lua/plugins/init.lua

# Fill init.lua with the following block...
```

```lua
return {
  'tpope/vim-fugitive',
  'nvim-treesitter/nvim-treesitter',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'lewis6991/gitsigns.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
```

4. After adding a plugin to this file (as another string in the `return` function you've just seen), do the same thing as when installing lazy.nvim: open Neovim, open lazy.nvim menu and hit <kbd>Shift</kbd>+<kbd>I</kbd> and <kbd>Shift</kbd>+<kbd>U</kbd>.
5. You could also install [`kvrohit/substrata.nvim`](https://github.com/kvrohit/substrata.nvim) theme (`'kvrohit/substrata.nvim',`). If it doesn't work properly (or you're doing this on a remote server) you should rather consider installing it on a terminal emulator side, load the specified config that is.
6. You'll need to have a [NerdFont](https://www.nerdfonts.com/) in order to have lualine.nvim working. Install one of these on your system (my personal favorite is [Cascadia Code](https://github.com/microsoft/cascadia-code)) and set it as the font of your terminal profile.
7. Modify your `init.lua` (pay attention to the "if installed" line):
```bash
nvim ~/.config/nvim/init.lua
```

```lua
-- Place 4 spaces instead of tabs
-- (do `:set shiftwidth=2` if you need to change amount of spaces)
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

-- Relative numbers view
vim.opt.number = true
vim.opt.relativenumber = true

-- Center screen while scrolling pages up/down
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Load lazy.nvim modules
require('config.lazy')

-- Apply Substrata theme
-- (if installed)
vim.cmd [[colorscheme substrata]]

-- Load autocompletion plugin
local cmp = require'cmp'
cmp.setup {
  sources = {
    { name = 'nvim_lsp' }
  },
  mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
	cmp.select_next_item()
      else
	fallback()
      end
    end
  }
}

-- Load LSP code analysis
local capabilities = require('cmp_nvim_lsp').default_capabilities()

--- C/C++
require'lspconfig'.clangd.setup{
  capabilities = capabilities,
}

--- Python
require'lspconfig'.pyright.setup{
  capabilities = capabilities,
}

--- JS/TS
require'lspconfig'.ts_ls.setup{
  capabilities = capabilities,
}

-- Load Treesitter syntax highlighter
require'nvim-treesitter.configs'.setup{
  ensure_installed = {
    'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline',
    'cpp', 'cmake', 'javascript', 'typescript', 'python'
  },

  highlight = {
    enable = true,
  },
}

-- Load lualine status bar
require('lualine').setup{
  options = { theme = require'lualine.themes.ayu_mirage' },
}

-- Load Git signs on the left
require('gitsigns').setup()

-- Load Telescope file navigator
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Hotkeys for the LSP
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'LSP rename a symbol' })
```

8. Additionally disable `lazy.nvim` auto-update check on launch (it annoys me as hell):
```bash
sed -i -r -e 's/checker = \{ enabled = true \}/checker = { enabled = true, notify = false }/' ~/.config/nvim/lua/config/lazy.lua
```

9. Install language servers for C/C++, Python and JS/TS:
```bash
# Clang (C/C++)
your_pkg_manager install clang

# Pyright (Python)
your_pkg_manager install pyright

# TypeScript Language Server (JS/TS)
npm install -g typescript typescript-language-server
```

Cool, now we share the same CLI editor.
