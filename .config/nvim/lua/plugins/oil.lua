return {
    {
        'stevearc/oil.nvim',

        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local oil_ok, oil = pcall(require, 'oil')
            if not oil_ok then
                vim.api.nvim_echo({ { '[Plugin] Oil doesn\'t exist' } }, true, { err = true })
                return
            end

            oil.setup({
                columns = {
                    'icon',
                    'size',
                    'permissions',
                    'mtime',
                },

                buf_options = {},

                win_options = {
                    wrap = false,
                    signcolumn = 'no',
                    cursorcolumn = false,
                    foldcolumn = '0',
                    spell = false,
                    list = false,
                    conceallevel = 3,
                    concealcursor = 'n',
                },

                restore_win_options = true,
                skip_confirm_for_simple_edits = false,

                keymaps = {
                    ['g?'] = 'actions.show_help',
                    ['<CR>'] = 'actions.select',
                    ['<C-s>'] = 'actions.select_vsplit',
                    ['<C-h>'] = 'actions.select_split',
                    ['<C-p>'] = 'actions.preview',
                    ['<C-c>'] = 'actions.close',
                    ['<C-l>'] = 'actions.refresh',
                    ['-'] = 'actions.parent',
                    ['_'] = 'actions.open_cwd',
                    ['`'] = 'actions.cd',
                    ['~'] = 'actions.tcd',
                    ['g.'] = 'actions.toggle_hidden',
                },

                use_default_keymaps = true,

                view_options = {
                    show_hidden = true,
                },

                float = {
                    padding = 1,
                    max_width = 0,
                    max_height = 0,
                    border = 'rounded',
                    win_options = {
                        winblend = 0,
                    },
                },
            })
        end,
    },
}
