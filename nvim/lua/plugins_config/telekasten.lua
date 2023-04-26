local telekasten_ok, telekasten= pcall(require, 'telekasten')
if not telekasten_ok then
    return
end

local home = vim.fn.expand('~/mimir')

telekasten.setup({
    home = home,
    template_new_note = home .. '/' .. 'templates/default.md',
    template_new_daily = home .. '/' .. 'templates/daily.md',
    template_new_weekly= home .. '/' .. 'templates/weekly.md',
})
