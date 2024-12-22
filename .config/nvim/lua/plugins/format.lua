return {
    'stevearc/conform.nvim',
    dependencies = {
        -- This plugin will automatically install the formatters bellow
        'zapling/mason-conform.nvim',
    },
    config = function()
        -- Configuration
        require('mason-conform').setup()
        require('conform').setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
                html = { 'prettier' },
                css = { 'prettier' },
                json = { 'prettier' },
                python = { 'isort', 'black' },
            },
        })

        -- Create format command
        vim.api.nvim_create_user_command('Format', function()
            require('conform').format({
                async = true,
                lsp_fallback = true,
            })
        end, {})

        -- Keymap
        vim.keymap.set('n', '<leader>f', '<cmd>Format<CR>', { desc = 'Format active buffer' })

        -- Enable format on save
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = '*',
            callback = function(args)
                require('conform').format({
                    bufnr = args.buf,
                    async = true,
                    lsp_fallback = true,
                })
            end,
        })
    end,
}
