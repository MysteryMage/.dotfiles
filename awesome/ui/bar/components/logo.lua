local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

return function()
	local logo = wibox.widget({
		widget = wibox.container.background,
		shape = util.rrect(beautiful.global_radius),
		bg = beautiful.bar_lighter_bg,
		{
			{
				{
					widget = wibox.widget.imagebox,
					image = gears.filesystem.get_configuration_dir() .. "theme/icons/coin.svg",
					forced_height = dpi(28),
					forced_width = dpi(28),
				},
				widget = wibox.container.margin,
				margins = { left = dpi(16), right = dpi(16), top = dpi(6), bottom = dpi(6) },
			},
			widget = wibox.container.place,
			valign = "center",
		},
	})

	logo:buttons(gears.table.join(
		logo:buttons(),
		awful.button({}, 1, nil, function()
			awesome.emit_signal("signal::dashboard")
		end)
	))

	util.change_cursor_on_hover(logo, "hand2")

	return logo
end
