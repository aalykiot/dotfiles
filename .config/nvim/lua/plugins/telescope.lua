return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
        'nvim-telescope/telescope-ui-select.nvim',
        {
            'nvim-tree/nvim-web-devicons',
            enabled = vim.g.have_nerd_font,
        },
    },
    config = function()
        -- Configuration
        require('telescope').setup({
            extentions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
            defaults = {
                mappings = {
                    i = {
                        ['<C-j>'] = require('telescope.actions').move_selection_next,
                        ['<C-k>'] = require('telescope.actions').move_selection_previous,
                    },
                },
                file_ignore_patterns = {
                    'node_modules',
                    '.git',
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        })

        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        -- Keymaps
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search help' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search keymaps' })
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search files' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search select Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current word' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search by grep' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search diagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search resume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search recent files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })

        -- Active buffer search
        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = 'Fuzzily search in current buffer' })

        -- Open files search
        vim.keymap.set('n', '<leader>s/', function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            })
        end, { desc = 'Search in open files' })

        -- Search Neovim config
        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files({ cwd = vim.fn.stdpath('config') })
        end)
    end,
}
