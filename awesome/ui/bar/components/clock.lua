local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

return function()
	local clock = wibox.widget({
		{
			wibox.widget.textclock("%H:%M"),
			widget = wibox.container.margin,
			margins = { top = dpi(6), left = dpi(12), right = dpi(12), bottom = dpi(6) },
		},
		widget = wibox.container.background,
		shape = util.rrect(beautiful.global_radius),
		bg = beautiful.bar_lighter_bg,
	})

	return clock
end
