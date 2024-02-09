local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local dpi = beautiful.xresources.apply_dpi
local util = require("util")

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

	local candle_config = {
		{ type = "wide" },
		{ type = "thin" },
		{ type = "wide" },
		{ type = "wide" },
		{ type = "thin" },
	}

	local taglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
		layout = {
			spacing = dpi(20),
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			id = "candle",
			image = gears.filesystem.get_configuration_dir() .. "theme/icons/candle-wide.svg",
			widget = wibox.widget.imagebox,
			create_callback = function(self, tag)
				local bar = self:get_children_by_id("candle")[1]

				self.update = function()
					if tag.selected then
						bar.image = gears.filesystem.get_configuration_dir()
							.. "theme/icons/candle-"
							.. candle_config[tag.index].type
							.. "-lit.svg"
					else
						bar.image = gears.filesystem.get_configuration_dir()
							.. "theme/icons/candle-"
							.. candle_config[tag.index].type
							.. ".svg"
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
			margins = { top = dpi(6), bottom = dpi(6), left = dpi(16), right = dpi(16) },
		},
		widget = wibox.container.background,
		shape = util.rrect(beautiful.global_radius),
		bg = beautiful.bar_lighter_bg,
	})

	return taglist_container
end
