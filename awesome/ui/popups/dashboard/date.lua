local wibox = require("wibox")
local util = require("util")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local date = wibox.widget({
	{
		{
			{
				{
					{

						markup = os.date("%d"),
						widget = wibox.widget.textbox,
						font = "Inter SemiBold 86",
						valign = "bottom",
					},
					widget = wibox.container.margin,
					margins = { bottom = dpi(-25) },
				},
				{
					{
						markup = "<span foreground='"
							.. beautiful.fg_normal
							.. "AA"
							.. "'>"
							.. os.date("%Y")
							.. "</span>",
						widget = wibox.widget.textbox,
						font = "Inter SemiBold 24",
						halign = "right",
					},
					widget = wibox.container.rotate,
					direction = "west",
				},
				layout = wibox.layout.fixed.horizontal,
			},
			{
				markup = "<span foreground='" .. beautiful.fg_normal .. "AA" .. "'>" .. os.date("%B") .. "</span>",
				widget = wibox.widget.textbox,
				font = "Inter SemiBold 24",
			},
			layout = wibox.layout.fixed.vertical,
		},
		widget = wibox.container.place,
	},
	widget = wibox.container.background,
	bg = beautiful.bg_light,
	shape = util.rrect(beautiful.global_radius),
})

return date
