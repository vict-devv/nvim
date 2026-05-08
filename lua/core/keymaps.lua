-- ─────────────────────────────────────────
--  core/keymaps.lua
-- ─────────────────────────────────────────

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- ── Navigation ────────────────────────────
map("n", "<C-h>", "<C-w>h", "Window left")
map("n", "<C-j>", "<C-w>j", "Window down")
map("n", "<C-k>", "<C-w>k", "Window up")
map("n", "<C-l>", "<C-w>l", "Window right")

map("n", "<C-d>", "<C-d>zz", "Scroll down (centred)")
map("n", "<C-u>", "<C-u>zz", "Scroll up (centred)")
map("n", "n", "nzzzv", "Next match (centred)")
map("n", "N", "Nzzzv", "Prev match (centred)")

-- ── LSP ───────────────────────────────────
map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
map("n", "gd", vim.lsp.buf.definition, "Go to definition")
map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
map("n", "K", vim.lsp.buf.hover, "Hover docs")
map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
map("n", "<leader>d", vim.diagnostic.open_float, "Diagnostic float")

-- LSP references via Snacks picker (set after plugins load)
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.keymap.set("n", "gr", function()
			Snacks.picker.lsp_references()
		end, { silent = true, desc = "LSP references" })
	end,
})

-- ── Misc ──────────────────────────────────
map("i", "jk", "<esc>", "Go back to Normal Mode")

map("n", "<leader>w", "<cmd>write<cr>", "Save")
map("n", "<leader>q", "<cmd>quit<cr>", "Quit")
map("n", "<leader>h", "<cmd>nohlsearch<cr>", "Clear highlights")
map("v", "J", ":m '>+1<cr>gv=gv", "Move lines down")
map("v", "K", ":m '<-2<cr>gv=gv", "Move lines up")
map("x", "<leader>p", [["_dP]], "Paste without yank")
-- Format current buffer on demand (conform.nvim, falls back to LSP)
map("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, "Format buffer")

-- ── Toggle ────────────────────────────────
-- Toggle relative line numbers
map("n", "<leader>tn", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, "Toggle relative numbers")

-- Toggle inline diagnostics (virtual_text)
map("n", "<leader>td", function()
	local current = vim.diagnostic.config().virtual_text
	vim.diagnostic.config({ virtual_text = not current })
end, "Toggle inline diagnostics")

-- ── Splits ────────────────────────────────
map("n", "<leader>sv", "<cmd>vsplit<cr>", "Split vertically")
map("n", "<leader>sh", "<cmd>split<cr>", "Split horizontally")
map("n", "<leader>sc", "<cmd>close<cr>", "Close split")

-- Move current buffer to a split in the given direction
map("n", "<leader>sH", "<C-w>H", "Move buffer to left split")
map("n", "<leader>sJ", "<C-w>J", "Move buffer to bottom split")
map("n", "<leader>sK", "<C-w>K", "Move buffer to top split")
map("n", "<leader>sL", "<C-w>L", "Move buffer to right split")

-- Maximize / restore the current split (persistent state flag)
local _split_maximized = false
map("n", "<leader>sm", function()
	if _split_maximized then
		vim.cmd("wincmd =") -- restore equal splits
		_split_maximized = false
	else
		vim.cmd("wincmd |") -- maximize width
		vim.cmd("wincmd _") -- maximize height
		_split_maximized = true
	end
end, "Maximize / restore split")
