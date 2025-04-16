return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-context' },

        build = function()
            local treesitter_ok, treesitter_install = pcall(require, 'nvim-treesitter.install')

            if not treesitter_ok then
                return
            end
            treesitter_install.update({ with_sync = true })
        end,

        config = function()
            local treesitter_ok, treesitter = pcall(require, 'nvim-treesitter')
            if not treesitter_ok then
                vim.api.nvim_echo({ { '[Plugin] Treesitter doesn\'t exist' } }, true, { err = true })
                return
            end

            local treesitter_configs = require('nvim-treesitter.configs')

            require('nvim-treesitter.install').compilers = { 'clang', 'gcc' }
            treesitter_configs.setup({
                ensure_installed = {
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
                },

                sync_install = false,

                ignore_install = {},

                highlight = {
                    enable = true,
                    disable = {},
                    additional_vim_regex_highlighting = false,
                },
            })

            -- Setup treesitter context

            local context_ok, context = pcall(require, 'treesitter-context')
            if not context_ok then
                vim.api.nvim_echo({ { '[Plugin] Treesitter-Context doesn\'t exist' } }, true, { err = true })
                return
            end

            context.setup({
                enable = true,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = 'outer',
                mode = 'cursor',
                separator = nil,
                zindex = 20,
                on_attach = nil,
            })
        end,
    },
}
