local gears = require("gears")

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

return M
