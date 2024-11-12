local wezterm = require("wezterm")

local act = wezterm.action

local config = {
	font = wezterm.font("JetBrainsMono Nerd Font"),
	color_scheme = "Catppuccin Mocha",
	font_size = 16.0,
	window_frame = { font_size = 16.0 },
	keys = {
		{
			key = "R",
			mods = "CTRL|SHIFT",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			key = "V",
			mods = "CTRL|SHIFT",
			action = act.SendString("run_cmd_in_ws_or_package nvim\n"),
		},
		{ key = "RightArrow", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Next" }) },
		{ key = "LeftArrow", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Prev" }) },
		{ key = "UpArrow", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "DownArrow", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{
			key = "G",
			mods = "CTRL|SHIFT",
			action = act.SendString("run_cmd_in_ws_or_package cd\n"),
		},
		{
			key = "k",
			mods = "CMD",
			action = act.Multiple({
				act.ClearScrollback("ScrollbackAndViewport"),
				act.SendKey({ key = "L", mods = "CTRL" }),
			}),
		},
		{
			key = "\\",
			mods = "CMD",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "CMD",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "CMD|ALT",
			action = wezterm.action.SplitPane({
				direction = "Down",
				command = { domain = "CurrentPaneDomain" },
				size = { Percent = 35 },
			}),
		},
	},
}

return config
