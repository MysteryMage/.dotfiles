return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },

        config = function()
            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = "󰠠 ",
                    },
                    linehl = {
                        [vim.diagnostic.severity.ERROR] = "Error",
                        [vim.diagnostic.severity.WARN] = "Warn",
                        [vim.diagnostic.severity.INFO] = "Info",
                        [vim.diagnostic.severity.HINT] = "Hint",
                    },
                },
                float = {
                    border = 'rounded',
                    source = true,
                    header = '',
                    prefix = '',
                },
            })
        end,
    },
}
