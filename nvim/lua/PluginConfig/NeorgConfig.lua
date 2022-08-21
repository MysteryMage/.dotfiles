require('neorg').setup {
    load = {
        ['core.defaults'] = {},
        ['core.norg.concealer'] = {
            config = {
                icon_preset = 'varied',
            }
        },
        ['core.norg.dirman'] = {
            config = {
                workspaces = {
                    main = '~/Notes',
                }
            }
        },
        ["core.export"] = {},
        ["core.export.markdown"] = {
            config = {
                extensions = 'all',
            }
        },
    }
}
