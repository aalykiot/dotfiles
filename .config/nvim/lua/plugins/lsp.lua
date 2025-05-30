return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        {
            'folke/lazydev.nvim',
            ft = 'lua', -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
        },
    },
    config = function()
        -- Add cmp capabilities to lsp_config
        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

        -- Setup keymaps
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end,
        })

        -- Disable inline diagnostic messages
        -- vim.diagnostic.config({ virtual_text = false })

        -- Change diagnostics symbols
        local signs = { Error = '󰅙', Info = '󰋼', Hint = '󰌵', Warn = '' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        -- LSP servers we want to be installed
        local ensure_installed = {
            'lua_ls',
            'ts_ls',
            'rust_analyzer',
            'gopls',
            'pyright',
        }

        -- Setup mason
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = ensure_installed,
            automatic_installation = true,
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            },
        })

        -- Install linters manually
        require('mason-tool-installer').setup({
            ensure_installed = {
                'eslint_d',
                'pylint',
            },
        })

        -- Setup keymap to open mason UI
        vim.keymap.set('n', '<leader>M', '<cmd>Mason<CR>', { desc = 'Open the mason UI' })
    end,
}
