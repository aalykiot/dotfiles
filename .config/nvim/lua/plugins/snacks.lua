return {
    'folke/snacks.nvim',
    config = function()
        -- Init 'snacks' plugin
        local snacks = require('snacks')

        -- Keymaps
        vim.keymap.set('n', '<leader>sf', snacks.picker.files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>sh', snacks.picker.help, { desc = 'Search help pages' })
        vim.keymap.set('n', '<leader>sk', snacks.picker.keymaps, { desc = 'Search keymaps' })
        vim.keymap.set('n', '<leader>sb', snacks.picker.lines, { desc = 'Search buffer' })
        vim.keymap.set('n', '<leader>sB', snacks.picker.lines, { desc = 'Grep open buffers' })
        vim.keymap.set('n', '<leader>sd', snacks.picker.diagnostics, { desc = 'Search diagnostics' })
        vim.keymap.set('n', '<leader>sD', snacks.picker.diagnostics_buffer, { desc = 'Search buffer diagnostics' })
        vim.keymap.set('n', '<leader>sg', snacks.picker.grep, { desc = 'Grep' })
        vim.keymap.set('n', '<leader>ss', snacks.picker.lsp_symbols, { desc = 'Search symbols' })
        vim.keymap.set('n', '<leader>sS', snacks.picker.lsp_workspace_symbols, { desc = 'Search workspace symbols' })
        vim.keymap.set('n', '<leader>sk', snacks.picker.keymaps, { desc = 'Search keymaps' })
        vim.keymap.set('n', '<leader>/', snacks.picker.grep, { desc = 'Grep' })
        vim.keymap.set('n', '<leader><leader>', snacks.picker.buffers, { desc = 'Find buffers' })
    end,
}
