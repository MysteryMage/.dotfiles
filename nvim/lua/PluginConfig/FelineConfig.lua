local colors = {
    '#2a1f1e', -- Background
    '#41302e',
    '#58413f',
    '#6f524f',
    '#bba2a0',
    '#cbb8b7', -- Foreground
    '#dccfcd',
    '#ece5e4',

    '#cb6077',
    '#c58920',
    '#e8e80e',
    '#05CC83',
    '#8ab3b5',
    '#6897e7',
    '#a34d5f',
    '#b0987a',
}
local theme = {
    bg = colors[1],
    fg = colors[6],
}

local vi_mode_colors = {
    ['NORMAL'] = colors[9],
    ['INSERT'] = colors[16],
    ['VISUAL'] = colors[14],
    ['OP'] = colors[9],
    ['BLOCK'] = colors[14],
    ['REPLACE'] = colors[10],
    ['V-REPLACE'] = colors[13],
    ['ENTER'] = colors[12],
    ['MORE'] = colors[12],
    ['SELECT'] = colors[14],
    ['COMMAND'] = colors[15],
    ['SHELL'] = colors[15],
    ['TERM'] = colors[15],
    ['NONE'] = colors[11],
}

local feline_lsp_ok, feline_lsp = pcall(require, 'feline.providers.lsp')
if not feline_lsp_ok then
    vim.api.nvim_err_writeln('Failed to load feline lsp provider')
    return
end

local feline_vi_mode_utils_ok, feline_vi_mode_utils =
    pcall(require, 'feline.providers.vi_mode')
if not feline_vi_mode_utils_ok then
    vim.api.nvim_err_writeln('Failed to load feline vim mode utils provider')
    return
end

local components = {
    active = {{}, {}, {}},
    inactive = {{}, {}}
}

-- Vim Mode
table.insert(components.active[1], {
    provider = function()
        return ' ' .. feline_vi_mode_utils.get_vim_mode()
    end,
    hl = function()
        local val = {}

        val.fg = feline_vi_mode_utils.get_mode_color()
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
        fg = colors[10],
    },
    left_sep = ' ',
})

-- File
table.insert(components.active[1], {
    provider = {
        name = 'file_info',
        opts = {
            type = 'short',
            file_readonly_icon = ' ',
            file_modified_icon = '',
        }
    },
    hl = {
        fg = colors[6],
    },
    left_sep = ' ',
})

-- Lsp Error
table.insert(components.active[3], {
    provider = 'diagnostic_errors',
    enabled = function() return feline_lsp.diagnostics_exist('Error') end,
    hl = {
        fg = colors[9],
    },
    -- left_sep = ' ',
})

-- Lsp Warning
table.insert(components.active[3], {
    provider = 'diagnostic_warnings',
    enabled = function() return feline_lsp.diagnostics_exist('Warn') end,
    hl = {
        fg = colors[11],
    },
    -- left_sep = ' ',
})

-- Lsp Info
table.insert(components.active[3], {
    provider = 'diagnostic_info',
    enabled = function() return feline_lsp.diagnostics_exist('Info') end,
    hl = {
        fg = colors[12],
    },
    -- left_sep = ' ',
})

-- File Type
table.insert(components.active[3], {
    provider = {
        name = 'file_type',
    },
    hl = {
        fg = colors[13],
    },
    left_sep = ' ',
    right_sep = ' ',
})

-- Lsp Server Name
table.insert(components.active[3], {
    provider = 'lsp_client_names',
    icon = '',
    hl = {
        fg = colors[16],
    },
    right_sep = ' ',
    left_sep = '',
})

-- Line Percentage
table.insert(components.active[3], {
    provider = 'line_percentage',
    hl = {
        fg = colors[14],
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

        val.fg = feline_vi_mode_utils.get_mode_color()

        return val
    end,
    right_sep = ' ',
})

-- File Inactive
table.insert(components.inactive[1], {
    provider = {
        name = 'file_info',
        opts = {
            type = 'short',
            file_readonly_icon = ' ',
            file_modified_icon = '',
        }
    },
    hl = {
        fg = colors[6],
    },
    left_sep = ' ',
})

-- Location Inactive
table.insert(components.inactive[2], {
    provider = {
        name = 'position',
    },
    hl = function()
        local val = {}

        val.fg = feline_vi_mode_utils.get_mode_color()

        return val
    end,
    right_sep = ' ',
})


local feline_ok, feline = pcall(require, 'feline')
if not feline_ok then
    vim.api.nvim_err_writeln('Failed to load feline')
    return
end

feline.setup({
    components = components,
    vi_mode_colors = vi_mode_colors,
})

feline.use_theme(theme)
