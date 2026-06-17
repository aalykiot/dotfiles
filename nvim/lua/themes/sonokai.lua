return {
    'sainnhe/sonokai',
    lazy = true,
    config = function()
        vim.g.sonokai_enable_italic = false
        vim.g.sonokai_transparent_background = 1
        vim.g.sonokai_disable_italic_comment = 1
        vim.g.sonokai_diagnostic_virtual_text = 'highlighted'
    end,
}
