local treesitter_install_ok, treesitter_install =
    pcall(require, 'nvim-treesitter.install')
if not treesitter_install_ok then
        return
end

local treesitter_configs  = require('nvim-treesitter.configs')

treesitter_install.compilers = { 'clang', 'gcc' }
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
