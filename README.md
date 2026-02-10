# hammerill.nvim

My Neovim config (oh gosh i'm actually making one).

The idea is to have only minimal stuff installed so that you won't be lost when forced to use `vim` or even `vi` at some kind of remote server.

## Comprehensive Guide

Click [here](./legacy/README.md) to access the comprehensive guide of the installation of this config (outdated version) in the old way.

At the time, this repo was a single readme file guiding you through setting up your package manager yourself and adding your configs in the config files. When this config became bigger, it was a pain in the ass to update the config online AND on all the instances I've installed Neovim to. Coming up with an idea that this repo must replace the whole Neovim config dir isn't innovative but solves drastically the syncing problem.

But still, I leave the old guide-like readme for ya and for the educating purposes.

## Get Started

1. Install Neovim however you like so that `nvim` command will work.

2. Install various utils, notably language analyzers:

```bash
# Required for Telescope
your_pkg_manager install ripgrep

# Needed for system copy/paste
your_pkg_manager install wl-clipboard # For Wayland. `xclip` for X11

# Clang (C/C++)
your_pkg_manager install clang

# Bash
your_pkg_manager install bash-language-server
## or
npm install -g bash-language-server

# Pyright (Python)
npm install -g pyright

# TypeScript Language Server (JS/TS)
npm install -g typescript typescript-language-server

# Tailwind CSS
npm install -g @tailwindcss/language-server
```

3. Clone this repo to your Neovim config folder:

```bash
git clone https://github.com/hammerill/hammerill.nvim ~/.config/nvim
```

4. You'll need a [NerdFont](https://www.nerdfonts.com/) in order to have lualine.nvim working. Install one of these on your system (my personal favorites are [Cascadia Mono NF](https://github.com/microsoft/cascadia-code)) and [JetBrains Mono NF](https://www.jetbrains.com/lp/mono/), installed by default in Ghostty) and set it as the font of your terminal profile.

5. Now, just open Neovim and install package manager with all its packages (you might not need to launch all of that and do Shift keys yourself, but you'll know how to update plugins):

```bash
nvim

# Ignore errors and strange theming and just press Enter

## (inside Neovim) ##
:Lazy
<Shift + I> and <Shift + U>
q
:q
#####################
```

Cool, now we share the same CLI editor.

## Keymaps

Important thing to note are the keymaps that this config assignes.

Take a look at the [keymaps file](./lua/user/keymaps.lua) to see all the hotkeys you can use.

For example, this:

```lua
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP rename a symbol" })
```

...means that you can do a <kbd>Space</kbd>+<kbd>lr</kbd> to ask your LSP server to rename a certain variable/class/etc.
