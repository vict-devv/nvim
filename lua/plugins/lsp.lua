return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "onsails/lspkind-nvim",
    },
    config = function()
        vim.keymap.set('n', '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<cr>')
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }
                -- these will be buffer-local keybindings
                -- because they only work if you have an active language server
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end
        })


        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { "rust_analyzer", "gopls", "html", "eslint", "sqls" },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = lsp_capabilities,
                    })
                end,
            },
            lua_ls = function()
                require('lspconfig').lua_ls.setup({
                    capabilities = lsp_capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' },
                            },
                        }
                    }
                })
            end,
        })

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local lspkind = require("lspkind")

        cmp.setup({
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            }),
            windows = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 70,
                    show_labelDetails = true,
                }),
            },
        })
    end
}
