return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    config = function()
        require('blink.cmp').setup({
            keymap = {
                preset = 'enter',
                ['<C-j>'] = { 'select_next' },
                ['<C-k>'] = { 'select_prev' },
                ['<C-b>'] = { 'scroll_documentation_up' },
                ['<C-f>'] = { 'scroll_documentation_down' },
                ['<Tab>'] = { 'accept', 'fallback' },
                ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            },
            completion = {
                documentation = { auto_show = false },
                menu = {
                    draw = {
                        columns = {
                            { 'kind_icon' },
                            { 'label', gap = 1 },
                            { 'source_name' },
                        },
                    },
                },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono',
            },
        })
    end,
}
