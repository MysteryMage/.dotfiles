local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local util = require("util")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local brightness_progress_bar = wibox.widget({
	value = 0.5,
	widget = wibox.widget.progressbar,
	color = beautiful.brightness_progress_color,
	background_color = beautiful.brightness_progress_bg,
	shape = util.rrect(beautiful.global_radius),
	bar_shape = util.rrect(beautiful.global_radius),
	forced_height = dpi(15),
	forced_width = dpi(180),
})

local brightness_precentage = wibox.widget({
	markup = "<b>50%</b>",
	valign = "center",
	halign = "center",
	widget = wibox.widget.textbox,
})

local brightness_popup = awful.popup({
	widget = {
		{
			{
				{
					text = "󰃟",
					font = "36",
					widget = wibox.widget.textbox,
				},
				spacing = dpi(15),
				{
					{
						brightness_progress_bar,
						brightness_precentage,
						layout = wibox.layout.stack,
					},
					margins = { top = dpi(22), bottom = dpi(22), left = dpi(6) },
					widget = wibox.container.margin,
				},
				layout = wibox.layout.fixed.horizontal,
			},
			margins = { right = dpi(25), left = dpi(25) },
			widget = wibox.container.margin,
		},
		margins = 10,
		widget = wibox.container.margin,
	},
	bg = beautiful.popup_bg,
	ontop = true,
	placement = function(d)
		return awful.placement.top_right(d, {
			offset = {
				y = 120,
				x = -20,
			},
		})
	end,
	hide_on_right_click = true,
	offset = { y = 60 },
	shape = util.rrect(beautiful.global_radius),
	visible = false,
})

local brightness_disappear_timer = gears.timer({
	timeout = 1,
	callback = function()
		brightness_popup.visible = false
	end,
})

awesome.connect_signal("signal::brightness", function(value)
	brightness_popup.visible = true
	brightness_progress_bar.value = value / 100
	brightness_precentage.markup = "<span foreground='" .. beautiful.fg_focus .. "'><b>" .. value .. "%</b></span>"
	brightness_disappear_timer:again()
end)
