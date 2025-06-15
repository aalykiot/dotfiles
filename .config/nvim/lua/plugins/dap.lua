return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',
        'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        -- Basic debugging keymaps.
        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
        vim.keymap.set('n', '<leader>cB', dap.clear_breakpoints, { desc = 'Debug: Clear Breakpoints' })
        vim.keymap.set('n', '<leader>B', function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end, { desc = 'Debug: Set Breakpoint' })

        vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
        vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
        vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
        vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
        vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result' })

        -- Show variable under cursor
        vim.keymap.set('n', '<space>?', function()
            ---@diagnostic disable-next-line: missing-fields
            dapui.eval(nil, { enter = true })
        end)

        -- Try to autmatically install required debuggers
        require('mason-nvim-dap').setup({
            automatic_installation = true,
            handlers = {},
            ensure_installed = {
                'js-debug-adapter', -- Node.js
                'codelldb', -- Rust
            },
        })

        -- Configure DAP adapters
        dap.adapters = {
            ['pwa-node'] = {
                type = 'server',
                host = '::1',
                port = '${port}',
                executable = {
                    command = 'js-debug-adapter',
                    args = { '${port}' },
                },
            },
            ['lldb'] = {
                type = 'server',
                port = '${port}',
                executable = {
                    command = 'codelldb',
                    args = { '--port', '${port}' },
                    detached = false,
                },
            },
        }

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Setup dap-ui and virtual text
        dapui.setup()
        require('nvim-dap-virtual-text').setup({})
    end,
}
