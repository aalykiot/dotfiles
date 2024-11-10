local wezterm = require('wezterm')
local wez_action = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.automatically_reload_config = true
config.window_close_confirmation = 'NeverPrompt'
config.line_height = 1.2
config.font_size = 14
config.font = wezterm.font('Menlo')
config.enable_tab_bar = true
config.window_decorations = 'RESIZE'
config.color_scheme = 'Tokyo Night'
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_and_split_indices_are_zero_based = true

-- Key Bindings

local function move_pane(key, direction)
	return {
		key = key,
		mods = 'LEADER',
		action = wez_action.ActivatePaneDirection(direction),
	}
end

local function split_pane(key, action)
	return {
		key = key,
		mods = 'LEADER',
		action = action({ domain = 'CurrentPaneDomain' }),
	}
end

local function resize_pane(key, direction)
	return {
		key = key,
		action = wez_action.AdjustPaneSize({ direction, 5 }),
	}
end

local function move_cursor(key, direction_string)
	return {
		key = key,
		mods = 'OPT',
		action = wez_action.SendString(direction_string),
	}
end

local function close_pane(key)
	return {
		key = key,
		mods = 'LEADER',
		action = wez_action.CloseCurrentPane({ confirm = true }),
	}
end

local function move_tab(key, direction)
	return {
		key = key,
		mods = 'LEADER',
		action = wez_action.ActivateTabRelative(direction),
	}
end

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
	{
		key = 'a',
		-- When we're in leader mode _and_ CTRL + A is pressed...
		mods = 'LEADER|CTRL',
		-- Actually send CTRL + A key to the terminal
		action = wez_action.SendKey({ key = 'a', mods = 'CTRL' }),
	},
	{
		-- When we push LEADER + R activate the `resize_panes` keytable
		key = 'r',
		mods = 'LEADER',
		action = wez_action.ActivateKeyTable({
			name = 'resize_panes',
			one_shot = false,
			timeout_milliseconds = 2000,
		}),
	},
	move_tab('n', 1),
	move_tab('b', -1),
	move_cursor('LeftArrow', '\x1bb'),
	move_cursor('RightArrow', '\x1bf'),
	move_pane('j', 'Down'),
	move_pane('k', 'Up'),
	move_pane('h', 'Left'),
	move_pane('l', 'Right'),
	split_pane('|', wez_action.SplitHorizontal),
	split_pane('-', wez_action.SplitVertical),
	close_pane('x'),
}

for i = 0, 9 do
	-- LEADER + num to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = 'LEADER',
		action = wez_action.ActivateTab(i),
	})
end

-- Key Tables

config.key_tables = {
	resize_panes = {
		resize_pane('j', 'Down'),
		resize_pane('k', 'Up'),
		resize_pane('h', 'Left'),
		resize_pane('l', 'Right'),
	},
}

-- Effects

wezterm.on('update-right-status', function(window, _)
	local prefix = ''
	local background = { Background = { Color = 'transparent' } }

	if window:leader_is_active() then
		prefix = ' ' .. utf8.char(0x26A1) -- ⚡ emoji
	end

	-- Show indication when we're on the leader mode
	window:set_left_status(wezterm.format({
		background,
		{ Text = prefix },
	}))
end)

return config
