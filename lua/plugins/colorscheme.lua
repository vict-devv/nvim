return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme carbonfox]])
		-- transparency
		vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
		-- sign column background fix
		vim.cmd([[highlight! link SignColumn LineNr]])
	end,
}
