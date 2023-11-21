-- Needs the upower package
local upower = require("lgi").UPowerGlib
local battery = upower.Client():get_display_device()

local status_names = {
	[upower.DeviceState.PENDING_DISCHARGE] = "Discharging",
	[upower.DeviceState.PENDING_CHARGE] = "Charging",
	[upower.DeviceState.FULLY_CHARGED] = "Full",
	[upower.DeviceState.EMPTY] = "N/A",
	[upower.DeviceState.DISCHARGING] = "Discharging",
	[upower.DeviceState.CHARGING] = "Charging",
	[upower.DeviceState.UNKNOWN] = "N/A",
}

local prev_state = {}
local function on_battery_update()
	local state = status_names[battery.state]
	local percentage = battery.percentage

	if prev_state.percentage ~= percentage or prev_state.state ~= state then
		awesome.emit_signal("signal::battery", percentage, state)
	end

	prev_state.percentage = percentage
	prev_state.state = state
end

on_battery_update()
battery.on_notify = on_battery_update
