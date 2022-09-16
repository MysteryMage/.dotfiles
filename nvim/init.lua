local impatient_ok, _ = pcall(require, 'impatient')
if not impatient_ok then
    vim.api.nvim_err_writeln('Failed to load impatient')
end

for _, file in ipairs({
    'General.Sets',
    'General.Vars',
    'General.Mappings',

    'Plugins',

    'PluginConfig.CatppuccinConfig',
    'PluginConfig.Lsp',
    'PluginConfig.CmpConfig',
    'PluginConfig.Treesitter',
    'PluginConfig.CommenterConfig',
    'PluginConfig.TelescopeConfig',
    'PluginConfig.ColorizerConfig',
    'PluginConfig.NvimTreeConfig',
    'PluginConfig.GitsignsConfig',
    'PluginConfig.FelineConfig',

    'Colors',
}) do
    local status_ok, fault = pcall(require, file)
    if not status_ok then
        vim.api.nvim_err_writeln("Failed to load " .. file .. "\n" .. fault)
    end
end
