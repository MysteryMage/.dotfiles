local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

return function()
	return wibox.widget({
		{
			text = "󰕾",
			font = "16",
			align = "center",
			valign = "center",
			widget = wibox.widget.textbox,
		},
		value = 0.5,
		max_value = 1,
		min_value = 0,
		forced_height = dpi(42),
		forced_width = dpi(42),
        border_width = dpi(4),
        border_color = beautiful.bg_normal,
        color = beautiful.bg_focus,
		widget = wibox.container.radialprogressbar,
	})
end
