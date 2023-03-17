local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
    return
end

vim.keymap.set('n', '<leader>dc', function()
    dap.continue()
end)
vim.keymap.set('n', '<leader>dv', function()
    dap.step_over()
end)
vim.keymap.set('n', '<leader>di', function()
    dap.step_into()
end)
vim.keymap.set('n', '<leader>do', function()
    dap.step_out()
end)
vim.keymap.set('n', '<leader>b', function()
    dap.toggle_breakpoint()
end)
vim.keymap.set('n', '<leader>du', function()
    require('dapui').toggle()
end)
