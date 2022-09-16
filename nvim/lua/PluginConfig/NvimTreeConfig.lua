local nvim_tree_ok, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_ok then
    vim.api.nvim_err_writeln('Failed to load nvim-tree')
    return
end

nvim_tree.setup({})

