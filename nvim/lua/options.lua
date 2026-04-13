-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false -- highlight cursor line
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- Tabs, spaces and identation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true -- smart auto-ident
vim.opt.autoindent = true -- copy ident from current line
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

vim.opt.ignorecase = true
vim.opt.smartcase = true -- case sensitive if uppercase
vim.opt.hlsearch = true -- highlight search results
vim.opt.incsearch = true -- show matches as you type

vim.opt.signcolumn = 'yes' -- show the sign column
vim.opt.showmatch = true -- highlight matching brackets
vim.opt.cmdheight = 0 -- hide command line
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.lazyredraw = true -- do not redraw during macros

-- Sync clipboard between OS and Neovim
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- Handle undo directory
local undodir = vim.fn.expand('~/.vim/undodir')
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, 'p')
end

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true -- use undo files
vim.opt.undodir = undodir
vim.opt.autoread = true -- auto-reload changes if outside neovim
vim.opt.autowrite = false -- do not auto save

vim.opt.updatetime = 300 -- faster completions
vim.opt.timeoutlen = 500

vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = 'indent,eol,start' -- better backspace behaviour
vim.opt.autochdir = false -- do not auto change directories
vim.opt.iskeyword:append('-') -- consider kebab case a single word
vim.opt.selection = 'inclusive'
vim.opt.encoding = 'utf-8'

vim.opt.splitbelow = true -- horizontal splits go bellow
vim.opt.splitright = true -- vertical splits go right

vim.opt.wildmenu = true -- tab completion
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory
