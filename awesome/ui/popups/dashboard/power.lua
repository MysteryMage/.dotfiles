local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local util = require("util")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local run_command_on_click = function(widget, command)
	widget:buttons(gears.table.join(
		widget:buttons(),
		awful.button({}, 1, nil, function()
			awesome.emit_signal("signal::dashboard")
			awful.spawn.with_shell(command)
		end)
	))
end

local create_power_button = function(color, icon)
	return wibox.widget({
		{
			util.margined_icon(
				gears.filesystem.get_configuration_dir() .. "theme/icons/" .. icon .. ".svg",
				color,
				nil,
				nil,
				16
			),
			widget = wibox.container.place,
		},
		widget = wibox.container.background,
		bg = beautiful.bg_light,
		shape = util.rrect(beautiful.global_radius),
	})
end

local power = create_power_button(beautiful.power, "power")
local reboot = create_power_button(beautiful.reboot, "restart")
local sleep = create_power_button(beautiful.sleep, "sleep")
local lock = create_power_button(beautiful.lock, "lock")

run_command_on_click(power, "systemctl poweroff")
run_command_on_click(reboot, "systemctl reboot")
run_command_on_click(sleep, "systemctl suspend")
run_command_on_click(lock, "betterlockscreen -l")

util.change_cursor_on_hover(power, "hand2")
util.change_cursor_on_hover(reboot, "hand2")
util.change_cursor_on_hover(sleep, "hand2")
util.change_cursor_on_hover(lock, "hand2")

local powermenu = wibox.widget({
	{
		power,
		reboot,
		spacing = dpi(12),
		layout = wibox.layout.flex.horizontal,
	},
	{
		sleep,
		lock,
		spacing = dpi(12),
		layout = wibox.layout.flex.horizontal,
	},
	spacing = dpi(12),
	layout = wibox.layout.flex.vertical,
})

return powermenu
