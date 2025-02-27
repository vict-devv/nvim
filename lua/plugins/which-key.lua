return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.add({
			{
				"<leader>s",
				group = "split",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
			{
				"<leader>t",
				group = "telescope",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
			{
				"<leader>b",
				group = "buffer",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
			{
				"<leader>l",
				group = "lsp",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
			{
				"<leader>d",
				group = "dap",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
			{
				"<leader>h",
				group = "gitsigns",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
		})
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
