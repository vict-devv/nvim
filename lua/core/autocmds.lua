-- ─────────────────────────────────────────
--  core/autocmds.lua
-- ─────────────────────────────────────────

local augroup = vim.api.nvim_create_augroup
local au      = vim.api.nvim_create_autocmd

-- ── Highlight yanked text ─────────────────
au("TextYankPost", {
  group    = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- ── Remove trailing whitespace on save ────
au("BufWritePre", {
  group   = augroup("trim_whitespace", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- ── Return to last cursor position ────────
au("BufReadPost", {
  group    = augroup("last_cursor", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- ── Auto-resize splits on window resize ───
au("VimResized", {
  group    = augroup("resize_splits", { clear = true }),
  callback = function() vim.cmd("tabdo wincmd =") end,
})

-- ── Filetype-specific indentation ─────────
au("FileType", {
  group   = augroup("ft_indent", { clear = true }),
  pattern = { "go", "makefile" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop   = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- ── Close quickfix/help/man with q ────────
au("FileType", {
  group   = augroup("close_with_q", { clear = true }),
  pattern = { "qf", "help", "man", "notify", "lspinfo" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true, silent = true })
  end,
})
