local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

return function(s)
	local taglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.selected,
		layout = {
			spacing = dpi(8),
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			id = "text_role",
			align = "center",
			widget = wibox.widget.textbox,
			create_callback = function(self, _, index, _)
				local bar = self:get_children_by_id("text_role")

				self.update = function()
					bar.markup = index
				end

				self.update()
			end,

			update_callback = function(self)
				self.update()
			end,
		},
	})

	local taglist_container = wibox.widget({
		{
			taglist,
			widget = wibox.container.margin,
			margins = { top = dpi(8), bottom = dpi(8), left = dpi(16), right = dpi(16) },
		},
		widget = wibox.container.background,
		shape = util.rrect(beautiful.global_radius),
		bg = beautiful.bar_lighter_bg,
	})

	return taglist_container
end
