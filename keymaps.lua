local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("tabbed-if-not", function(window, pane)
	os.execute("bash ~/Scripts/i3-tabbed-if-not.sh")
end)
wezterm.on("move_to_scratchpad", function(window, pane)
	os.execute("i3-msg '[class=\"term-bottom\"]move scratchpad'")
end)

return {
	{
		key = "p",
		mods = "SUPER",
		action = act.Multiple({
			act.EmitEvent("tabbed-if-not"),
			act.SpawnCommandInNewWindow({
				label = "Find Project",
				args = { "zsh", "-ic", "fzf_cd_neovim_tabbed" },
			}),
		}),
	},
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "t",
		mods = "CTRL|SUPER|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 20 },
		}),
	},
	-- {
	-- 	key = "LeftArrow",
	-- 	mods = "SUPER|ALT",
	-- 	action = act.ActivatePaneDirection("Left"),
	-- },
	-- {
	-- 	key = "RightArrow",
	-- 	mods = "SUPER|ALT",
	-- 	action = act.ActivatePaneDirection("Right"),
	-- },
	-- {
	-- 	key = "UpArrow",
	-- 	mods = "SUPER|ALT",
	-- 	action = act.ActivatePaneDirection("Up"),
	-- },
	-- {
	-- 	key = "DownArrow",
	-- 	mods = "SUPER|ALT",
	-- 	action = act.ActivatePaneDirection("Down"),
	-- },
	{
		key = "h",
		mods = "SUPER|ALT|SHIFT",
		action = act.EmitEvent("move_to_scratchpad"),
	},
}
