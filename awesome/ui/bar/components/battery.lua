local wibox = require("wibox")
local beautiful = require("beautiful")
local util = require("util")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi

local is_visible = false
if gears.filesystem.file_readable("/sys/class/power_supply/BAT0/capacity") then
	is_visible = true
end

local battery = wibox.widget({
	id = "battery",
	widget = wibox.widget.progressbar,
	max_value = 100,
	forced_width = dpi(130),
	forced_height = 20,
	shape = util.rrect(beautiful.global_radius),
	bar_shape = util.rrect(beautiful.global_radius),
})

local battery_text = wibox.widget({
	widget = wibox.widget.textbox,
	valign = "center",
	align = "center",
})

local batstatus = wibox.widget({
	{
		{
			{
				battery,
				battery_text,
				layout = wibox.layout.stack,
			},
			layout = wibox.layout.fixed.horizontal,
			spacing = dpi(15),
		},
		layout = wibox.layout.stack,
	},
	bg = beautiful.bar_lighter_bg,
	widget = wibox.container.background,
	shape = util.rrect(beautiful.global_radius),
	visible = is_visible,
})

awesome.connect_signal("signal::battery", function(value, state)
	local b = battery
	b.state = state
	b.value = value

	battery_text.markup = "<span foreground='" .. beautiful.fg_focus .. "'><b>" .. value .. "%</b></span>"

	if state then
		b.color = beautiful.battery_charge
		b.background_color = beautiful.battery_charge .. "60"
	elseif value < 18 then
		b.color = beautiful.battery_extreme_low
		b.background_color = beautiful.battery_extreme_low .. "60"
	elseif value < 30 then
		b.color = beautiful.battery_low
		b.background_color = beautiful.battery_low .. "60"
	else
		b.color = beautiful.battery_ok
		b.background_color = beautiful.battery_ok .. "60"
	end
end)

return batstatus
