return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "html", "json", "yaml", "markdown" },
                }),
                -- see more options here: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
            },
        })
    end,
}
