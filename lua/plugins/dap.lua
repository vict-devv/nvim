return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        local dap_go = require("dap-go")

        dapui.setup()
        dap_go.setup()

        -- Customize breakpoint
        vim.fn.sign_define("DapBreakpoint", { text = "•", texthl = "red", linehl = "", numhl = "" })

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>dc", function()
            dap.continue()
        end, { desc = "continue", noremap = true, silent = true })

        vim.keymap.set("n", "<leader>ds", function()
            dap.step_over()
        end, { desc = "step over", noremap = true, silent = true })

        vim.keymap.set("n", "<leader>di", function()
            dap.step_into()
        end, { desc = "step into", noremap = true, silent = true })

        vim.keymap.set("n", "<leader>do", function()
            dap.step_out()
        end, { desc = "step out", noremap = true, silent = true })

        vim.keymap.set("n", "<leader>db", function()
            dap.toggle_breakpoint()
        end, { desc = "toggle breakpoint", noremap = true, silent = true })

        vim.keymap.set("n", "<leader>dt", function()
            dap_go.debug_test()
        end, { buffer = 0, desc = "debug test", noremap = true, silent = true })
    end,
}
