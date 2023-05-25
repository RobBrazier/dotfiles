local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Catppuccin Mocha"
config.default_cursor_style = "BlinkingBar"
config.font = wezterm.font_with_fallback({ "JetBrains Mono", "Iosevka Term Nerd Font Complete" })
config.initial_cols = 144
config.initial_rows = 37

return config
