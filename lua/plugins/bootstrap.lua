-- ─────────────────────────────────────────
--  plugins/bootstrap.lua
--  lazy.nvim auto-install + plugin specs
-- ─────────────────────────────────────────

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- ── Plugin specs ──────────────────────────
require("lazy").setup({

	-- ══════════════════════════════════════════
	--  COLORSCHEME — Aura Theme
	-- ══════════════════════════════════════════
	{
		"daltonmenezes/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme aura-dark]])
			-- Background transparency
			vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "SnacksDashboardNormal", { bg = "NONE" })
		end,
	},

	-- ══════════════════════════════════════════
	--  UI FOUNDATION — nui.nvim + mini.icons
	-- ══════════════════════════════════════════
	{ "MunifTanjim/nui.nvim", lazy = true },

	{
		"echasnovski/mini.icons",
		lazy = false,
		opts = {},
		config = function(_, opts)
			require("mini.icons").setup(opts)
			-- Shim for plugins that still call nvim-web-devicons
			require("mini.icons").mock_nvim_web_devicons()
		end,
	},

	-- ══════════════════════════════════════════
	--  SNACKS — QoL suite
	--  Covers: explorer, picker, notifier,
	--  dashboard, indent, scroll, lazygit, zen
	-- ══════════════════════════════════════════
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
			explorer = {
				enabled = true,
				replace_netrw = true,
			},
			indent = {
				enabled = true,
				animate = { enabled = true },
			},
			input = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
				style = "fancy",
			},
			picker = {
				enabled = true,
				sources = {
					explorer = {
						layout = { layout = { position = "left", width = 0.2 } },
					},
				},
			},
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			lazygit = { enabled = true },
			zen = { enabled = true },
			styles = {
				notification = { border = "rounded", wo = { wrap = true } },
				float = { border = "rounded" },
				input = { border = "rounded" },
			},
		},
		keys = {
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File explorer",
			},
			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart find",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Live grep",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent files",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help tags",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command history",
			},
			{
				"<leader>gs",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
				function()
					Snacks.lazygit.log()
				end,
				desc = "Git log",
			},
			{
				"<leader>gB",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git branches",
			},
			{
				"<leader>n",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notifications",
			},
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Zen mode",
			},
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Scratch buffer",
			},
		},
	},

	-- ══════════════════════════════════════════
	--  NOICE — enhanced cmdline / messages / LSP
	-- ══════════════════════════════════════════
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				format = {
					cmdline = { icon = ">" },
					search_down = { icon = " " },
					search_up = { icon = " " },
					filter = { icon = "$" },
					lua = { icon = "" },
					help = { icon = "?" },
				},
			},
			messages = { enabled = true },
			popupmenu = { enabled = true },
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				progress = { enabled = true },
				hover = { enabled = true },
				signature = { enabled = true },
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
			routes = {
				{ filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
				{ filter = { event = "msg_show", min_height = 10 }, view = "split" },
			},
		},
		keys = {
			{
				"<leader>nd",
				function()
					require("noice").cmd("dismiss")
				end,
				desc = "Dismiss notifications",
			},
			{
				"<leader>nl",
				function()
					require("noice").cmd("last")
				end,
				desc = "Last message",
			},
			{
				"<leader>nh",
				function()
					require("noice").cmd("history")
				end,
				desc = "Message history",
			},
		},
	},

	-- ══════════════════════════════════════════
	--  STATUS LINE — lualine
	-- ══════════════════════════════════════════
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "echasnovski/mini.icons" },
		opts = {
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = { statusline = { "snacks_dashboard" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch", icon = "" },
					"diff",
					"diagnostics",
				},
				lualine_c = {
					{ "filename", path = 1, symbols = { modified = "●", readonly = "", unnamed = "" } },
				},
				lualine_x = {
					{
						function()
							return require("noice").api.status.mode.get()
						end,
						cond = function()
							return package.loaded["noice"] and require("noice").api.status.mode.has()
						end,
						color = { fg = "#a277ff" }, -- Aura purple accent
					},
					"filetype",
					"encoding",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},

	-- ══════════════════════════════════════════
	--  BUFFERLINE — tab-style buffer management
	-- ══════════════════════════════════════════
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "echasnovski/mini.icons" },
		keys = {
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
			{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close unpinned" },
			{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete buffer" },
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close others" },
			{ "<leader>b[", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
			{ "<leader>b]", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
		},
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					numbers = "none",
					close_command = "bdelete! %d",
					indicator = { style = "icon", icon = "▎" },
					buffer_close_icon = "󰅖",
					modified_icon = "●",
					close_icon = "",
					separator_style = "slant",
					always_show_bufferline = false,
					show_buffer_close_icons = true,
					show_close_icon = false,
					offsets = {
						{
							filetype = "snacks_layout_box",
							text = "  Files",
							text_align = "left",
							highlight = "Directory",
						},
					},
					get_element_icon = function(opts)
						local filename = type(opts) == "table" and opts.filename or nil
						if type(filename) ~= "string" or filename == "" then
							return "", "BufferLineDevIconDefault"
						end
						local icon, hl = require("mini.icons").get("file", filename)
						return icon, hl
					end,
				},
			})

			-- Inactive buffers: dimmed, transparent bg
			vim.api.nvim_set_hl(0, "BufferLineBackground", { fg = "#6d6d6d", bg = "NONE" })
			vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { fg = "#6d6d6d", bg = "NONE" })
			vim.api.nvim_set_hl(0, "BufferLineCloseButton", { fg = "#6d6d6d", bg = "NONE" })
			vim.api.nvim_set_hl(0, "BufferLineCloseButtonVisible", { fg = "#6d6d6d", bg = "NONE" })

			-- Active buffer: light fg + Aura surface bg
			vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = "#edecee", bg = "#21202e", bold = true })
			vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { fg = "#f694ff", bg = "#21202e" })
			vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = "#a277ff", bg = "#21202e" })

			-- Modified dot: teal on all states
			vim.api.nvim_set_hl(0, "BufferLineModified", { fg = "#61ffca", bg = "NONE" })
			vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", { fg = "#61ffca", bg = "NONE" })
			vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { fg = "#61ffca", bg = "#21202e" })

			-- Separators
			vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = "#15141b", bg = "NONE" })
			vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { fg = "#15141b", bg = "NONE" })
			vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { fg = "#15141b", bg = "#21202e" })

			-- Numbers
			vim.api.nvim_set_hl(0, "BufferLineNumbers", { fg = "#6d6d6d", bg = "NONE" })
			vim.api.nvim_set_hl(0, "BufferLineNumbersSelected", { fg = "#a277ff", bg = "#21202e", bold = true })

			-- Pick / pin letters
			vim.api.nvim_set_hl(0, "BufferLinePick", { fg = "#f694ff", bg = "NONE", bold = true })
			vim.api.nvim_set_hl(0, "BufferLinePickSelected", { fg = "#f694ff", bg = "#21202e", bold = true })
			vim.api.nvim_set_hl(0, "BufferLinePickVisible", { fg = "#f694ff", bg = "NONE", bold = true })

			-- Duplicate names
			vim.api.nvim_set_hl(0, "BufferLineDuplicate", { fg = "#6d6d6d", bg = "NONE", italic = true })
			vim.api.nvim_set_hl(0, "BufferLineDuplicateSelected", { fg = "#a277ff", bg = "#21202e", italic = true })
			vim.api.nvim_set_hl(0, "BufferLineDuplicateVisible", { fg = "#6d6d6d", bg = "NONE", italic = true })
		end,
	},

	-- ══════════════════════════════════════════
	--  MOTION — EasyMotion + vim-surround
	-- ══════════════════════════════════════════
	{
		"easymotion/vim-easymotion",
		keys = {
			{ "<leader>j", "<Plug>(easymotion-j)", mode = "n", desc = "EasyMotion down" },
			{ "<leader>k", "<Plug>(easymotion-k)", mode = "n", desc = "EasyMotion up" },
			{ "s", "<Plug>(easymotion-s2)", mode = "n", desc = "EasyMotion 2-char jump" },
			{ "<leader>fw", "<Plug>(easymotion-w)", mode = "n", desc = "EasyMotion word fwd" },
			{ "<leader>fW", "<Plug>(easymotion-b)", mode = "n", desc = "EasyMotion word back" },
		},
		init = function()
			vim.g.EasyMotion_smartcase = 1 -- case-insensitive unless capitals used
			vim.g.EasyMotion_do_mapping = 0 -- disable default bindings
		end,
	},

	{
		"tpope/vim-surround",
		-- ys{motion}{char}   add surround
		-- cs{old}{new}       change surround
		-- ds{char}           delete surround
		-- S{char} in visual  surround selection
	},

	-- ══════════════════════════════════════════
	--  TREESITTER
	-- ══════════════════════════════════════════
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"lua",
					"go",
					"python",
					"terraform",
					"yaml",
					"json",
					"bash",
					"markdown",
					"markdown_inline",
					"dockerfile",
					"hcl",
					"toml",
					"javascript",
					"typescript",
					"tsx",
					"jsdoc",
				},
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},

	-- ══════════════════════════════════════════
	--  LSP
	-- ══════════════════════════════════════════
	{
		"neovim/nvim-lspconfig", -- still needed: provides the lsp/*.lua server configs
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- 1. Mason: install servers automatically
			require("mason").setup({ ui = { border = "rounded" } })
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"pyright",
					"terraformls",
					"yamlls",
					"bashls",
					"ts_ls",
					"eslint",
				},
				automatic_installation = true,
			})

			-- 2. Capabilities: merge nvim-cmp advertised capabilities into every server
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- 3. Per-server overrides via vim.lsp.config (Nvim 0.11+)
			--    nvim-lspconfig's lsp/*.lua files supply the defaults;
			--    vim.lsp.config merges our overrides on top of them.
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim", "Snacks" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			-- Servers that only need capabilities injected
			for _, server in ipairs({ "gopls", "pyright", "terraformls", "yamlls", "bashls", "ts_ls", "eslint" }) do
				vim.lsp.config(server, { capabilities = capabilities })
			end

			-- 4. Enable all servers (replaces lspconfig[server].setup{})
			vim.lsp.enable({ "lua_ls", "gopls", "pyright", "terraformls", "yamlls", "bashls", "ts_ls", "eslint" })

			-- 5. Diagnostic signs & display
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			vim.diagnostic.config({
				virtual_text = { prefix = "●" },
				float = { border = "rounded" },
				update_in_insert = false,
			})
		end,
	},

	-- ══════════════════════════════════════════
	--  COMPLETION
	-- ══════════════════════════════════════════
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	-- ══════════════════════════════════════════
	--  FORMATTING
	-- ══════════════════════════════════════════
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				python = { "black" },
				terraform = { "terraform_fmt" },
				yaml = { "prettier" },
				json = { "prettier" },
				sh = { "shfmt" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
			},
			format_on_save = { lsp_fallback = true, timeout_ms = 500 },
		},
	},

	-- ══════════════════════════════════════════
	--  GIT
	-- ══════════════════════════════════════════
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
			on_attach = function(buf)
				local gs = package.loaded.gitsigns
				local map = function(l, r, desc)
					vim.keymap.set("n", l, r, { buffer = buf, desc = desc })
				end
				map("]c", gs.next_hunk, "Next hunk")
				map("[c", gs.prev_hunk, "Prev hunk")
				map("<leader>hp", gs.preview_hunk, "Preview hunk")
				map("<leader>hr", gs.reset_hunk, "Reset hunk")
				map("<leader>hb", gs.toggle_current_line_blame, "Git blame")
			end,
		},
	},
	{ "tpope/vim-fugitive" },

	-- ══════════════════════════════════════════
	--  MARKDOWN — render-markdown.nvim
	-- ══════════════════════════════════════════
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" }, -- lazy-load: only activates for .md files
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.icons",
		},
		opts = {
			-- Render in normal/command/terminal modes; raw syntax in insert
			-- mode so editing is never obscured.
			render_modes = { "n", "c", "t" },
			heading = {
				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
				sign = false,
			},
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
			},
			bullet = {
				icons = { "●", "○", "◆", "◇" },
			},
			checkbox = {
				unchecked = { icon = "󰄱 " },
				checked = { icon = "󰱒 " },
			},
		},
		keys = {
			{ "<leader>mt", "<cmd>RenderMarkdown toggle<cr>", ft = "markdown", desc = "Toggle markdown render" },
			{ "<leader>me", "<cmd>RenderMarkdown enable<cr>", ft = "markdown", desc = "Enable markdown render" },
			{ "<leader>md", "<cmd>RenderMarkdown disable<cr>", ft = "markdown", desc = "Disable markdown render" },
		},
	},

	-- ══════════════════════════════════════════
	--  AI — Claude Code
	-- ══════════════════════════════════════════
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {
			-- auto_start: launch the IPC server when Neovim starts so Claude
			-- Code CLI can connect immediately without a manual toggle first.
			auto_start = true,
			-- track_selection: keeps Claude aware of what you have selected /
			-- what file/line you are on — enables context-aware responses.
			track_selection = true,
			-- Terminal appears as a centered floating window (consistent with
			-- the rest of the config's rounded-border aesthetic).
			terminal = {
				provider = "snacks",
				snacks_win_opts = {
					position = "float",
					width = 0.85,
					height = 0.85,
					border = "rounded",
					keys = {
						-- <leader>ac closes the float from terminal mode too
						claude_hide = {
							"<leader>ac",
							function(self)
								self:hide()
							end,
							mode = "t",
							desc = "Hide Claude",
						},
					},
				},
			},
		},
		keys = {
			-- <leader>a group — mirrors the LazyVim convention for AI tools
			{ "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude", mode = { "n", "v" } },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume last session" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue conversation" },
			-- Context helpers
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add buffer to Claude" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", desc = "Send selection", mode = "v" },
			-- Diff management (Claude edits land as diffs)
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},

	-- ══════════════════════════════════════════
	--  QUALITY-OF-LIFE
	-- ══════════════════════════════════════════
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			delay = 500,
			icons = { mappings = true },
			spec = {
				{ "<leader>a", group = "ai / claude" },
				{ "<leader>b", group = "buffers" },
				{ "<leader>f", group = "find / files" },
				{ "<leader>g", group = "git" },
				{ "<leader>h", group = "hunks" },
				{ "<leader>n", group = "notifications" },
				{ "<leader>c", group = "code" },
				{ "<leader>s", group = "splits" },
				{ "<leader>t", group = "toggle" },
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({ check_ts = true })
			require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
}, {
	ui = {
		border = "rounded",
		icons = {
			cmd = " ",
			config = "",
			event = "",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "󰒲 ",
			loaded = "●",
			not_loaded = "○",
			plugin = " ",
			runtime = " ",
			source = " ",
			start = " ",
			task = "✔ ",
		},
	},
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
})
