local neorg_ok, neorg = pcall(require, 'neorg')
if not neorg_ok then
    return
end

neorg.setup {
    load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {
            config = {
                icon_preset = 'varied',
            }
        },
        ['core.dirman'] = {
            config = {
                workspaces = {
                    main = '~/Notes',
                }
            }
        },
        ['core.export'] = {},
        ['core.export.markdown'] = {
            config = {
                extensions = 'all',
            }
        },
    }
}
