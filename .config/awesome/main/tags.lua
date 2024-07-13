local awful = require("awful")

local M = {}

M.get = function()
	local tags = {}

	awful.screen.connect_for_each_screen(function(s)
		if s == screen.primary then
			tags[s] = awful.tag({ "1", "2", "3", "4", "5" }, s, RC.layouts[1])
		else
			tags[s] = awful.tag({ "1", "2", "3", "4", "5" }, s, RC.layouts[1])
		end
	end)

	return tags
end

return M
