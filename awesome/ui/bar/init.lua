local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local util = require("util")
local dpi = beautiful.xresources.apply_dpi

local logo = require("ui.bar.components.logo")
local clock = require("ui.bar.components.clock")
local language = require("ui.bar.components.language")
local taglist = require("ui.bar.components.taglist")
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
		margins = { top = dpi(0), left = dpi(150), right = dpi(150), bottom = dpi(0) },
		screen = s,
		height = beautiful.bar_height,
		border_color = beautiful.popup_border,
		shape = function(cr, width, height)
			gears.shape.partially_rounded_rect(cr, width, height, false, false, true, true, beautiful.global_radius)
		end,
		border_width = 2,
	})

	s.mywibox:setup({
		{
			widget = wibox.container.margin,
			margins = { top = dpi(6), bottom = dpi(6), left = dpi(8), right = dpi(8) },
			{
				{
					-- logo(),
					taglist(s),
					spacing = dpi(8),
					layout = wibox.layout.fixed.horizontal,
				},
				widget = wibox.container.place,
				halign = "left",
			},
		},
		-- {
		-- 	widget = wibox.container.place,
		-- 	halign = "center",
		-- },
		{
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
					spacing = dpi(8),
					layout = wibox.layout.fixed.horizontal,
				},
				widget = wibox.container.place,
				halign = "right",
			},
			widget = wibox.container.margin,
			margins = { top = dpi(6), bottom = dpi(6), left = dpi(8), right = dpi(8) },
		},
		layout = wibox.layout.flex.horizontal,
	})
end)
