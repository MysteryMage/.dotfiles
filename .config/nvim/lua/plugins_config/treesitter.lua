local treesitter_ok, treesitter = pcall(require, 'nvim-treesitter')
if not treesitter_ok then
    vim.api.nvim_err_writeln('[Plugin] Treesitter doesn\'t exist')
    return
end

local treesitter_configs = require('nvim-treesitter.configs')

require('nvim-treesitter.install').compilers = { 'clang', 'gcc' }
treesitter_configs.setup({
    ensure_installed = {
        'c',
        'cpp',
        'python',
        'java',
        'javascript',
        'vim',
        'lua',
        'rust',
        'go',
        'html',
        'css',
        'markdown',
    },

    sync_install = false,

    ignore_install = {},

    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
})
