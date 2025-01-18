local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local act = wezterm.action

config.automatically_reload_config = true
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

config.color_scheme = 'Dracula+'

config.font_size = 12.0

config.window_background_opacity = 0.85
config.macos_window_background_blur = 5
config.window_decorations = "RESIZE"
config.window_background_gradient = {
  colors = { '#000000' }
}

config.show_new_tab_button_in_tab_bar = false

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"

  if tab.is_active then
    background = "#ae8b2d"
    foreground = "#FFFFFF"
  end

  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)

config.keys = {
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = act.ActivateTabRelative(-1)
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = act.ActivateTabRelative(1)
  }
}

return config
