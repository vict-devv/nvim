return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      capabilities = capabilities
    })
    lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, {})
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})
    vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
  end
}
