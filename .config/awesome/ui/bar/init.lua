local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local util = require("util")
local dpi = beautiful.xresources.apply_dpi

local logo = require("ui.bar.components.logo")
local clock = require("ui.bar.components.clock")
local language = require("ui.bar.components.language")
local taglist = require("ui.bar.components.taglist-number")
local tasklist = require("ui.bar.components.tasklist")
local systray = require("ui.bar.components.systray")
local battery = require("ui.bar.components.battery")

awful.screen.connect_for_each_screen(function(s)
	s.layoutbox = awful.widget.layoutbox(s)
	s.layoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = beautiful.bar_height,
		border_color = beautiful.popup_border,
		shape = function(cr, width, height)
			gears.shape.partially_rounded_rect(cr, width, height, false, false, false, false, beautiful.global_radius)
		end,
	})

	s.mywibox:setup({
		{
			{
				taglist(s),
				{
					{
						wibox.widget.textbox(" "),
						widget = wibox.container.background,
						shape = util.rrect(beautiful.global_radius),
						bg = beautiful.bg_light,
					},
					widget = wibox.container.margin,
					margins = { top = dpi(10), bottom = dpi(10) },
				},
				tasklist(s),

				spacing = dpi(12),
				layout = wibox.layout.fixed.horizontal,
			},
			nil,
			{
				{
					{
						{
							systray(),
							widget = awful.widget.only_on_screen,
						},
						widget = wibox.container.margin,
						margins = { right = dpi(12) },
					},
					battery,
					language(),
					clock(),
					spacing = dpi(12),
					layout = wibox.layout.fixed.horizontal,
				},
				widget = wibox.container.place,
				halign = "right",
			},
			layout = wibox.layout.align.horizontal,
		},
		widget = wibox.container.margin,
		margins = dpi(8),
	})
end)
