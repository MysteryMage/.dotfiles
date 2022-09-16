local neorg_ok, neorg = pcall(require, 'neorg')
if not neorg_ok then
    vim.api.nvim_err_writeln('Failed to load neorg')
    return
end

neorg.setup {
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
        ['core.export'] = {},
        ['core.export.markdown'] = {
            config = {
                extensions = 'all',
            }
        },
    }
}
