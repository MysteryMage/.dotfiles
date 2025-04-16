return {
    {
        'nvimtools/none-ls.nvim',
        event = { 'BufReadPre', 'BufNewFile' },

        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local null_ls_ok, null_ls = pcall(require, 'null-ls')
            if not null_ls_ok then
                vim.api.nvim_echo({ { '[Plugin] Null_ls doesn\'t exist' } }, true, { err = true })
                return
            end

            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics

            null_ls.setup({
                border = 'rounded',
                sources = {
                    formatting.stylua,
                    formatting.prettierd,
                },
            })
        end,
    },
}
