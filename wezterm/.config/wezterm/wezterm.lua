-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'Dracula (base16)'
-- config.color_scheme = 'Dracula (Official)'
config.font = wezterm.font("FiraCode Nerd Font Mono", {weight = "DemiBold"})
config.font_size = 18

config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 900
config.leader = {
  key = "w",
  mods = "CTRL",
  timeout_milliseconds = math.maxinteger,
}
config.keys = {
  {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = "-",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right"),
  },
}

-- and finally, return the configuration to wezterm
return config
