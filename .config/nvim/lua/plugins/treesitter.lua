return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'bash',
                'c',
                'diff',
                'html',
                'lua',
                'luadoc',
                'markdown',
                'markdown_inline',
                'query',
                'vim',
                'vimdoc',
                'css',
                'dockerfile',
                'go',
                'graphql',
                'jsdoc',
                'json',
                'sql',
                'tsx',
                'typescript',
                'yaml',
                'xml',
                'javascript',
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
