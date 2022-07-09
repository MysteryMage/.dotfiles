local catppuccin = require('catppuccin.core.palettes').get_palette()
local colors = {
    bg = catppuccin.mantle,
    fg = catppuccin.text,
    rosewater = catppuccin.rosewater,
	flamingo = catppuccin.flamingo,
	pink = catppuccin.pink,
	mauve = catppuccin.mauve,
	red = catppuccin.red,
	maroon = catppuccin.maroon,
	peach = catppuccin.peach,
	yellow = catppuccin.yellow,
	green = catppuccin.green,
	teal = catppuccin.teal,
	sky = catppuccin.sky,
	sapphire = catppuccin.sapphire,
	blue = catppuccin.blue,
	lavender = catppuccin.lavender,
}

local vi_mode_colors = {
    ['NORMAL'] = colors.maroon,
    ['INSERT'] = colors.sky,
    ['VISUAL'] = colors.sapphire,
    ['OP'] = colors.maroon,
    ['BLOCK'] = colors.sky,
    ['REPLACE'] = colors.flamingo,
    ['V-REPLACE'] = colors.flamingo,
    ['ENTER'] = colors.lavender,
    ['MORE'] = colors.lavender,
    ['SELECT'] = colors.peach,
    ['COMMAND'] = colors.mauve,
    ['SHELL'] = colors.maroon,
    ['TERM'] = colors.sky,
    ['NONE'] = colors.yellow
}

local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')
local cursor = require('feline.providers.cursor')

local components = {
    active = {{}, {}, {}},
    inactive = {{}, {}}
}

-- Vim Mode
table.insert(components.active[1], {
    provider = function()
        return ' ' .. vi_mode_utils.get_vim_mode().. ' '
    end,
    hl = function()
        local val = {}

        val.fg = vi_mode_utils.get_mode_color()
        val.style = 'bold'

        return val
    end,
    right_sep = ' '
})

-- Git Branch
table.insert(components.active[1], {
    provider = 'git_branch',
    icon = ' ',
    hl = {
        fg = colors.peach,
    },
    left_sep = ' ',
})

-- File
table.insert(components.active[1], {
    provider = {
        name = 'file_info',
        opts = {
            type = 'short',
            file_readonly_icon = '',
            file_modified_icon = '',
        }
    },
    hl = {
        fg = colors.lavender,
    },
    left_sep = ' ',
})

-- Lsp Error
table.insert(components.active[3], {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist('Error') end,
    hl = {
        fg = colors.red,
    },
    -- left_sep = ' ',
})

-- Lsp Warning
table.insert(components.active[3], {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist('Warn') end,
    hl = {
        fg = colors.yellow,
    },
    -- left_sep = ' ',
})

-- Lsp Info
table.insert(components.active[3], {
    provider = 'diagnostic_info',
    enabled = function() return lsp.diagnostics_exist('Info') end,
    hl = {
        fg = colors.green,
    },
    -- left_sep = ' ',
})

-- Lsp Server Name
table.insert(components.active[3], {
    provider = 'lsp_client_names',
    icon = ' ',
    hl = {
        fg = colors.yellow,
    },
    right_sep = ' ',
    left_sep = '  ',
})

table.insert(components.active[3], {
    provider = 'line_percentage',
    hl = {
        fg = colors.blue,
    },
    right_sep = ' ',
})

-- Location
table.insert(components.active[3], {
    provider = {
        name = 'position',
    },
    hl = function()
        local val = {}

        val.fg = vi_mode_utils.get_mode_color()

        return val
    end,
    right_sep = ' ',
})

require('feline').setup({
    components = components,
    vi_mode_colors = vi_mode_colors,
})
