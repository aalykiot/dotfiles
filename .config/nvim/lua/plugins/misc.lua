return {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    -- Autopairs
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
    },
    -- Additional vim motions
    {
        'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup()
        end,
    },
    -- Notifications
    {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup()
        end,
    },
    -- Git indications
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            })
        end,
    },
    -- Crates.io support
    {
        'saecki/crates.nvim',
        tag = 'stable',
        event = { 'BufRead Cargo.toml' },
        config = function()
            require('crates').setup({
                lsp = {
                    enabled = true,
                    actions = true,
                    hover = true,
                },
                completion = {
                    cmp = {
                        enabled = true,
                    },
                },
            })
        end,
    },
    -- LSP Breadcrumbs
    {
        'utilyre/barbecue.nvim',
        version = '*',
        dependencies = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('barbecue').setup()
        end,
    },
    -- Closing buffers
    {
        'kazhala/close-buffers.nvim',
        config = function()
            require('close_buffers').setup()
            vim.keymap.set('n', '<C-q>', '<cmd>BDelete! this<CR>', { desc = 'Close active buffer' })
        end,
    },
}
