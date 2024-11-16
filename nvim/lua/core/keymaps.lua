-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Disbale line wrap as default
vim.opt.wrap = false
vim.opt.linebreak = false

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle [L]ine [W]rapping' })

-- Splitting windows
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit window [V]ertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit window [H]orizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make [S]plit windows [E]qual width' })
vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close current window' })

-- Stay in indent mode when indenting things
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP')

-- Neotree
vim.keymap.set('n', '<leader>e', ':Neotree toggle reveal=true<CR>', { desc = 'Open file [E]xplorer' })
