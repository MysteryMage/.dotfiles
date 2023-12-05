local wibox = require("wibox")
local awful = require("awful")
local util = require("util")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi

local playerctl = require("libs.bling").signal.playerctl.lib({ interval = 60 })

local album_art = wibox.widget({
	widget = wibox.widget.imagebox,
	clip_shape = util.rrect(beautiful.global_radius),
})

local song_name = wibox.widget({
	font = "Inter SemiBold 30",
	halign = "center",
	text = "Nothing's Playing...",
	widget = wibox.widget.textbox,
})

local artist_name = wibox.widget({
	font = "Inter SemiBold 20",
	halign = "center",
	text = "Some peace and quiet",
	widget = wibox.widget.textbox,
})

local skip_previous = util.margined_icon(
	gears.filesystem.get_configuration_dir() .. "theme/icons/skip-previous.svg",
	beautiful.fg_normal,
	dpi(50),
	dpi(50),
	8
)
local play_pause = util.margined_icon(
	gears.filesystem.get_configuration_dir() .. "theme/icons/play-arrow.svg",
	beautiful.fg_normal,
	dpi(50),
	dpi(50),
	8
)

local skip_next = util.margined_icon(
	gears.filesystem.get_configuration_dir() .. "theme/icons/skip-next.svg",
	beautiful.fg_normal,
	dpi(50),
	dpi(50),
	8
)

util.change_cursor_on_hover(skip_previous, "hand2")
util.change_cursor_on_hover(play_pause, "hand2")
util.change_cursor_on_hover(skip_next, "hand2")

skip_previous:buttons(gears.table.join(
	skip_previous:buttons(),
	awful.button({}, 1, nil, function()
		playerctl:previous()
	end)
))

play_pause:buttons(gears.table.join(
	play_pause:buttons(),
	awful.button({}, 1, nil, function()
		playerctl:play_pause()
	end)
))

skip_next:buttons(gears.table.join(
	skip_next:buttons(),
	awful.button({}, 1, nil, function()
		playerctl:next()
	end)
))

local margined_art = util.add_margin_to_widget(album_art, 16)

local music_info = wibox.widget({
	{
		{
			{
				margined_art,
				widget = wibox.container.place,
			},
			util.add_margin_to_widget({
				{
					{
						song_name,
						artist_name,
						{
							{
								{
									skip_previous,
									play_pause,
									skip_next,
									layout = wibox.layout.fixed.horizontal,
								},
								widget = wibox.container.place,
								halign = "center",
							},
							widget = wibox.container.margin,
							margins = { top = dpi(16) },
						},
						layout = wibox.layout.fixed.vertical,
					},
					layout = wibox.layout.flex.vertical,
				},
				widget = wibox.container.place,
				fill_horizontal = true,
			}, dpi(2)),
			id = "ratio_layout",
			layout = wibox.layout.ratio.horizontal,
		},
		widget = wibox.container.background,
		bg = beautiful.bg_light,
		shape = util.rrect(beautiful.global_radius),
	},
	widget = wibox.container.margin,
	margins = dpi(6),
})

music_info:get_children_by_id("ratio_layout")[1]:adjust_ratio(1, 0, 0.4, 0.6)

local prev_album_art_path = ""

playerctl:connect_signal("metadata", function(_, title, artist, album_path, _album, _new, _player_name)
	if not album_path then
		margined_art.margins = 0
		album_art.visible = false
	else
		album_art:set_image(gears.surface.load_uncached(album_path))
		margined_art.margins = 16
		album_art.visible = true
	end

	song_name:set_markup_silently(util.ellipsize(title, 24))
	artist_name:set_markup_silently(
		"<span foreground='" .. beautiful.fg_normal .. "77" .. "'>" .. util.ellipsize(artist, 24) .. "</span>"
	)

	if prev_album_art_path then
		awful.spawn.with_shell("rm " .. prev_album_art_path)
	end

	prev_album_art_path = album_path
end)

playerctl:connect_signal("playback_status", function(_, playing, _player_name)
	if playing then
		play_pause:get_children()[1].image = gears.filesystem.get_configuration_dir() .. "theme/icons/pause.svg"
	else
		play_pause:get_children()[1].image = gears.filesystem.get_configuration_dir() .. "theme/icons/play-arrow.svg"
	end
end)

return music_info
