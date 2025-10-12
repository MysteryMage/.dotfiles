return {
    'stevearc/conform.nvim',

    config = function()
        local conform_ok, conform = pcall(require, 'conform')
        if not conform_ok then
            vim.api.nvim_echo({ { '[Plugin] conform doesn\'t exist' } }, true, { err = true })
            return
        end

        conform.setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                rust = { 'rustfmt' },
                python = { 'isort', 'black', stop_after_first = true },
                javascript = { 'prettierd', 'prettier', stop_after_first = true },
            },
        })
    end,
}
