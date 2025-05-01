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

            local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
            if not lspconfig_ok then
                vim.api.nvim_echo({ { '[Plugin] Lspconfig doesn\'t exist' } }, true, { err = false })
                return
            end

            mason.setup({
                ui = {
                    border = 'rounded',
                },
            })
            mason_lsp.setup()

            mason_lsp.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end,

                ['lua_ls'] = function()
                    lspconfig.lua_ls.setup({
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
                    })
                end,

                ['ts_ls'] = function()
                    lspconfig.ts_ls.setup({
                        on_attach = function(client)
                            client.server_capabilities.documentFormattingProvider = false
                            client.server_capabilities.documentRangeFormattingProvider = false
                        end,
                    })
                end,
            })
        end,
    },
}
