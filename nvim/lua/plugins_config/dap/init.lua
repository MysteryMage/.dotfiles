local dap_ui_ok, dap_ui = pcall(require, 'dapui')
if not dap_ui_ok then
    return
end

require('plugins_config.dap.adapters.codellbd')
require('plugins_config.dap.mappings')

dap_ui.setup({})


