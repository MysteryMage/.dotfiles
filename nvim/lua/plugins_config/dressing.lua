local dressing_ok, dressing = pcall(require, 'dressing')
if not dressing_ok then
    return
end

dressing.setup({
    input = {
        win_options = {
            winblend = 0,
        },
    },
    select = {
        builtin = {
            win_options = {
                winblend = 0,
            },
        },
    }
})
