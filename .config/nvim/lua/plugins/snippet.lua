return {
    {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },

        config = function()
            local luasnip_ok, luasnip = pcall(require, 'luasnip')
            if not luasnip_ok then
                vim.api.nvim_echo({ { '[Plugin] Luasnip doesn\'t exist' } }, true, { err = true })
                return
            end

            require('luasnip.loaders.from_vscode').lazy_load()

            -- Mappings for luasnip
            vim.keymap.set({ 'i', 's' }, '<C-k>', function()
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                end
            end, { silent = true })

            vim.keymap.set({ 'i', 's' }, '<C-j>', function()
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                end
            end, { silent = true })
        end,
    },
}
