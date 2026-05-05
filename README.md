# tokyonight-simple

A Neovim colorscheme that pairs the **Tokyonight Storm** palette with the
**alabaster.nvim** philosophy: most code stays uncolored, and the few things
that *do* get color actually mean something.

## Philosophy

Inspired by [alabaster.nvim](https://github.com/p00f/alabaster.nvim):

> *"Syntax highlighting should help you read code, not turn it into a rainbow."*

Only these get a real color:

| What             | Color           |
|------------------|-----------------|
| Comments         | muted blue-grey, italic |
| Strings          | green           |
| Numbers / booleans / constants | orange |
| Diagnostics, errors, search | semantic colors |
| Git / diff / UI chrome | semantic colors |

Everything else — keywords, types, variables, functions, operators,
punctuation, parameters, properties — uses the default foreground.
**Function and constructor *definitions* are bold instead of colored.**

## Install

**lazy.nvim**
```lua
{
  dir = "/path/to/tokyonight-simple", -- or a git url once you publish it
  name = "tokyonight-simple",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("tokyonight-simple")
  end,
}
```

**packer.nvim**
```lua
use {
  "you/tokyonight-simple",
  config = function() vim.cmd.colorscheme("tokyonight-simple") end,
}
```

**Manual**: drop the repo in `~/.config/nvim/pack/colors/start/tokyonight-simple/`,
then `:colorscheme tokyonight-simple`.

## Layout

```
colors/
  tokyonight-simple.lua        -- entry point for :colorscheme
lua/tokyonight-simple/
  init.lua                     -- load()
  palette.lua                  -- Tokyonight Storm colors
  highlights.lua               -- highlight groups
```

## Tweaking

All colors live in `lua/tokyonight-simple/palette.lua`. To change what's
colored vs. plain, edit `lua/tokyonight-simple/highlights.lua` — the file is
organized by section (Editor UI, Syntax, Treesitter, LSP, Diagnostics,
Diff, Git, plugins).

## Credits

- Palette: [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) (Storm variant)
- Philosophy: [p00f/alabaster.nvim](https://github.com/p00f/alabaster.nvim)
