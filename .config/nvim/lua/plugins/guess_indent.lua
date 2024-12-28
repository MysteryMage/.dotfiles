return {
    {
        'nmac427/guess-indent.nvim',

        config = function()
            local guess_ok, guess = pcall(require, 'guess-indent')
            if not guess_ok then
                vim.api.nvim_err_writeln('[Plugin] Guess-Indent doesn\'t exist')
                return
            end

            guess.setup({})
        end,
    },
}
