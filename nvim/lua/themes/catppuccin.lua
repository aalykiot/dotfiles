return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            no_italic = true,
            no_bold = true,
            transparent_background = false,
            lsp_styles = {
                underlines = {
                    errors = { 'undercurl' },
                    hints = { 'undercurl' },
                    warnings = { 'undercurl' },
                    information = { 'undercurl' },
                    ok = { 'undercurl' },
                },
            },
        })
    end,
}
