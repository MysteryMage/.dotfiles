local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local util = require("util")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local volume_progress_bar = wibox.widget({
	value = 0.5,
	widget = wibox.widget.progressbar,
	color = beautiful.volume_progress_color,
	background_color = beautiful.volume_progress_bg,
	shape = util.rrect(beautiful.global_radius),
	bar_shape = util.rrect(beautiful.global_radius),
	forced_height = dpi(15),
	forced_width = dpi(180),
})

local volume_precentage = wibox.widget({
	markup = "<span foreground=" .. beautiful.bg_normal .. "><b>50%</b></span>",
	valign = "center",
	halign = "center",
	widget = wibox.widget.textbox,
})

local volume_popup = awful.popup({
	widget = {
		{
			{
				{
					text = "󰕾",
					font = "36",
					widget = wibox.widget.textbox,
				},
				spacing = dpi(15),
				{
					{
						volume_progress_bar,
						volume_precentage,
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

local volume_disappear_timer = gears.timer({
	timeout = 1,
	callback = function()
		volume_popup.visible = false
	end,
})

awesome.connect_signal("signal::volume", function(value)
	volume_popup.visible = true
	volume_progress_bar.value = value / 100
	volume_precentage.markup = "<span foreground='" .. beautiful.fg_focus .. "'><b>" .. value .. "%</b></span>"
	volume_disappear_timer:again()
end)
