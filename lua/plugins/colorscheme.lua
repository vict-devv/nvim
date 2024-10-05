return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- colorscheme
    vim.cmd([[colorscheme monokai-pro]])
    -- transparency
    vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
    -- sign column background fix
    vim.cmd([[highlight! link SignColumn LineNr]])
  end,
}
