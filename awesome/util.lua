local gears = require("gears")
local wibox = require("wibox")

local M = {}

M.rrect = function(radius)
	return function(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, radius)
	end
end

M.partial_rrect = function(tl, tr, br, bl, radius)
	return function(cr, width, height)
		gears.shape.partially_rounded_rect(cr, width, height, tl, tr, br, bl, radius)
	end
end

M.arc = function(thickness, start_angle, end_angle, start_rounded, end_rounded)
	return function(cr, width, height)
		gears.shape.arc(cr, width, height, thickness, start_angle, end_angle, start_rounded, end_rounded)
	end
end

M.ellipsize = function(text, length)
	return (text:len() > length and length > 0) and text:sub(0, length - 3) .. "..." or text
end

M.add_margin_to_widget = function(widget, margin)
	return wibox.widget({
		widget,
		widget = wibox.container.margin,
		margins = margin,
	})
end

M.margined_icon = function(icon_path, color, width, height, margin)
	return M.add_margin_to_widget({
		widget = wibox.widget.imagebox,
		image = icon_path,
		stylesheet = "* { fill: " .. color .. "}",
		forced_width = width,
		forced_height = height,
	}, margin)
end

M.change_cursor_on_hover = function(widget, cursor)
	local old_cursor, old_wibox
	widget:connect_signal("mouse::enter", function()
		local wb = mouse.current_wibox
		old_cursor, old_wibox = wb.cursor, wb
		wb.cursor = cursor
	end)

	widget:connect_signal("mouse::leave", function()
		if old_wibox then
			old_wibox.cursor = old_cursor
			old_wibox = nil
		end
	end)
end

return M
