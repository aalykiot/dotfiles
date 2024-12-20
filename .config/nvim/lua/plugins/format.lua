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
                rust = {},
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

        -- Enable format on save
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = '*',
            callback = function(args)
                require('conform').format({
                    bufnr = args.buf,
                    lsp_fallback = true,
                })
            end,
        })
    end,
}
