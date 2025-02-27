return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })
    lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "docs hover", noremap = true, silent = true })
    vim.keymap.set(
      "n",
      "<leader>ldc",
      vim.lsp.buf.declaration,
      { desc = "go to declaration", noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>lde",
      vim.lsp.buf.definition,
      { desc = "go to definition", noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>li",
      vim.lsp.buf.implementation,
      { desc = "go to implementation", noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>lre",
      vim.lsp.buf.references,
      { desc = "go to references", noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>lsh",
      vim.lsp.buf.signature_help,
      { desc = "signature help", noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>ldf",
      vim.diagnostic.open_float,
      { desc = "diagnostic float window", noremap = true, silent = true }
    )
    vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, { desc = "rename", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "formatting", noremap = true, silent = true })
    vim.keymap.set(
      { "n", "v" },
      "<leader>ca",
      vim.lsp.buf.code_action,
      { desc = "code action", noremap = true, silent = true }
    )

    -- Improve hover and signature help boxes
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  end,
}
