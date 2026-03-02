return {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    config = function()
        -- Fine tune the theme
        require('rose-pine').setup({
            variant = 'moon',
            dark_variant = 'moon',
            styles = {
                bold = false,
                italic = false,
            },
        })
    end,
}
