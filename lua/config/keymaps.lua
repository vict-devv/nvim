-- Misc
vim.keymap.set({ "v", "i" }, "jk", "<ESC>")
vim.keymap.set("n", "<leader>x", ":source %<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("n", "<leader>sh", ":split<CR>")
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sc", ":close<CR>")
vim.keymap.set("n", "<leader>so", ":only<CR>")

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

-- NeoTree
-- P - preview
-- S - open split
-- s - open vsplit
-- a - add file
-- A - add dir
-- d - delete
-- r - rename
-- m - move
-- R - refresh
-- D - search dir
-- / - search all
-- i - info
-- q - quit
vim.keymap.set("n", "<leader>e", ":Neotree position=current toggle<CR>")
vim.keymap.set("n", "<leader>ec", ":Neotree position=current reveal<CR>")

-- Telescope - plugins
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Comment - plugins
-- [count]gcc
-- [count]gbc
-- gc[count][motion]
-- gb[count][motion]

-- Surround - plugins
-- ysiw[surround char] -> ysiw) = (...)
-- ysiw" -> make strings
-- cs[old char][new char] -> change surroundings
-- ds[surround char] -> ds] = delete []

-- Bufferline
vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "go to next buffer" })
vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "go to previous buffer" })
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { desc = "close other buffers" })
vim.keymap.set("n", "<leader>bg", ":BufferLinePick<CR>", { desc = "go to selected buffer" })
vim.keymap.set("n", "<leader>bk", ":BufferLinePickClose<CR>", { desc = "pick one buffer to be closed" })
vim.keymap.set("n", "<leader>bc", ":bdelete!<CR>", { desc = "close current selected buffer" })

-- ToggleTerm
vim.keymap.set("n", "<leader>th", ":ToggleTerm size=10 direction=horizontal<CR>")
vim.keymap.set("n", "<leader>tv", ":ToggleTerm size=40 direction=vertical<CR>")
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")

-- Git Signs
-- map("n", "<leader>hs", gitsigns.stage_hunk)
-- map("n", "<leader>hr", gitsigns.reset_hunk)
-- map("v", "<leader>hs", function()
-- 	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
-- end)
-- map("v", "<leader>hr", function()
-- 	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
-- end)
-- map("n", "<leader>hS", gitsigns.stage_buffer)
-- map("n", "<leader>hu", gitsigns.undo_stage_hunk)
-- map("n", "<leader>hR", gitsigns.reset_buffer)
-- map("n", "<leader>hp", gitsigns.preview_hunk)
-- map("n", "<leader>hb", function()
-- 	gitsigns.blame_line({ full = true })
-- end)
-- map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
-- map("n", "<leader>hd", gitsigns.diffthis)
-- map("n", "<leader>hD", function()
-- 	gitsigns.diffthis("~")
-- end)
-- map("n", "<leader>td", gitsigns.toggle_deleted)
-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")

-- DAP - plugins
-- vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
-- vim.keymap.set("n", "<leader>ds", function() dap.step_over() end)
-- vim.keymap.set("n", "<leader>di", function() dap.step_into() end)
-- vim.keymap.set("n", "<leader>do", function() dap.step_out() end)
-- vim.keymap.set("n", "<Leader>db", function() dap.toggle_breakpoint() end)
-- vim.keymap.set("n", "<leader>dt", function() dap_go.debug_test() end, { buffer = 0 })
