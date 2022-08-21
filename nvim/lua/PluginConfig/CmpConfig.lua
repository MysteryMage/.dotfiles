local cmp = require('cmp')
local lspkind = require('lspkind')

if cmp ~= nil then
    cmp.setup {
        mapping = {
            ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
            ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
end
