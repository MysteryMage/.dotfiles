return {
    {
        'williamboman/mason.nvim',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },

        config = function()
            local mason_ok, mason = pcall(require, 'mason')
            if not mason_ok then
                vim.api.nvim_echo({ { '[Plugin] Mason doesn\'t exist' } }, true, { err = true })
                return
            end

            local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
            if not mason_lsp_ok then
                vim.api.nvim_echo({ { '[Plugin] Mason_lsp doesn\'t exist' } }, true, { err = true })
                return
            end

            vim.lsp.config.lua_ls = {
                cmd = { 'lua-language-server' },
                filetypes = { 'lua' },
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            enable = true,
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                                ['/usr/share/awesome/lib'] = true,
                            },
                            maxPreload = 2000,
                            preloadFileSize = 1000,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }

            mason.setup()
            mason_lsp.setup()
        end,
    },
}
