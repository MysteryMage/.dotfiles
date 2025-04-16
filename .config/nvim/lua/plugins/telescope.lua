return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },

        config = function()
            local telescope_ok, telescope = pcall(require, 'telescope')
            if not telescope_ok then
                vim.api.nvim_echo({ { '[Plugin] Telescope doesn\'t exist' } }, true, { err = true })
                return
            end

            local telescope_previewers = require('telescope.previewers')
            local telescope_builtin = require('telescope.builtin')

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

            telescope.load_extension('fzf')

            local opts = { noremap = true, silent = true }

            vim.keymap.set('n', '<leader>fc', function()
                telescope_builtin.find_files({
                    cwd = vim.fn.stdpath('config'),
                })
            end, opts)
            vim.keymap.set(
                'n',
                '<leader>ff',
                ':Telescope find_files find_command=rg,--ignore,--hidden,--files<Cr>',
                opts
            )
            vim.keymap.set('n', '<leader>fg', ':Telescope git_files<Cr>', opts)
            vim.keymap.set('n', '<leader>fb', ':Telescope buffers<Cr>', opts)
            vim.keymap.set('n', '<leader>g', ':Telescope live_grep<Cr>', opts)
        end,
    },
}
