return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer', -- Text sources in the buffer.
    'hrsh7th/cmp-path', -- File system path sources.
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      build = 'make install_jsregexp',
    },
    'saadparwaiz1/cmp_luasnip', -- Lua snippets for autocompletion.
    'rafamadriz/friendly-snippets', -- Useful snippets.
    'onsails/lspkind.nvim', -- VS-code like pictograms.
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require(clspkindc)

    -- Loads vscode snippets from installed plugins (e.g friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()
    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      snippet = {
        -- Consifure how nvim-cmp interacts with snippet engine.
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = false }),
      }),
      -- Define a list of sources.
      sources = cmp.config.sources({
        { name = 'luasnip' }, -- Snippets.
        { name = 'buffer' }, -- Text within current buffer.
        { name = 'path' }, -- File system paths.
      }),
      -- Configure lspkind for vs-code like pictograms.
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = '...',
        }),
      },
    })
  end,
}
