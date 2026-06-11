require('vim._core.ui2').enable()

vim.api.nvim_create_autocmd('LspProgress', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params.value
        local msg = ('[%s] %s %s'):format(client.name, value.kind == 'end' and '✓' or '', value.title or '')
        vim.notify(msg)
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp_completion', { clear = true }),
    callback = function(args)
        local client_id = args.data.client_id
        if not client_id then
            return
        end

        local client = vim.lsp.get_client_by_id(client_id)
        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client_id, args.buf, {
                autotrigger = true,
                convert = function(item)
                    local abbr = item.label
                    abbr = abbr:gsub("%b()", ""):gsub("%b{}", "")
                    abbr = abbr:match("[%w_.]+.*") or abbr
                    abbr = #abbr > 15 and abbr:sub(1, 14) .. "…" or abbr

                    local menu = item.detail or ""
                    menu = #menu > 15 and menu:sub(1, 14) .. "…" or menu

                    return { abbr = abbr, menu = menu }
                end,
            })
        end
    end,
})

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.winbar = ''
vim.opt.winborder = 'rounded'

vim.opt.hidden = true
vim.opt.scrolloff = 4
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.cmdheight = 1
-- vim.opt.conceallevel = 2

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.encoding = 'UTF-8'
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.ttyfast = true
vim.opt.foldmethod = 'manual'

vim.opt.completeopt = 'menu,menuone,noselect,popup,fuzzy,preview'
vim.o.autocomplete = true
