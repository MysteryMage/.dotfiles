return {
    {
        'nmac427/guess-indent.nvim',

        config = function()
            local guess_ok, guess = pcall(require, 'guess-indent')
            if not guess_ok then
                vim.api.nvim_echo({ { '[Plugin] Guess-Indent doesn\'t exist' } }, true, { err = true })
                return
            end

            guess.setup({})
        end,
    },
}
