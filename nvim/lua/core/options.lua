-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Make line numbers visible (with relative numbers)
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- Copy indent from current line
vim.opt.autoindent = true

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

-- Use spaces instead of tabs
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.signcolumn = 'yes'

-- Disbale line wrap as default
vim.opt.wrap = false
vim.opt.linebreak = false

-- Update times
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Displaying special characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Make backspace work properly
vim.opt.backspace = 'indent,eol,start'

-- Preview substitution live, as you type
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and bellow the cursor
vim.opt.scrolloff = 10

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


