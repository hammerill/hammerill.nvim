# hammerill.nvim
My Neovim config (oh gosh i'm actually making one).

The idea is to have only minimal stuff installed so that you won't be lost when forced to use `vim` or even `vi` at some kind of remote server.

## Get Started
1. Install Neovim however you like so that `nvim` command will work.
2. Do a structured install of [`lazy.nvim`](https://lazy.folke.io/installation). This could be useful:
```bash
mkdir -p ~/.config/nvim
vim ~/.config/nvim/init.lua

# Fill init.lua with contents you see on the page...

mkdir -p ~/.config/nvim/lua/config
vim ~/.config/nvim/lua/config/lazy.lua

# Fill lazy.lua with contents you see on the page...
```

```bash
# Now, just open Neovim and install lazy.nvim:
nvim

# Ignore errors, strange theming and just press enter

## (inside Neovim) ##
:Lazy
<Shift + I> and <Shift + U>
q
:q
#####################
```

3. Create plugins file and fill it with anything you want to install:
  - [`tpope/vim-fugitive`](https://github.com/tpope/vim-fugitive) - plugin to call Git commands from within Neovim. This kind of name is basically just a link to any Vim-compatible plugin hosted on GitHub.
```bash
mkdir -p ~/.config/nvim/lua/plugins
vim ~/.config/nvim/lua/plugins/init.lua

# Fill init.lua with the following block...
```

```lua
return {
  "tpope/vim-fugitive",
}
```

4. After adding a plugin to this file, do the same thing as when installing lazy.nvim: open Neovim, open lazy.nvim menu and hit <kbd>Shift</kbd>+<kbd>I</kbd> and <kbd>Shift</kbd>+<kbd>U</kbd>.
5. You could also install [`kvrohit/substrata.nvim`](https://github.com/kvrohit/substrata.nvim) theme. If it doesn't work properly (or you're doing this on a remote server) you should rather consider installing it on a terminal emulator side, load the specified config that is.
6. Modify your `init.lua`:
```bash
nvim ~/.config/nvim/init.lua
```

```lua
vim.opt.number = true
vim.opt.relativenumber = true

require("config.lazy")

-- If you install theme to Neovim
vim.cmd [[colorscheme substrata]]
```

Cool, now we share the same CLI editor.
