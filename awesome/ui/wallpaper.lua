local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

function Set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end

		awful.wallpaper({
			screen = s,
			bg = "#000000",
			widget = {
				horizontal_fit_policy = "fill",
				vertical_fit_policy = "fill",
				upsacle = true,
				downscale = true,
				image = beautiful.wallpaper,
				widget = wibox.widget.imagebox,
			},
		})
	end
end

-- screen.connect_signal("property::geometry", Set_wallpaper)
