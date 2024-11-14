return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('tokyonight').setup({
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
            }
        })
    end,
    init = function()
        vim.cmd.colorscheme 'tokyonight-night'
    end,
}
