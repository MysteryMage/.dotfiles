local dressing_ok, dressing = pcall(require, 'dressing')
if not dressing_ok then
    return
end

dressing.setup({
    input = {
        winblend = 0,
    },
    select = {
        builtin = {
            winblend = 0,
        },
    }
})
