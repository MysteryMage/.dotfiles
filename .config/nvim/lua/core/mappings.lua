vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>e', ':Oil<Cr>', opts)

vim.keymap.set('n', '<leader>fc', function()
    local telescope_ok, telescope = pcall(require, 'telescope.builtin')
    if not telescope_ok then
        return
    end

    telescope.find_files({
        cwd = vim.fn.stdpath('config'),
    })
end, opts)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files find_command=rg,--ignore,--hidden,--files<Cr>', opts)
vim.keymap.set('n', '<leader>fg', ':Telescope git_files<Cr>', opts)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<Cr>', opts)
vim.keymap.set('n', '<leader>g', ':Telescope live_grep<Cr>', opts)

vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<Cr>', opts)
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.keymap.set('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.keymap.set('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

vim.keymap.set('n', '<leader>sm', function()
    local cmd = vim.fn.input('Compile command: ')
    if cmd and #cmd > 0 then
        vim.opt_local.makeprg = cmd
        vim.cmd('make')
    end
end, opts)
vim.keymap.set('n', '<leader>m', '<cmd>make<CR>', opts)

local prev_cmd = ''
vim.keymap.set('n', '<leader>c', function()
    local cmd = vim.fn.input('Compile command: ', prev_cmd)
    if cmd and #cmd > 0 then
        prev_cmd = cmd
        local term_cmd = 'sp | vertical terminal! ' .. cmd
        vim.cmd(term_cmd)
    end
end, opts)
