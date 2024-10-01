local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
if not gitsigns_ok then
    vim.api.nvim_err_writeln('[Plugin] Gitsigns doesn\'t exist')
    return
end

gitsigns.setup({})
