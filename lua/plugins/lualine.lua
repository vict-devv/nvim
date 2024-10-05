return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local noice = require("noice")
    require("lualine").setup({
      options = {
        theme = "monokai-pro",
      },
      sections = {
        lualine_x = {
          {
            noice.api.statusline.mode.get,
            noice.api.statusline.mode.has,
          },
        },
      },
    })
  end,
}
