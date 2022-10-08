local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
    return
end

local lspkind_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_ok then
    return
end

cmp.setup {
    snippet = {
        expand = function(args)
            local luasnip_ok, luasnip = pcall(require, 'luasnip')
            if not luasnip_ok then
                return
            end
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-j>'] = cmp.mapping.confirm({ select = true }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[lsp]',
                nvim_lua = '[api]',
                path = '[path]',
                luasnip = '[snip]',
            },
        })
    }
}
