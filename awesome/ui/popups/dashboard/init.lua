local awful = require("awful")
local wibox = require("wibox")
local util = require("util")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local music_info = require("ui.popups.dashboard.music")
local powermenu = require("ui.popups.dashboard.power")
local date = require("ui.popups.dashboard.date")

local dashboard_popup = wibox({
	widget = {
		{
			{
				{
					widget = wibox.container.background,
					bg = beautiful.bg_light,
					shape = util.rrect(beautiful.global_radius),
				},
				widget = wibox.container.margin,
				margins = dpi(6),
			},
			{
				{
					powermenu,
					date,
					spacing = dpi(12),
					layout = wibox.layout.flex.horizontal,
				},
				widget = wibox.container.margin,
				margins = dpi(6),
			},
			music_info,
			layout = wibox.layout.flex.vertical,
		},
		widget = wibox.container.margin,
		margins = dpi(6),
	},
	height = (awful.screen.focused().geometry.height - beautiful.bar_height - beautiful.useless_gap * 2) * 0.75,
	width = awful.screen.focused().geometry.width * 0.3,
	border_color = beautiful.popup_border,
	border_width = 2,
	bg = beautiful.popup_bg,
	shape = util.rrect(beautiful.global_radius),
	ontop = true,
	visible = false,
})

awful.placement.top_left(dashboard_popup, {
	offset = {
		x = beautiful.useless_gap,
		y = beautiful.bar_height + beautiful.useless_gap,
	},
})

awesome.connect_signal("signal::dashboard", function()
	dashboard_popup.visible = not dashboard_popup.visible
end)
