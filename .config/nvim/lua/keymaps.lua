-- Clear highlights on search when <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', 'DK', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>-', '<C-a>', { desc = 'Decrement number' })

-- Awesome pasting remap (don't replace copy buffer on paste)
vim.keymap.set('n', '<leader>p', '"_dP')

-- Split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window management
vim.keymap.set('n', '<leader>wsv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wsh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wse', '<C-w>=', { desc = 'Make splits equal size' })

-- Buffers
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Go to next open buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Go to previous open buffer' })

-- Hightlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
