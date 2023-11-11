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

    local systray = awful.popup({
		ontop = true,
		visible = false,
		widget = {
			widget = wibox.container.background,
			bg = beautiful.bg_normal,
			shape = util.rrect(beautiful.global_radius),
			forced_width = dpi(40),
			forced_height = dpi(120),
			{
				widget = wibox.container.margin,
				margins = { top = dpi(6), bottom = dpi(6), left = dpi(6), right = dpi(6) },
				{
					widget = wibox.widget.systray,
					horizontal = false,
					base_size = dpi(40),
					icon_spacing = dpi(50),
				},
			},
		},
		offset = { y = dpi(5), x = dpi(15) },
	})

	systray_button:buttons(gears.table.join(
		systray_button:buttons(),
		awful.button({}, 1, nil, function()
			if systray.visible then
				systray.visible = not systray.visible
				systray_button.text = ""
			else
				systray:move_next_to(mouse.current_widget_geometry)
				systray_button.text = ""
			end
		end)
	))

    return systray_button
end
