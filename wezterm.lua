local wezterm = require "wezterm"
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.font_size = 14
config.font = wezterm.font("BlexMono Nerd Font")
config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.color_scheme = "Tokyo Night"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_and_split_indices_are_zero_based = true
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

return config