vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<Cr>', opts)

vim.keymap.set('n', '<leader>tc', function()
    require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath('config')
    }
end, opts)
vim.keymap.set('n', '<leader>tf', ':Telescope find_files find_command=rg,--ignore,--hidden,--files<Cr>', opts)
vim.keymap.set('n', '<leader>tg', ':Telescope git_files<Cr>', opts)
vim.keymap.set('n', '<leader>tb', ':Telescope buffers<Cr>', opts)

vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<Cr>', opts)
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.keymap.set('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

vim.keymap.set('n', '<leader>cm', function()
    local cmd = vim.fn.input('Compile command: ')
    if cmd and #cmd > 0 then
        vim.opt_local.makeprg = cmd
        vim.cmd('make')
    end
end, opts)
vim.keymap.set('n', '<leader>m', '<cmd>make<CR>', opts)
vim.keymap.set('n', '<leader>ct', function()
    local cmd = vim.fn.input('Compile command: ')
    if cmd and #cmd > 0 then
        local term_cmd = 'vs | vertical terminal! '..cmd
        vim.cmd(term_cmd)
    end
end, opts)
