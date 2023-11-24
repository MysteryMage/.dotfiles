pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

RC = {}
RC.vars = require("main.variables")

require("main.error-handling")

beautiful.init(gears.filesystem.get_dir("config") .. "/theme/theme.lua")
require("ui.wallpaper")

local main = {
    layouts = require("main.layouts"),
    tags    = require("main.tags"),
    rules   = require("main.rules"),
}

local binding = {
    globalbuttons = require("bindings.globalbuttons"),
    clientbuttons = require("bindings.clientbuttons"),
    globalkeys    = require("bindings.globalkeys"),
    bindtotags    = require("bindings.tagsbindings"),
    clientkeys    = require("bindings.clientkeys")
}

RC.layouts = main.layouts
RC.tags = main.tags.get()

RC.globalkeys = binding.globalkeys
RC.globalkeys = binding.bindtotags.get(RC.globalkeys)

root.keys(RC.globalkeys)
root.buttons(binding.globalbuttons)

require("ui.bar")
require("ui.notification")
require('ui.popups')
require('main.modules')

awful.rules.rules = main.rules.get(
    binding.clientkeys,
    binding.clientbuttons
)

require("main.signals")

awful.spawn.with_shell(gears.filesystem.get_dir("config") .. "/scripts/autostart.sh")
