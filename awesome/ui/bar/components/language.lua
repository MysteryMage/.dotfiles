local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

return function()
	return {
		awful.widget.keyboardlayout(),
		widget = wibox.container.background,
		shape = util.rrect(dpi(6)),
		bg = beautiful.bar_lighter_bg,
	}
end
