# Neovim Configuration
This is my neovim configuration mainly for Go but I'll be doing stuff with Python and JavaScript as well.

## How to use
Just clone this repository inside your `~/.config` folder (make sure to save your previous configurations as a backup):

```sh
git clone git@github.com:vict-devv/nvim.git  ~/.config
```

I'm [Lazy plugin manager](https://github.com/folke/lazy.nvim) so after cloning the repository make sure to run `:Lazy` inside your neovim instance, and press `S` to start synchronize the plugins.

## Plugins

 - [alpha-nvim](https://github.com/goolord/alpha-nvim) - cool neovim greeter.
 - [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - to automatically add common pairs like `"",[],{}, ...`.
 - [barbar](https://github.com/romgrk/barbar.nvim) - tabline plugin.
 - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - completion plugin.
 - [nord](https://github.com/shaunsingh/nord.nvim) - nord colorscheme for neovim. 
 - [Comment](https://github.com/numToStr/Comment.nvim) - add/remove comment lines with ease.
 - [nvim-dap](https://github.com/mfussenegger/nvim-dap) - debugger plugin. 
 - [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - buffer integration for Git. 
 - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP client configuration plugin. 
 - [lualine](https://github.com/nvim-lualine/lualine.nvim) - cool neovim status line.
 - [noice](https://github.com/folke/noice.nvim) - aesthetic enhancements for neovim.
 - [none-ls](https://github.com/nvimtools/none-ls.nvim) - hook non-LSP resources into LSP client.
 - [nvim-surround](https://github.com/kylechui/nvim-surround) - surround selections with ease.
 - [telescope](https://github.com/nvim-telescope/telescope.nvim) - highly extendable fuzzy finder over lists.
 - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - tree-sitter syntax highlighter for neovim. 
 - [Which-Key](https://github.com/folke/which-key.nvim) - a helper who shows all availables keymaps.

## File Browser
I'm using an extension of the Telescope plugin called [telescope-file-browser](https://github.com/nvim-telescope/telescope-file-browser.nvim), as a file browser. That's why there's no configuration for NeoTree or Netrw.

## Keymappings and Options
About the options you can check the `config/options.lua` for more information. Moreove, key mappings are spread throughout the code but there's a file, `config/keymaps.lua` which concentrate must of them, and you can also
use the power of the *Which-Key* and *Telescope* plugins to find out more mappings.
