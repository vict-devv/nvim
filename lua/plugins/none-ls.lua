return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.code_actions.gomodifytags,
				null_ls.builtins.code_actions.refactoring,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.diagnostics.staticcheck,
				-- null_ls.builtins.diagnostics.terraform_validate
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports,
        null_ls.builtins.code_actions.impl,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.prettier,
				--null_ls.builtins.formatting.terraform_fmt,
			},
		})

		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
	end,
}
