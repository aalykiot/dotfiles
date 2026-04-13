return {
    'echasnovski/mini.nvim',
    config = function()
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require('mini.surround').setup()
        require('mini.ai').setup()
        require('mini.comment').setup()
        require('mini.move').setup()
        require('mini.pairs').setup()

        -- Simple and easy statuslines
        local statusline = require('mini.statusline')

        statusline.setup({ use_icons = vim.g.have_nerd_font })
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return '%2l:%-2v'
        end
    end,
}
