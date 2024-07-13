local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

return function(s)
	local tasklist_buttons = gears.table.join(
		awful.button({}, 1, function(c)
			if c == client.focus then
				c.minimized = true
			else
				c:emit_signal("request::activate", "tasklist", { raise = true })
			end
		end),
		awful.button({}, 3, function()
			awful.menu.client_list({ theme = { width = 250 } })
		end),
		awful.button({}, 4, function()
			awful.client.focus.byidx(1)
		end),
		awful.button({}, 5, function()
			awful.client.focus.byidx(-1)
		end)
	)

	local tasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		style = {
			shape = gears.shape.rounded_rect,
		},
		layout = {
			spacing = dpi(12),
			row_count = 1,
			layout = wibox.layout.grid.horizontal,
		},
		widget_template = {
			{
				{
					{
						id = "clienticon",
						widget = awful.widget.clienticon,
					},
					margins = dpi(6),
					widget = wibox.container.margin,
				},
				id = "taskbg",
				widget = wibox.container.background,
				shape = util.rrect(beautiful.global_radius),
				bg = beautiful.bg_light,
			},
			margins = { top = dpi(5), bottom = dpi(5) },
			widget = wibox.container.margin,
			create_callback = function(self, c, index, objects) --luacheck: no unused
				self:get_children_by_id("clienticon")[1].client = c
			end,
		},
	})

	return tasklist
end
