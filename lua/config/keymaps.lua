-- Misc
vim.keymap.set({ "v", "i" }, "jk", "<ESC>")
vim.keymap.set("n", "<C-n>", ":noh<CR>")
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true }) -- this avoid the deleted content to go into yank register

-- Splits
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "split horizontal", noremap = true, silent = true })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "split vertical", noremap = true, silent = true })
vim.keymap.set("n", "<leader>sc", ":close<CR>", { desc = "close split view", noremap = true, silent = true })
vim.keymap.set("n", "<leader>so", ":only<CR>", { desc = "close others split views", noremap = true, silent = true })

-- Split sizes
vim.keymap.set("n", "<A-k>", "<C-W>+")
vim.keymap.set("n", "<A-j>", "<C-W>-")
vim.keymap.set("n", "<A-h>", "<c-w>5<")
vim.keymap.set("n", "<A-l>", "<c-w>5>")

-- Navigation Vim Panes
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Telescope
vim.keymap.set(
	"n",
	"<leader>te",
	":Telescope file_browser<CR>",
	{ desc = "telescope file browser", noremap = true, silent = true }
)
-- https://github.com/nvim-telescope/telescope-file-browser.nvim?tab=readme-ov-file#mappings

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "telescope find files", noremap = true, silent = true })
vim.keymap.set("n", "<leader>tg", builtin.live_grep, { desc = "telescope live grep", noremap = true, silent = true })

-- Surrounds
-- https://github.com/kylechui/nvim-surround?tab=readme-ov-file#rocket-usage

-- Git Signs
-- https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#-keymaps

-- LSP
-- https://github.com/ray-x/navigator.lua?tab=readme-ov-file#default-keymaps
