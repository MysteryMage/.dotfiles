local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

return function()
	local systray_button = wibox.widget({
		widget = wibox.widget.textbox,
		text = "",
	})

	local systray = wibox.widget({
		{
			widget = wibox.widget.systray,
			base_size = dpi(26),
		},
		layout = wibox.container.place,
		align = "center",
		visible = false,
	})

	systray_button:buttons(gears.table.join(
		systray_button:buttons(),
		awful.button({}, 1, nil, function()
			systray.visible = not systray.visible

			if systray.visible then
				systray_button.text = ""
			else
				systray_button.text = ""
			end
		end)
	))

	return wibox.widget({
		systray,
		{
			systray_button,
			margins = { left = dpi(8) },
			widget = wibox.container.margin,
		},
		layout = wibox.layout.fixed.horizontal,
	})
end
