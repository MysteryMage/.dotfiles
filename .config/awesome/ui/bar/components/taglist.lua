local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

-- Beer mugs with different fill levels.
-- Candels that are lit based on active.
-- Playing cards?
return function(s)
	local taglist_buttons = gears.table.join(
		awful.button({}, 1, function(t)
			t:view_only()
		end),
		awful.button({ RC.vars.modkey }, 1, function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end),
		awful.button({}, 3, awful.tag.viewtoggle),
		awful.button({ RC.vars.modkey }, 3, function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end),
		awful.button({}, 4, function(t)
			awful.tag.viewnext(t.screen)
		end),
		awful.button({}, 5, function(t)
			awful.tag.viewprev(t.screen)
		end)
	)

	local taglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
		layout = {
			spacing = dpi(8),
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			id = "taglist",
			text = "",
			widget = wibox.widget.textbox,
			forced_width = dpi(30),
			create_callback = function(self, tag)
				local bar = self:get_children_by_id("taglist")[1]

				self.update = function()
					if tag.selected then
						bar.markup = util.get_colored_text("", beautiful.taglist_fg_focus)
						bar.opacity = 1.0
					else
						bar.markup = ""

						if #tag:clients() > 0 then
							bar.opacity = 1.0
						else
							bar.opacity = 0.5
						end
					end
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
