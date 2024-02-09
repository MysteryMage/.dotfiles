local notify_ok, notify = pcall(require, 'notify')
if not notify_ok then
    return
end

notify.setup({
    background_colour = '#41302e',
    top_down = false,
    render = 'compact',
})
