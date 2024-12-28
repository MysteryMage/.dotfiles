return {
    {
        dir = '~/dev/Plugins.nvim/tavern.nvim',
        config = function()
            vim.g.tavern_transparent = true
            vim.cmd.colorscheme('tavern')
        end,
    },
}
