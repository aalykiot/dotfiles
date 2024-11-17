-- Highlight, edit, and navigate code.
return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  main = 'nvim-treesitter.configs',
  opts = { 
    auto_install = true,
    indent = { enable = true },
    highlight = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'go',
      'javascript',
      'jsdoc',
      'json',
      'json5',
      'proto',
      'python',
      'tsx',
      'typescript',
      'sql',
      'prisma',
      'rust'
    },
  }
}
