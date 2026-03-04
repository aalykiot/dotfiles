return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.config').setup({
            ensure_installed = {
                'bash',
                'lua',
                'luadoc',
                'jsdoc',
                'json',
                'javascript',
                'typescript',
                'rust',
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
