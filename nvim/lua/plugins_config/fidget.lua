local fidget_ok, fidget = pcall(require, 'fidget')
if not fidget_ok then
    return
end

fidget.setup({
    text = {
        spinner = 'dots',
        done = '[OK]',
    },
    window = {
        blend = 0,
        border = 'rounded',
    },
})
