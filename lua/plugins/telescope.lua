return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>tg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
