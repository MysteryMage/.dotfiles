local awful = require("awful")
local wibox = require("wibox")
local util = require("util")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local music_bar = wibox.widget({
	{
		widget = wibox.container.background,
		bg = beautiful.bg_light,
		shape = util.rrect(beautiful.global_radius),
	},
	widget = wibox.container.margin,
	margins = dpi(6),
})

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
					{
						widget = wibox.container.background,
						bg = beautiful.bg_light,
						shape = util.rrect(beautiful.global_radius),
					},
					widget = wibox.container.margin,
					margins = dpi(6),
				},
				music_bar,
				layout = wibox.layout.flex.vertical,
			},
			layout = wibox.layout.flex.vertical,
		},
		widget = wibox.container.margin,
		margins = dpi(6),
	},
	height = awful.screen.focused().geometry.height - beautiful.bar_height - beautiful.useless_gap * 2,
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

	if dashboard_popup.visible then
		-- Do things on visible
	end
end)
