-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = 'Dracula (base16)'
-- config.color_scheme = 'Dracula (Official)'

config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "DemiBold" })
config.font_size = 18

config.default_cursor_style = "BlinkingBlock"
-- config.default_cursor_style = "SteadyBlock"
-- config.cursor_blink_rate = 1000
-- config.animation_fps = 1
config.front_end = "WebGpu"

config.scrollback_lines = 1000000

-- config.multiplexer_integration = false
config.leader = {
	-- key = "w",
	key = "g",
	mods = "CTRL",
	-- timeout_milliseconds = math.maxinteger,
}

config.keys = {
-- 	{
-- 		key = "h",
-- 		mods = "LEADER",
-- 		action = act.ActivatePaneDirection("Left"),
-- 	},
-- 	{
-- 		key = "j",
-- 		mods = "LEADER",
-- 		action = act.ActivatePaneDirection("Down"),
-- 	},
-- 	{
-- 		key = "k",
-- 		mods = "LEADER",
-- 		action = act.ActivatePaneDirection("Up"),
-- 	},
-- 	{
-- 		key = "l",
-- 		mods = "LEADER",
-- 		action = act.ActivatePaneDirection("Right"),
-- 	},
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitHorizontal,
	},
	{
		key = "s",
		mods = "LEADER",
		action = act.SplitVertical,
	},
}

smart_splits.apply_to_config(config, {
  -- the default config is here, if you'd like to use the default keys,
  -- you can omit this configuration table parameter and just use
  -- smart_splits.apply_to_config(config)

  -- directional keys to use in order of: left, down, up, right
  direction_keys = { 'h', 'j', 'k', 'l' },
  -- modifier keys to combine with direction_keys
  modifiers = {
    -- move = 'CTRL', -- modifier to use for pane movement, e.g. CTRL+h to move left
    move = 'LEADER', -- modifier to use for pane movement, e.g. CTRL+h to move left
    resize = 'META', -- modifier to use for pane resize, e.g. META+h to resize to the left
  },
})
-- and finally, return the configuration to wezterm
return config
