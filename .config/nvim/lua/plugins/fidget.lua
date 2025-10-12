return {
    {
        'j-hui/fidget.nvim',

        config = function()
            local fidget_ok, fidget = pcall(require, 'fidget')
            if not fidget_ok then
                vim.api.nvim_echo({ { '[Plugin] Fidget doesn\'t exist' } }, true, { err = true })
                return
            end

            fidget.setup({
                notification = {
                    window = {
                        normal_hl = 'Comment',
                        winblend = 0,
                        border = 'none',
                        zindex = 45,
                        max_width = 0,
                        max_height = 0,
                        x_padding = 1,
                        y_padding = 0,
                        align = 'bottom',
                        relative = 'editor',
                    },
                },
            })
        end,
    },
}
