local dpi = require("beautiful").xresources.apply_dpi
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local util = require("util")

naughty.config.defaults["icon_size"] = dpi(92)

local function get_notif_image(n)
	if n.image then
		return wibox.widget({
			{
				widget = wibox.widget.imagebox,
				image = n.image,
				clip_shape = util.rrect(beautiful.global_radius),
			},
			widget = wibox.container.margin,
			margins = dpi(2),
		})
	end

	return {
		widget = wibox.widget.textbox,
		font = "38",
		markup = "<span foreground='" .. beautiful.bg_urgent .. "'></span>",
	}
end

naughty.connect_signal("request::display", function(n)
	naughty.layout.box({
		notification = n,
		shape = util.rrect(beautiful.global_radius),
		minimum_width = dpi(650),
		maximum_width = dpi(650),
		minimum_height = dpi(120),
		maximum_height = dpi(120),
		widget_template = {
			{
				spacing = 10,
				layout = wibox.layout.fixed.horizontal,
				{
					widget = wibox.container.background,
					bg = beautiful.notification_image_bg,
					shape = util.rrect(beautiful.global_radius),
					forced_width = dpi(170),
					{
						get_notif_image(n),
						widget = wibox.container.place,
						valign = "center",
					},
				},
				{
					{
						{
							{
								{
									{
										widget = wibox.widget.textbox,
										markup = "<span weight='bold'>" .. util.ellipsize(n.title, 25) .. "</span>",
										font = "Inter SemiBold 18",
										align = "left",
									},
									margins = { top = dpi(5) },
									widget = wibox.container.margin,
								},
								{
									widget = wibox.widget.textbox,
									markup = "<span foreground='"
										.. beautiful.fg_normal
										.. "dd'>"
										.. n.message
										.. "</span>",
									font = "Inter SemiBold 16",
									align = "left",
								},
								spacing = 8,
								layout = wibox.layout.fixed.vertical,
							},

							widget = wibox.container.place,
							valign = "center",
							halign = "left",
						},
						widget = wibox.container.margin,
						margins = { top = dpi(6), bottom = dpi(6), left = dpi(8), right = dpi(8) },
					},
					{
						{
							widget_template = {
								{
									{
										{
											{
												{
													id = "text_role",
													font = "Inter SemiBold 14",
													widget = wibox.widget.textbox,
												},
												left = dpi(6),
												right = dpi(6),
												widget = wibox.container.margin,
											},
											widget = wibox.container.place,
										},
										widget = wibox.container.margin,
										margins = { bottom = dpi(6), top = dpi(6), right = dpi(6), left = dpi(6) },
									},
									bg = beautiful.notification_image_bg,
									widget = wibox.container.background,
									shape = util.rrect(beautiful.global_radius),
								},
								widget = wibox.container.margin,
								margins = { bottom = dpi(6), right = dpi(6), top = dpi(3) },
							},
							style = {
								underline_normal = false,
								underline_selected = true,
							},
							widget = naughty.list.actions,
						},
						widget = wibox.container.margin,
						left = dpi(8),
					},
					fill_space = true,
					spacing = 4,
					layout = wibox.layout.fixed.vertical,
				},
			},
			bg = beautiful.notification_bg,
			shape = util.rrect(beautiful.global_radius),
			widget = naughty.container.background,
		},
	})
end)
