return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                component_separators = '',
                section_separators = '',
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { { 'branch', icon = '' } },
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = {},
            },
        })
    end,
}
