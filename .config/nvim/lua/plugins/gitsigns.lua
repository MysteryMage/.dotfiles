return {
    {
        'lewis6991/gitsigns.nvim',

        config = function()
            local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
            if not gitsigns_ok then
                vim.api.nvim_echo({ { '[Plugin] Gitsigns doesn\'t exist' } }, true, { err = true })
                return
            end

            gitsigns.setup({})
        end,
    },
}
