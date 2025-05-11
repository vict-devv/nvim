local opt = { noremap = true, silent = true }

-- Misc
vim.keymap.set({ "v", "i" }, "jk", "<ESC>", opt)
vim.keymap.set("n", "<C-n>", ":noh<CR>", opt)
vim.keymap.set("n", "<leader>w", ":w!<CR>", opt)
vim.keymap.set("n", "<leader>q", ":q<CR>", opt)
vim.keymap.set("n", "<leader>e", ":Explore<CR>", opt)

-- Split
vim.keymap.set("n", "<leader>sh", ":split<CR>", opt)
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opt)
vim.keymap.set("n", "<leader>sc", ":close<CR>", opt)
vim.keymap.set("n", "<leader>so", ":only<CR>", opt)

-- Split Sizes
vim.keymap.set("n", "<A-k>", "<C-W>+", opt)
vim.keymap.set("n", "<A-j>", "<C-W>-", opt)
vim.keymap.set("n", "<A-h>", "<c-w>5<", opt)
vim.keymap.set("n", "<A-l>", "<c-w>5>", opt)

-- Navigation Vim Panes
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opt)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opt)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opt)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opt)
