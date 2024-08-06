-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Frappe"
config.font = wezterm.font("Victor Mono Nerd Font Mono")
config.font_size = 16.0
config.font_rules = {
	{
		italic = true,
		font = wezterm.font("VictorMonoNerdFont", { italic = true }),
	},
}
config.warn_about_missing_glyphs = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = require("keymaps")
require("smart-splits").setup(config)
config.window_close_confirmation = "NeverPrompt"
config.audible_bell = "Disabled"
return config
