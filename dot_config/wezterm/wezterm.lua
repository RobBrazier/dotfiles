local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Mocha"

config.window_background_opacity = 0.9

config.automatically_reload_config = true

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 0,
}
config.initial_rows = 38
config.initial_cols = 149
config.default_cursor_style = "SteadyBar"

return config
