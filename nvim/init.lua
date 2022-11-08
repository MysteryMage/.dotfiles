local impatient_ok, _ = pcall(require, 'impatient')
if not impatient_ok then
    vim.api.nvim_err_writeln('Failed to load impatient')
end

require('core.sets')
require('core.vars')
require('core.mappings')

require('plugins')

require('plugins_config.mason')
require('plugins_config.lsp')
require('plugins_config.null_ls')
require('plugins_config.cmp')
require('plugins_config.snippet')
require('plugins_config.treesitter')
require('plugins_config.comment')
require('plugins_config.telescope')
require('plugins_config.colorizer')
require('plugins_config.gitsigns')
require('plugins_config.feline')

require('colors')
