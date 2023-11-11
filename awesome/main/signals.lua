local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

require("ui.titlebar")

client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)

local battery_script =
	"bash -c 'echo $(cat /sys/class/power_supply/BAT0/capacity) echo $(cat /sys/class/power_supply/BAT0/status)'"

local function battery_emit()
	awful.spawn.easy_async_with_shell(battery_script, function(stdout)
		local level = string.match(stdout:match("(%d+)"), "(%d+)")
		local level_int = tonumber(level)
		local power = not stdout:match("Discharging")
		awesome.emit_signal("signal::battery", level_int, power)
	end)
end

if gears.filesystem.file_readable("/sys/class/power_supply/BAT0/capacity") then
	gears.timer({
		timeout = 10,
		call_now = true,
		autostart = true,
		callback = function()
			battery_emit()
		end,
	})
end
