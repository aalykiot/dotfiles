-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if a nerd font is user
vim.g.have_nerd_font = true

-- Enable line numbers / mouse mode
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- Options about lines/wrapping
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Options about time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- White space indication
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

-- Lines and cursrors
vim.opt.cursorline = true
vim.opt.scrolloff = 10