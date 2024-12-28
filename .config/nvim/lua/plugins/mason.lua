return {
    {
        'williamboman/mason.nvim',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },

        config = function()
            local mason_ok, mason = pcall(require, 'mason')
            if not mason_ok then
                vim.api.nvim_err_writeln('[Plugin] Mason doesn\'t exist')
                return
            end

            local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
            if not mason_lsp_ok then
                vim.api.nvim_err_writeln('[Plugin] Mason_lsp doesn\'t exist')
                return
            end

            mason.setup({
                ui = {
                    border = 'rounded',
                },
            })
            mason_lsp.setup()
        end,
    },
}
