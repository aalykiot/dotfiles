-- https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    init = function()
        -- Enable highlighting
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(ctx)
                -- Enable treesitter highlighting and disable regex syntax
                pcall(vim.treesitter.start)
                -- Enable treesitter-based indentation (exlcude C#)
                local noIndent = { 'cs' }
                if not vim.list_contains(noIndent, ctx.match) then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })

        require('nvim-treesitter').install({
            'bash',
            'lua',
            'luadoc',
            'jsdoc',
            'json',
            'javascript',
            'typescript',
            'rust',
            'c_sharp',
        })
    end,
}
