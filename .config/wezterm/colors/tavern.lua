local colors = {
    '#1b1413', -- Background
    '#322523',
    '#493633',
    '#553f3c',
    '#bba2a0',
    '#cbb8b7', -- Foreground
    '#dccfcd',
    '#ece5e4',

    '#b24345',
    '#e56357',
    '#b7774e',
    '#e5e557',
    '#61cc7c',
    '#5487bf',
    '#7566cc',
    '#e5507f',
}

local tavern = {
    foreground = colors[6],
    background = colors[1],

    cursor_bg = colors[5],
    cursor_fg = colors[1],
    cursor_border = colors[5],

    selection_fg = colors[6],
    selection_bg = colors[2],

    scrollbar_thumb = colors[3],

    split = colors[4],

    ansi = {
        colors[2],
        colors[9],
        colors[12],
        colors[11],
        colors[14],
        colors[13],
        colors[16],
        colors[5],
    },
    brights = {
        colors[3],
        colors[9],
        colors[12],
        colors[11],
        colors[14],
        colors[13],
        colors[16],
        colors[7],
    },

    tab_bar = {
        background = colors[1],
        new_tab = {
            bg_color = colors[1],
            fg_color = colors[15],
        },
    },

    indexed = { [16] = colors[13], [17] = colors[14] },

    compose_cursor = colors[10],
}

return tavern
