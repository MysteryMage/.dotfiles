local impatient_ok, _ = pcall(require, 'impatient')
if not impatient_ok then
    vim.api.nvim_err_writeln('Failed to load impatient')
end

require('General.Sets')
require('General.Vars')
require('General.Mappings')

require('Plugins')

require('PluginConfig.CatppuccinConfig')
require('PluginConfig.Mason')
require('PluginConfig.Lsp')
require('PluginConfig.NullLs')
require('PluginConfig.CmpConfig')
require('PluginConfig.Snippet')
require('PluginConfig.Treesitter')
require('PluginConfig.CommenterConfig')
require('PluginConfig.TelescopeConfig')
require('PluginConfig.ColorizerConfig')
require('PluginConfig.GitsignsConfig')
require('PluginConfig.FelineConfig')

require('Colors')
