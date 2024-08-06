local M = {}
function M.setup(config)
	local wezterm = require("wezterm")
	local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
	smart_splits.apply_to_config(config, {
		direction_keys = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
		modifiers = {
			move = "CTRL", 
			resize = "CTRL|ALT",
		},
	})
end

return M
