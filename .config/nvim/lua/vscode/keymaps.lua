-- Resuable options for remapping
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Space>', '', opts)

vim.g.mapleader = ' '
vim.g.maolocalleader = ' '

-- System clipboard
vim.keymap.set({ 'n', 'v'}, '<leader>y', '"+y', opts)
vim.keymap.set({ 'n', 'v'}, '<leader>p', '"+p', opts)

-- Indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Moving text up and down
vim.keymap.set('v', 'J', ':m .+1<CR>==', opts)
vim.keymap.set('v', 'K', ':m .-2<CR>==', opts)
vim.keymap.set('x', 'J', ':move \'>+1<CR>gv-gv', opts)
vim.keymap.set('x', 'K', ':move \'<-2<CR>gv-gv', opts)

-- Preserve yanked piece
vim.keymap.set('v', 'p', '"_dP', opts)

-- Search highlighting (after escaping)
vim.keymap.set('n', '<Esc>', '<Esc>:noh<CR>', opts)
