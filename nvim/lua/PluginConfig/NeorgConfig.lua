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
        }
    }
}
