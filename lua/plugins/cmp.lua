return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("lspkind").init()

      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({
            behavior = cmp.SelectBehavior.Insert,
            select = true,
          }, { "i", "c" })),
        }),
      })

      -- Setup vim-dadbob
      cmp.setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })

      -- LuaSnipe
      local ls = require("luasnip")
      ls.config.set_config({
        history = false,
        updateevents = "TextChanged, TextChangedI",
      })

      -- Move forward to next snippet parameter
      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jumpable()
        end
      end, { silent = true })
      -- Move backwards
      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end)
    end,
  },
}
