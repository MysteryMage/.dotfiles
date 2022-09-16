local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
if not gitsigns_ok then
    vim.api.nvim_err_writeln('Failed to load gitsigns')
    return
end

gitsigns.setup({})
