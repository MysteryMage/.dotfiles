local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 150,
        })
    end,
})

vim.g.gruvbox_baby_highlights = { QuickFixLine = { bg = '#504945' } }
vim.g.gruvbox_baby_transparent_mode = true
vim.g.gruvbox_baby_background_color = 'dark'

vim.g.tavern_transparent = true

vim.cmd.colorscheme('gruvbox-baby')
