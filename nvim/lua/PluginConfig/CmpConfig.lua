local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
    vim.api.nvim_err_writeln('Failed to load cmp')
    return
end

local lspkind_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_ok then
    vim.api.nvim_err_writeln('Failed to load lspkind')
    return
end

cmp.setup {
    snippet = {
        expand = function(args)
            local luasnip_ok, luasnip = pcall(require, 'luasnip')
            if not luasnip_ok then
                vim.api.nvim_err_writeln('Failed to load luasnip')
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
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[LSP]',
                nvim_lua = '[api]',
                path = '[path]',
            },
        })
    }
}
