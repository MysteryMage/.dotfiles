local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi
local util = require("util")

local titlebar_btn = function(c, color, shape)
	local tb = wibox.widget({
		wibox.widget.textbox(""),
		forced_width = dpi(16),
		forced_height = dpi(16),
		bg = color,
		shape = shape,
		widget = wibox.container.background,
	})

	tb:connect_signal("mouse::enter", function()
		tb.bg = client.focus ~= c and "#1b1413" or color .. "aa"
	end)

	tb:connect_signal("mouse::leave", function()
		tb.bg = client.focus ~= c and "#1b1413" or color
	end)

	c:connect_signal("unfocus", function()
		tb.bg = "#1b1413"
	end)

	c:connect_signal("focus", function()
		tb.bg = color
	end)

	return tb
end

local titlebar_btn_icon = function(c, icon, color)
	return util.margined_icon(
		gears.filesystem.get_configuration_dir() .. "theme/icons/" .. icon .. ".svg",
		color,
		dpi(24),
		dpi(24),
		dpi(3)
	)
end

client.connect_signal("request::titlebars", function(c)
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	local close = titlebar_btn_icon(c, "close", "#cbb8b7")
	close:connect_signal("button::press", function(_)
		c:kill()
	end)

	local maximize = titlebar_btn_icon(c, "fullscreen", "#cbb8b7")
	maximize:connect_signal("button::press", function(_)
		c.maximized = not c.maximized
		c:raise()
	end)

	local minimize = titlebar_btn_icon(c, "minimize", "#cbb8b7")
	minimize:connect_signal("button::press", function(_)
		gears.timer.delayed_call(function()
			c.minimized = true
		end)
	end)

	awful.titlebar(c, { position = "top", size = dpi(30) }):setup({
		{
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{
			{
				{
					{
						minimize,
						maximize,
						close,
						layout = wibox.layout.flex.horizontal,
						spacing = dpi(8),
					},
					widget = wibox.container.margin,
					margins = { bottom = dpi(4) },
				},
				widget = wibox.container.margin,
				color = beautiful.bg_light,
				margins = { bottom = dpi(2) },
			},
			widget = wibox.container.margin,
			margins = { right = dpi(6) },
		},
		layout = wibox.layout.align.horizontal,
	})
end)
