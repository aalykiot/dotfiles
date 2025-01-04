-- Resuable options for remapping
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Space>', '', opts)

vim.g.mapleader = ' '
vim.g.maolocalleader = ' '

-- System clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', opts)
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', opts)

-- Indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Moving text up and down
vim.keymap.set('v', 'J', ':m .+1<CR>==', opts)
vim.keymap.set('v', 'K', ':m .-2<CR>==', opts)
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", opts)
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", opts)

-- Preserve yanked piece
vim.keymap.set('v', 'p', '"_dP', opts)

-- Search highlighting (after escaping)
vim.keymap.set('n', '<Esc>', '<Esc>:noh<CR>', opts)

-- General keymaps
vim.keymap.set('n', '<leader>b', "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
vim.keymap.set('n', 'K', "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
vim.keymap.set('n', '<leader>ca', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
vim.keymap.set('n', '<leader>xx', "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
vim.keymap.set('n', '<leader>sf', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
vim.keymap.set('n', '<leader>f', "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
vim.keymap.set('n', '<leader>e', "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")
vim.keymap.set('n', '<leader>wsv', "<cmd>lua require('vscode').action('workbench.action.splitEditorRight')<CR>")
vim.keymap.set('n', '<leader>wsh', "<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<CR>")
vim.keymap.set('n', '<Tab>', "<cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>")
vim.keymap.set('n', '<S-Tab>', "<cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>")
