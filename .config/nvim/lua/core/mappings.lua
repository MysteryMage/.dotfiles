vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>ng', ':Neogit<Cr>', opts)
vim.keymap.set('n', '<leader>e', ':Oil<Cr>', opts)

vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<Cr>', opts)
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.keymap.set('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.keymap.set('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

local prev_cmd = ''
vim.keymap.set('n', '<leader>c', function()
    local cmd = vim.fn.input('Compilation command: ', prev_cmd)
    if cmd and #cmd > 0 then
        prev_cmd = cmd
        local term_cmd = 'sp | terminal! ' .. cmd
        vim.cmd(term_cmd)
    end
end, opts)
