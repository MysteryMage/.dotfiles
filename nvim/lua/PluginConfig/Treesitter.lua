local treesitter_install_ok, treesitter_install =
    pcall(require, 'nvim-treesitter.install')
if not treesitter_install_ok then
        vim.api.nvim_err_writeln('Failed to load treesitter install')
        return
end

local treesitter_configs_ok, treesitter_configs =
    pcall(require, 'nvim-treesitter.configs')
if not treesitter_configs_ok then
        vim.api.nvim_err_writeln('Failed to load treesitter configs')
        return
end


treesitter_install.compilers = { 'clang' }
treesitter_configs.setup {
    ensure_installed = { 'c', 'cpp', 'python', 'java', 'javascript', 'vim', 'lua', 'rust', 'go', 'html', 'css',
        'markdown' },

    sync_install = false,

    ignore_install = {},

    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
}
