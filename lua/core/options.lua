-- ─────────────────────────────────────────
--  core/options.lua  —  editor behaviour
-- ─────────────────────────────────────────

local opt = vim.opt

-- UI
opt.number         = true
opt.relativenumber = true
opt.signcolumn     = "yes"          -- always show gutter (avoids layout shifts)
opt.cursorline     = true
opt.termguicolors  = true
opt.scrolloff      = 8
opt.sidescrolloff  = 8
opt.wrap           = false
opt.colorcolumn    = "100"
opt.showmode       = false          -- lualine handles this

-- Indentation
opt.tabstop        = 2
opt.shiftwidth     = 2
opt.expandtab      = true
opt.smartindent    = true

-- Search
opt.ignorecase     = true
opt.smartcase      = true
opt.hlsearch       = false          -- clear highlights after search
opt.incsearch      = true

-- Files
opt.swapfile       = false
opt.backup         = false
opt.undofile       = true           -- persistent undo
opt.undodir        = vim.fn.stdpath("state") .. "/undo"

-- Splits
opt.splitright     = true
opt.splitbelow     = true

-- Clipboard
opt.clipboard      = "unnamedplus"  -- sync with system clipboard

-- Performance
opt.updatetime     = 200            -- faster CursorHold
opt.timeoutlen     = 300

-- Completion
opt.completeopt    = { "menuone", "noselect" }

-- Misc
opt.fileencoding   = "utf-8"
opt.mouse          = "a"
opt.conceallevel   = 1              -- nice for markdown / org files
