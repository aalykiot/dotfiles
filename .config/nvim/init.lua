-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- When this config is loaded from VSCode, just use the following keymaps
if vim.g.vscode then
    -- Use neovim through VSCode
    require('vscode.keymaps')
else
    -- Load keymaps and options
    require('options')
    require('keymaps')

    -- Ordinary Neovim
    vim.keymap.set('n', '<leader>L', '<cmd>Lazy<CR>', { desc = 'Open lazy.nvim UI' })

    -- Install plugins
    require('lazy').setup({
        require('plugins.neotree'),
        require('plugins.colorscheme'),
        require('plugins.telescope'),
        require('plugins.treesitter'),
        require('plugins.suggestions'),
        require('plugins.lsp'),
        require('plugins.format'),
        require('plugins.lint'),
        require('plugins.trouble'),
        require('plugins.tmux'),
        require('plugins.which-key'),
        require('plugins.misc'),
    })
end
