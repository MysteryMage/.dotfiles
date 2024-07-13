local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

return function()
	local clock = wibox.widget({
		format = "%H:%M",
		font = "Recursive Mono SemiBold 18",
		widget = wibox.widget.textclock,
	})

	return clock
end
