local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

return function()
	return {
		widget = wibox.container.background,
		shape = util.rrect(beautiful.global_radius),
		bg = beautiful.bar_lighter_bg,
		{
			{
				widget = wibox.widget.textbox,
				font = "24",
				markup = "<span foreground='" .. beautiful.bg_focus .. "'></span>",
			},
			widget = wibox.container.margin,
			margins = { left = dpi(12), right = dpi(12) },
		},
	}
end
