return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Actions
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "stage hunk", noremap = true, silent = true })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "reset hunk", noremap = true, silent = true })

				map("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "stage hunk, v mode", noremap = true, silent = true })

				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "reset hunk, v mode", noremap = true, silent = true })

				map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "stage buffer", noremap = true, silent = true })
				map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "reset buffer", noremap = true, silent = true })
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "preview hunk", noremap = true, silent = true })
				map(
					"n",
					"<leader>hi",
					gitsigns.preview_hunk_inline,
					{ desc = "preview hunk inline", noremap = true, silent = true }
				)

				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "blame line", noremap = true, silent = true })

				map("n", "<leader>hd", gitsigns.diffthis, { desc = "diff", noremap = true, silent = true })

				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end, { desc = "diff ~", noremap = true, silent = true })

				-- Toggles
				map(
					"n",
					"<leader>tb",
					gitsigns.toggle_current_line_blame,
					{ desc = "toggle line blame", noremap = true, silent = true }
				)
				map(
					"n",
					"<leader>td",
					gitsigns.toggle_deleted,
					{ desc = "toggle deleted", noremap = true, silent = true }
				)
				map(
					"n",
					"<leader>tw",
					gitsigns.toggle_word_diff,
					{ desc = "toggle word diff", noremap = true, silent = true }
				)

				-- Text object
				map({ "o", "x" }, "ih", gitsigns.select_hunk)
			end,
		})
	end,
}
