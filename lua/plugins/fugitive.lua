return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>vf", vim.cmd.Git)

        local augroup = vim.api.nvim_create_augroup("fugitive_augroup", {})
        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = augroup,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>ps", function()
                    vim.cmd.Git('push')
                end, opts)

                vim.keymap.set("n", "<leader>pf", function()
                    vim.cmd.Git('push -f')
                end, opts)

                -- remember to commit before pushing
                vim.keymap.set("n", "<leader>aa", function()
                    vim.cmd.Git('add .')
                end, opts)

                vim.keymap.set("n", "<leader>cma", function()
                    vim.cmd.Git('cm --amend')
                end, opts)

                -- rebase always
                vim.keymap.set("n", "<leader>pl", function()
                    vim.cmd.Git({ 'pull', '--rebase' })
                end, opts)

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>pu", ":Git push -u origin ", opts);
            end,
        })
    end
}
