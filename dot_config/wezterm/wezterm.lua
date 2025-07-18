local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'wsl.exe', '~', '-d', 'Ubuntu-22.04' }
end

config.color_scheme = 'Catppuccin Mocha'

-- config.window_background_opacity = 0.95

config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
}

config.automatically_reload_config = true

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- config.window_decorations = "INTEGRATED_BUTTONS"

config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 0,
}

config.initial_rows = 38
config.initial_cols = 149

config.default_cursor_style = 'SteadyBar'

local get_transparent_color = function(hex)
  local background = wezterm.color.parse(hex)
  local bg_h, bg_s, bg_l, _ = background:hsla()
  return wezterm.color.from_hsla(bg_h, bg_s, bg_l, 0.95)
end

local color_scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]

config.tab_max_width = 20

if not config.use_fancy_tab_bar then
  if config.window_background_opacity ~= nil and config.window_background_opacity < 1 then
    config.colors = {
      tab_bar = {
        background = get_transparent_color(color_scheme.tab_bar.inactive_tab.bg_color),
      },
    }
  end
  wezterm.on('format-tab-title', function(tab)
    local background = get_transparent_color(color_scheme.tab_bar.inactive_tab.bg_color)
    if tab.is_active then
      background = get_transparent_color(color_scheme.tab_bar.active_tab.bg_color)
    end
    return {
      { Background = { Color = background } },
      { Text = ' ' .. tab.tab_index + 1 },
      { Text = ': ' },
      { Text = tab.active_pane.title .. ' ' },
    }
  end)
end

return config
