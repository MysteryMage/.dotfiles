local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")

return gears.table.join(
	awful.key({ RC.vars.modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ RC.vars.modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ RC.vars.modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	-- Show keybinds
	awful.key({ RC.vars.modkey }, "/", function()
		hotkeys_popup.show_help()
	end, { description = "Show bindings", group = "awesome" }),

	-- Move window focus
	awful.key({ RC.vars.modkey }, "h", function()
		awful.client.focus.bydirection("left")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus on left window", group = "client" }),
	awful.key({ RC.vars.modkey }, "j", function()
		awful.client.focus.bydirection("down")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus on window below", group = "client" }),
	awful.key({ RC.vars.modkey }, "k", function()
		awful.client.focus.bydirection("up")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus on window above", group = "client" }),
	awful.key({ RC.vars.modkey }, "l", function()
		awful.client.focus.bydirection("right")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus on right window", group = "client" }),

	-- Swap windows
	awful.key({ RC.vars.modkey, "Shift" }, "h", function()
		awful.client.swap.bydirection("left")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Swap with left window", group = "client" }),
	awful.key({ RC.vars.modkey, "Shift" }, "j", function()
		awful.client.swap.bydirection("down")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Swap with window below", group = "client" }),
	awful.key({ RC.vars.modkey, "Shift" }, "k", function()
		awful.client.swap.bydirection("up")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Swap with window above", group = "client" }),
	awful.key({ RC.vars.modkey, "Shift" }, "l", function()
		awful.client.swap.bydirection("right")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Swap with right window", group = "client" }),

	-- Resize window
	awful.key({ RC.vars.modkey, "Control" }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ RC.vars.modkey, "Control" }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),

	-- Focus on screen
	awful.key({ RC.vars.modkey }, "n", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ RC.vars.modkey }, "p", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),

	awful.key(
		{ RC.vars.modkey },
		"u",
		awful.client.urgent.jumpto,
		{ description = "jump to urgent client", group = "client" }
	),

	awful.key(
		{ RC.vars.modkey, "Control" },
		"r",
		awesome.restart,
		{ description = "reload awesome", group = "awesome" }
	),
	awful.key({ RC.vars.modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

	-- Move between layouts
	awful.key({ RC.vars.modkey }, "Tab", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ RC.vars.modkey, "Shift" }, "Tab", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	awful.key({ RC.vars.modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Prompt
	awful.key({ RC.vars.modkey }, "r", function()
		awful.spawn.with_shell("rofi -show drun -dpi 0")
	end, { description = "Select app with rofi", group = "launcher" }),
	awful.key({ RC.vars.modkey }, "s", function()
		awful.spawn.with_shell("rofi -show window -dpi 0")
	end, { description = "Select window with rofi", group = "launcher" }),
	awful.key({ RC.vars.modkey, "Shift" }, "p", function()
		awful.spawn.with_shell("~/.config/rofi/bin/powermenu")
	end, { description = "Show power menu", group = "launcher" }),
	awful.key({ "Mod1" }, "Shift_L", function()
		awful.spawn.with_shell("~/.config/awesome/scripts/toggle-kbd-layout.sh")
	end, { description = "Switch languages", group = "other" }),
	awful.key({ RC.vars.modkey }, "Return", function()
		awful.spawn(RC.vars.terminal)
	end, { description = "Open a terminal", group = "launcher" }),

	-- Audio
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn.easy_async_with_shell("~/.config/awesome/scripts/volume.sh increase 5", function(stdout)
			local volume = tonumber(stdout)
			awesome.emit_signal("signal::volume", volume)
		end)
	end, { description = "Increase volume", group = "audio" }),
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn.easy_async_with_shell("~/.config/awesome/scripts/volume.sh decrease 5", function(stdout)
			local volume = tonumber(stdout)
			awesome.emit_signal("signal::volume", volume)
		end)
	end, { description = "Decrease volume", group = "audio" }),
	awful.key({}, "XF86AudioMute", function()
		awful.spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle")
	end, { description = "Mute volume", group = "audio" }),

	-- Brightness
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn.easy_async_with_shell("~/.config/awesome/scripts/brightness.sh increase 2", function(stdout)
			local brightness = tonumber(stdout)
			awesome.emit_signal("signal::brightness", brightness)
		end)
	end, { description = "Increase brightness", group = "brightness" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn.easy_async_with_shell("~/.config/awesome/scripts/brightness.sh decrease 2", function(stdout)
			local brightness = tonumber(stdout)
			awesome.emit_signal("signal::brightness", brightness)
		end)
	end, { description = "Decrease brightness", group = "brightness" })
)
