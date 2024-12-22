return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'onsails/lspkind.nvim',
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'buffer' },
                { name = 'crates' },
            }),
            view = {
                docs = {
                    auto_open = false,
                },
            },
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = function(entry, vim_item)
                    local menu_map = {
                        nvim_lsp = '[LSP]',
                        buffer = '[Buffer]',
                        path = '[Path]',
                        crates = '[Crates.io]',
                    }
                    vim_item.kind = string.format('%s', lspkind.symbol_map[vim_item.kind] or '')
                    vim_item.menu = menu_map[entry.source.name]
                    return vim_item
                end,
            },
        })
    end,
}
