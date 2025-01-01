return {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    name = 'rose-pine',
    config = function()
        -- Fine tune the theme
        require('rose-pine').setup({
            variant = 'moon',
            styles = {
                bold = false,
                italic = false,
                transparency = false,
            },
        })
        -- Enable theme
        vim.cmd.colorscheme('rose-pine')
    end,
}
