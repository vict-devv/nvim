return {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme nord]])
    -- transparency
    vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
    -- sign column background fix
    vim.cmd([[highlight! link SignColumn LineNr]])
  end,
}
