-- Lua Line

local strawberry_theme = {
    red = '#9b4852',
    black = '#20181d',
    white = '#d0cdc7',
    blue = '#468dd4',
    purple = '#a26fbf',
    cyan = '#1b9e9e',
}

local theme  = {
    normal = {
        a = { fg = strawberry_theme.red, bg = strawberry_theme.black }, 
        b = { fg = strawberry_theme.white, bg = strawberry_theme.red }, 
        c = { fg = strawberry_theme.white, bg = strawberry_theme.red }, 
        x = { fg = strawberry_theme.white, bg = strawberry_theme.red }, 
        y = { fg = strawberry_theme.white, bg = strawberry_theme.red }, 
        z = { fg = strawberry_theme.white, bg = strawberry_theme.red }, 
    },
    
    insert = {
        a = { fg = strawberry_theme.red, bg = strawberry_theme.black }, 
        z = { fg = strawberry_theme.white, bg = strawberry_theme.red }, 
    },
    visual = {
        a = { fg = strawberry_theme.red, bg = strawberry_theme.black }, 
        z = { fg = strawberry_theme.white, bg = strawberry_theme.red }, 
    },
    replace = {
        a = { fg = strawberry_theme.red, bg = strawberry_theme.black },
        z = { fg = strawberry_theme.white, bg = strawberry_theme.red }, 
    },

    inactive = {},
}

local lualine = require('lualine')
lualine.setup{
  options = {
    icons_enabled = false,
    theme = 'catppuccin',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}
