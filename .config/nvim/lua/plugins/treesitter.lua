return {
    {
        'nvim-treesitter/nvim-treesitter',
        commit = 'main',
        build = ':TSUpdate',

        config = function()
            local treesitter_ok, treesitter = pcall(require, 'nvim-treesitter')
            if not treesitter_ok then
                vim.api.nvim_echo({ { '[Plugin] Treesitter doesn\'t exist' } }, true, { err = true })
                return
            end

            local parsers = {
                'c',
                'cpp',
                'python',
                'java',
                'javascript',
                'vim',
                'lua',
                'rust',
                'go',
                'html',
                'css',
                'markdown',
            }

            treesitter.install(parsers)

            vim.api.nvim_create_autocmd('FileType', {
                pattern = { '<filetype>' },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },
}
