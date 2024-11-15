return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup({
      -- transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        -- sidebars = 'transparent',
        -- floats = 'transparent',
      }
    })
  end,
  init = function()
    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
