-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Function to check if the current pane is running Neovim
local function is_vim(pane)
	return pane:get_user_vars().NVIM == "true"
end

-- Define direction keys for navigation
local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

-- Function to handle split navigation
local function split_nav(key)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- Pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = "CTRL" },
				}, pane)
			else
				win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
			end
		end),
	}
end

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
	key = "b",
	mods = "CTRL",
	-- timeout_milliseconds = math.maxinteger,
}

config.keys = {
	-- Move between split panes using Leader + hjkl
	split_nav("h"),
	split_nav("j"),
	split_nav("k"),
	split_nav("l"),
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
	direction_keys = { "h", "j", "k", "l" },
	-- modifier keys to combine with direction_keys
	modifiers = {
		-- move = 'CTRL', -- modifier to use for pane movement, e.g. CTRL+h to move left
		move = "LEADER", -- modifier to use for pane movement, e.g. CTRL+h to move left
		resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
})
-- and finally, return the configuration to wezterm
return config
