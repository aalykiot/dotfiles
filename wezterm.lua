local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.automatically_reload_config = true
config.window_close_confirmation = 'NeverPrompt'
config.font_size = 14
config.font = wezterm.font('BlexMono Nerd Font')
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'
config.color_scheme = 'Tokyo Night'

return config