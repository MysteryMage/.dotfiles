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

local brightness_popup = wibox({
	widget = {
		layout = wibox.container.place,
		{
			{
				{
					{
						{
							image = gears.filesystem.get_configuration_dir() .. "tavern/icons/brightness-medium.svg",
							stylesheet = "* { fill: " .. beautiful.fg_focus .. "}",
							forced_width = dpi(55),
							forced_height = dpi(55),
							widget = wibox.widget.imagebox,
						},
						widget = wibox.container.place,
						valign = "center",
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
	},
	height = dpi(120),
	width = dpi(320),
	border_color = beautiful.popup_border,
	border_width = 2,
	bg = beautiful.popup_bg,
	shape = util.rrect(beautiful.global_radius),
	ontop = true,
	visible = false,
})

awful.placement.top_right(brightness_popup, {
	offset = {
		x = -25,
		y = beautiful.bar_height + 25,
	},
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
