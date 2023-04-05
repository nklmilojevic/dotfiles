local wezterm = require("wezterm")

local config = {
	font = wezterm.font_with_fallback({ "PragmataProMonoLiga Nerd Font" }),
	window_decorations = "RESIZE",
	font_size = 16.0,
	color_scheme = "Dracula",
	enable_tab_bar = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = true,
	window_padding = { left = 10, right = 10, top = 10, bottom = 10 },
}

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "+",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "LeftArrow",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "RightArrow",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
}

config.colors = {
	tab_bar = {
		background = "#171720",
		inactive_tab = {
			bg_color = "#2B2B41",
			fg_color = "#808080",
		},
		new_tab = {
			bg_color = "#171720",
			fg_color = "#808080",
		},
	},
}

config.unix_domains = { { name = "unix" } }
config.default_gui_startup_args = { "connect", "unix" }

config.mux_env_remove = {
	"SSH_CLIENT",
	"SSH_CONNECTION",
}

return config
