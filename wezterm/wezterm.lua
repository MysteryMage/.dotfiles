local wezterm = require 'wezterm'

local get_default_prog = function()
    if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
        return { 'powershell' }
    else
        return
    end
end

local get_window_decoration = function(windows_no_title)
    if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
        if windows_no_title then
            return 'RESIZE'
        end
        return 'TITLE | RESIZE'
    else
        return 'RESIZE'
    end
end

local set_keys = function()
    local keys = {
        {
            key = 'v',
            mods = 'LEADER',
            action = wezterm.action({ SplitHorizontal = { domain = 'CurrentPaneDomain' } }),

        },
        {
            key = 's',
            mods = 'LEADER',
            action = wezterm.action({ SplitVertical = { domain = 'CurrentPaneDomain' } }),

        },
        {
            key = 't',
            mods = 'LEADER',
            action = wezterm.action.SpawnTab('CurrentPaneDomain'),
        },
        { key = 'n', mods = 'LEADER', action = wezterm.action({ ActivateTabRelative = 1 }) },
        { key = 'p', mods = 'LEADER', action = wezterm.action({ ActivateTabRelative = -1 }) },
        { key = 'k', mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = true } },
        { key = 'l', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Right' }) },
        { key = 'h', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Left' }) },
        { key = 'k', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Up' }) },
        { key = 'j', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Down' }) },
        { key = 'c', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },
    }

    for i = 1, 8 do
        table.insert(keys, {
            key = tostring(i),
            mods = 'LEADER',
            action = wezterm.action.ActivateTab(i - 1),
        })
    end

    return keys

end

wezterm.on('format-tab-title', function(tab)
    local tab_config = { { Background = { Color = '#2a1f1e' } },
        { Text = ' ' .. tab.active_pane.title .. ' ' } }
    if tab.is_active then
        tab_config[1]['Background']['Color'] = '#41302e'
    end
    return tab_config
end)

return {
    default_prog = get_default_prog(),

    default_cursor_style = 'SteadyBlock',

    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    show_tab_index_in_tab_bar = false,
    tab_max_width = 64,
    enable_kitty_graphics = true,

    window_decorations = get_window_decoration(false),
    audible_bell="Disabled",

    initial_rows = 38,
    initial_cols = 140,

    font = wezterm.font('MapleMono'),
    font_size = 16.0,

    window_background_opacity = 1.0,
    window_padding = {
        left = "1.8%",
        right = "1.2%",
        top = "2.2%",
        bottom = "1.2%",
    },

    colors = require('colors.tavern'),

    leader = { key = 'z', mods = 'CTRL', timeout_milliseconds = 1000 },
    keys = set_keys(),
}
