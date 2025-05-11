local g = vim.g
g.mapleader = " "
g.maplocalleader = "\\"

g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

local opt = vim.opt
opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.ruler = true
-- opt.colorcolumn = "100"

opt.splitright = true
opt.splitbelow = true

opt.backup = false
opt.swapfile = false

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.isfname:append("@-@")
opt.updatetime = 50
opt.timeoutlen = 600
