local colors = {
    '#1b1413', -- Background
    '#41302e',
    '#58413f',
    '#6f524f',
    '#bba2a0',
    '#cbb8b7', -- Foreground
    '#dccfcd',
    '#ece5e4',

    '#D8814B',
    '#C79C0B',
    '#D0472F',
    '#688C3B',
    '#AEB848',
    '#BB3075',
    '#A37B41',
    '#B3A532',
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
