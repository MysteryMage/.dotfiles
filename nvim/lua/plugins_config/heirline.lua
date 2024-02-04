local heirline_ok, heirline = pcall(require, 'heirline')
if not heirline_ok then
    return
end

local conditions = require('heirline.conditions')
local utils = require('heirline.utils')

local mode = {
    init = function(self)
        self.mode = vim.fn.mode(1)
    end,

    static = {
        mode_names = {
            ['n'] = 'NO',
            ['no'] = 'OP',
            ['nov'] = 'OC',
            ['noV'] = 'OL',
            ['no\x16'] = 'OB',
            ['\x16'] = 'VB',
            ['niI'] = 'IN',
            ['niR'] = 'RE',
            ['niV'] = 'RV',
            ['nt'] = 'NT',
            ['ntT'] = 'TM',
            ['v'] = 'VI',
            ['vs'] = 'VI',
            ['V'] = 'VL',
            ['Vs'] = 'VL',
            ['\x16s'] = 'VB',
            ['s'] = 'SE',
            ['S'] = 'SL',
            ['\x13'] = 'SB',
            ['i'] = 'IN',
            ['ic'] = 'IC',
            ['ix'] = 'IX',
            ['R'] = 'RE',
            ['Rc'] = 'RC',
            ['Rx'] = 'RX',
            ['Rv'] = 'RV',
            ['Rvc'] = 'RC',
            ['Rvx'] = 'RX',
            ['c'] = 'CO',
            ['cv'] = 'CV',
            ['r'] = 'PR',
            ['rm'] = 'PM',
            ['r?'] = 'P?',
            ['!'] = 'SH',
            ['t'] = 'TE',
        },
        mode_colors = {
            n = 'autumn',
            i = 'forest',
            v = 'haze',
            V = 'haze',
            ['\22'] = 'haze',
            c = 'dirt',
            s = 'melon',
            S = 'melon',
            ['\19'] = 'melon',
            R = 'dirt',
            r = 'dirt',
            ['!'] = 'autumn',
            t = 'autumn',
        },
    },

    provider = function(self)
        return '%2(' .. self.mode_names[self.mode] .. '%)'
    end,

    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = self.mode_colors[mode], bold = true }
    end,

    update = {
        'ModeChanged',
        pattern = '*:*',
        callback = vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end),
    },
}

local filename_block = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}

local filename = {
    provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ':.')
        if filename == '' then
            return '[No Name]'
        end

        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return filename
    end,

    hl = { fg = 'fg' },
}

local file_flags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        provider = ' [+]',
        hl = { fg = 'fg' },
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = ' [RO]',
        hl = { fg = 'fg' },
    },
}

filename_block = utils.insert(filename_block, filename, file_flags, { provider = '%<' })

local ruler = {
    provider = '%7(%l/%3L%):%2c %P',
}

mode = utils.surround({ ' ', ' ' }, 'bg_light', mode)
mode = utils.surround({ ' ', ' ' }, 'bg_light', mode)
-- mode = utils.surround({ '', '' }, 'bg_light', mode)

local align = { provider = '%=' }
local space = { provider = ' ' }

local statusline = {
    space,
    mode,
    space,
    filename_block,
    align,
    ruler,
    space,
}

local inactive_statusline = {
    condition = conditions.is_not_active,
    space,
    filename_block,
    align,
    align,
    ruler,
    space,
}

local statuslines = {
    hl = { bg = 'bg' },
    fallthrough = false,

    statusline,
    inactive_statusline,
}

heirline.setup({
    statusline = statuslines,
    opts = {
        colors = {
            bg = '#1b1413',
            bg_light = '#322523',
            bg_lighter = '#493633',
            bg_lightest = '#553f3c',
            fg = '#bba2a0',
            fg_light = '#cbb8b7',
            fg_lighter = '#dccfcd',
            fg_lightest = '#ece5e4',

            autumn = '#b24345',
            melon = '#e56357',
            kiwi = '#b7774e',
            forest = '#e5e557',
            dirt = '#61cc7c',
            leaf = '#5487bf',
            watermelon = '#7566cc',
            haze = '#e5507f',
        },
    },
})
