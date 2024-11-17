return  {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    local neotree = require("neo-tree")

    -- Default options.
    neotree.setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        position = 'left',
        width = 30,
      },
    })

    -- Setting up the keymaps.
    vim.keymap.set('n', '<leader>e', ':Neotree toggle reveal=true<CR>', { desc = 'Open file [E]xplorer' })
  end,
}
