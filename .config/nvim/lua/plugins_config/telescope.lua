local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
    vim.api.nvim_err_writeln('[Plugin] Telescope doesn\'t exist')
    return
end

local telescope_previewers = require('telescope.previewers')

telescope.setup({
    defaults = {
        layout_strategy = 'bottom_pane',
        layout_config = {
            height = 0.4,
        },
        sorting_strategy = 'ascending',
        prompt_prefix = '   ',
        color_devicons = true,
        border = true,
        file_previewer = telescope_previewers.vim_buffer_cat.new,
        grep_previewer = telescope_previewers.vim_buffer_vimgrep.new,
        qflist_previewer = telescope_previewers.vim_buffer_qflist.new,
    },
})
