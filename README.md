# Neovim Configuration
This is my neovim configuration mainly for Go and Rust (ESlint and SQL also enabled).

## How to use
Just clone this repository inside your `~/.config` folder (make sure to save your previous configurations as a backup):

```sh
git clone git@github.com:vict-devv/nvim.git  ~/.config
```

I'm [Lazy plugin manager](https://github.com/folke/lazy.nvim) so after cloning the repository make sure to run `:Lazy` inside your neovim instance, and press `S` to start synchronize the plugins.

## Main Plugins

 - [alpha-nvim](https://github.com/goolord/alpha-nvim) - cool neovim greeter.
 - [barbar](https://github.com/romgrk/barbar.nvim) - tabline plugin.
 - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - completion plugin.
 - [CarbonFox](https://github.com/EdenEast/nightfox.nvim) - a NightFox colorscheme style.
 - [Comment](https://github.com/numToStr/Comment.nvim) - add/remove comment lines with ease.
 - [nvim-dap](https://github.com/mfussenegger/nvim-dap) - debugger plugin. 
 - [vim-fugitive](https://github.com/tpope/vim-fugitive) - extension for Git commands inside vim. 
 - [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - buffer integration for Git. 
 - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP client configuration plugin. 
 - [lualine](https://github.com/nvim-lualine/lualine.nvim) - cool neovim status line.
 - [telescope](https://github.com/nvim-telescope/telescope.nvim) - highly extendable fuzzy finder over lists.
 - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - tree-sitter syntax highlighter for neovim. 
 - [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim) - nice plugin that renders markdown inside neovim.
 - [live-server](https://github.com/barrett-ruth/live-server.nvim) - live-server plugin for autoloading html,css and js files in the browser.  
 - [none-ls](https://github.com/nvimtools/none-ls.nvim) - none-ls fills the gap between the LSP client and the formatters and linters tools binaries. 

## File Browser
I'm using the default file browser explorer `netrw`. Check `:help netwr-quickmaps` for keymaps and how to use it.

## Keymappings and Options
About the options you can check the `config/set.lua` for more information. Moreove, key mappings are spread throughout the code but there's a file, `config/keymaps.lua` which concentrate some of them, and you can also
use the power of *Telescope* plugins to find out more mappings.
