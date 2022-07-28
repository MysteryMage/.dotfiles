vim.g.mapleader = ' '

local opts = {noremap = true, silent = true}

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<Cr>', opts)

vim.keymap.set('n', '<leader>tf', ':Telescope find_files find_command=rg,--ignore,--hidden,--files<Cr>', opts)
vim.keymap.set('n', '<leader>tg', ':Telescope git_files<Cr>', opts)
vim.keymap.set('n', '<leader>tb', ':Telescope buffers<Cr>', opts)

vim.keymap.set('n', '<leader>ng', ':Neogit<Cr>', opts)

vim.keymap.set('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<Cr>',     opts)
vim.keymap.set('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.keymap.set('n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>',    opts)
vim.keymap.set('n', 'ge',         '<cmd>lua vim.diagnostic.setloclist()<CR>',  opts)
vim.keymap.set('n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>',          opts)
vim.keymap.set('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>',     opts)
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',         opts)
vim.keymap.set('n', '<leader>a' , '<cmd>lua vim.lsp.buf.code_action()<CR>',    opts)
