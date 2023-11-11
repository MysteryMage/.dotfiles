local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

return function()
	return {
		widget = wibox.container.background,
		shape = util.rrect(beautiful.global_radius),
		bg = beautiful.bar_lighter_bg,
		{
			{
				widget = wibox.widget.imagebox,
				image = gears.filesystem.get_configuration_dir() .. "tavern/icons/menu.svg",
				stylesheet = "* { fill: " .. beautiful.fg_normal .. "}",
			},
			widget = wibox.container.margin,
			margins = { left = dpi(12), right = dpi(12) },
		},
	}
end
