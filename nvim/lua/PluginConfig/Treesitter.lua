require 'nvim-treesitter.install'.compilers = { 'clang' }
require'nvim-treesitter.configs'.setup {
  ensure_installed = {'c', 'cpp', 'python', 'java', 'javascript', 'vim', 'lua', 'rust', 'go', 'html', 'css', 'norg'},

  sync_install = false,

  ignore_install = {  },

  highlight = {
    enable = true,
    disable = {  },
    additional_vim_regex_highlighting = false,
  },
}
