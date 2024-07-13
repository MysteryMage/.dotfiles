local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

return function()
	local language = wibox.widget({
		{
			{
				widget = awful.widget.keyboardlayout,
			},
			widget = wibox.container.margin,
			margins = { top = dpi(8), bottom = dpi(8), left = dpi(8), right = dpi(8) },
		},
		widget = wibox.container.background,
		shape = util.rrect(beautiful.global_radius),
		bg = beautiful.bar_lighter_bg,
	})

	return language
end
