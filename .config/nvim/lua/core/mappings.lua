vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>ng', ':Neogit<Cr>', opts)
vim.keymap.set('n', '<leader>e', ':Oil<Cr>', opts)

vim.keymap.set('n', 'gd', function()
    vim.lsp.buf.definition()
end, opts)
vim.keymap.set('n', 'gi', function()
    vim.lsp.buf.implementation()
end, opts)
vim.keymap.set('n', 'gD', function()
    vim.lsp.buf.declaration()
end, opts)
vim.keymap.set('n', 'ge', function()
    vim.diagnostic.setloclist()
end, opts)
vim.keymap.set('n', 'gr', function()
    vim.lsp.buf.references()
end, opts)
vim.keymap.set('n', '<leader>rn', function()
    vim.lsp.buf.rename()
end, opts)
vim.keymap.set('n', '<leader>a', function()
    vim.lsp.buf.code_action()
end, opts)
vim.keymap.set('n', '<leader>s', function()
    vim.lsp.buf.document_symbol()
end, opts)
vim.keymap.set('n', '<leader>df', function()
    vim.diagnostic.open_float()
end, opts)
vim.keymap.set('n', '<leader>lf', function()
    local conform_ok, conform = pcall(require, 'conform')
    if conform_ok then
        if conform.format() then
            return
        end
    end

    vim.lsp.buf.format()
end, opts)

local prev_cmd = ''
vim.keymap.set('n', '<leader>c', function()
    local cmd = vim.fn.input('Compilation command: ', prev_cmd)
    if cmd and #cmd > 0 then
        prev_cmd = cmd
        local term_cmd = 'sp | terminal! ' .. cmd
        vim.cmd(term_cmd)
    end
end, opts)
