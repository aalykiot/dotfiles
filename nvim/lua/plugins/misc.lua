return {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    -- Autopairs
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
    },
    -- Transparent background
    {
        'xiyaowong/transparent.nvim',
        config = function()
            -- Configuration
            require('transparent').setup({
                exclude_groups = { 'StatusLine', 'StatusLineNC' },
            })
            -- Make background transparent
            vim.cmd(':TransparentEnable')
        end,
    },
    -- Notifications
    {
        'j-hui/fidget.nvim',
        version = 'v1.6.1', -- Fixes the transparency issue
        config = function()
            require('fidget').setup({
                notification = {
                    -- Transparent background
                    window = {
                        winblend = 0,
                    },
                },
            })
        end,
    },
    -- Git indications
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            local gitsigns = require('gitsigns')
            local toggle_blame = gitsigns.toggle_current_line_blame
            -- Initialize the plugin.
            gitsigns.setup()
            -- Create the keymaps.
            vim.keymap.set('n', '<leader>gb', toggle_blame, { desc = 'Toggle git blame' })
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
    -- Closing buffers
    {
        'kazhala/close-buffers.nvim',
        config = function()
            require('close_buffers').setup({})
            vim.keymap.set('n', '<C-q>', '<cmd>BDelete! this<CR>', { desc = 'Close active buffer' })
        end,
    },
    -- Markdown preview
    {
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        ft = { 'markdown' },
        build = 'cd app && npm install && git restore .',
        init = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
    },
}
