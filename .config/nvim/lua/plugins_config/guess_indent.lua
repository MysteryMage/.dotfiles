local guess_ok, guess = pcall(require, 'guess-indent')
if not guess_ok then
    vim.api.nvim_err_writeln('[Plugin] Guess-Indent doesn\'t exist')
    return
end

guess.setup({})
