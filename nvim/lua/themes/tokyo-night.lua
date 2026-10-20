return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require('tokyonight').setup({
            styles = {
                functions = {},
            },
        })
    end,
}
