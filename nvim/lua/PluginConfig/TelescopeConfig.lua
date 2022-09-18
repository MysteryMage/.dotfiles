local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
    vim.api.nvim_err_writeln('Failed to load telescope')
    return
end

local telescope_previewers_ok, telescope_previewers =
    pcall(require, 'telescope.previewers')
if not telescope_previewers_ok then
    vim.api.nvim_err_writeln('Failed to load telescope_previewers')
    return
end

local telescope_themes_ok, telescope_themes = pcall(require, 'telescope.themes')
if not telescope_themes_ok then
    vim.api.nvim_err_writeln('Failed to load telescope_themes')
    return
end

local telescope_sorters_ok, telescope_sorters = pcall(require, 'telescope.sorters')
if not telescope_sorters_ok then
    vim.api.nvim_err_writeln('Failed to load telescope_sorters')
    return
end

telescope.setup({
    defaults = telescope_themes.get_dropdown {
        file_sorter = telescope_sorters.get_fzy_finder,
        poromt_prefix = '> ',
        color_devicons = true,

        file_previewer = telescope_previewers.vim_buffer_cat.new,
        grep_previewer = telescope_previewers.vim_buffer_vimgrep.new,
        qflist_previewer = telescope_previewers.vim_buffer_qflist.new,

        mappings = {
            i = {
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
})
