return {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
        -- Fine tune the theme
        require('rose-pine').setup({
            variant = 'auto',
            dark_variant = 'main',
            styles = {
                bold = false,
                italic = false,
            },
        })
    end,
}
