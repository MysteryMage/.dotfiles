local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

return function()
	local language = wibox.widget({
		{
			awful.widget.keyboardlayout(),
			widget = wibox.container.margin,
			margins = { left = dpi(6), right = dpi(6) },
		},
		widget = wibox.container.background,
		shape = util.rrect(beautiful.global_radius),
		bg = beautiful.bar_lighter_bg,
	})

	return language
end
