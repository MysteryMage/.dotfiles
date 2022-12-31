local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
    return
end

local telescope_previewers = require('telescope.previewers')
local telescope_themes = require('telescope.themes')
local telescope_sorters = require('telescope.sorters')

telescope.setup({
    defaults = telescope_themes.get_dropdown {
        file_sorter = telescope_sorters.get_fzy_finder,
        poromt_prefix = '> ',
        color_devicons = true,

        file_previewer = telescope_previewers.vim_buffer_cat.new,
        grep_previewer = telescope_previewers.vim_buffer_vimgrep.new,
        qflist_previewer = telescope_previewers.vim_buffer_qflist.new,
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
})
