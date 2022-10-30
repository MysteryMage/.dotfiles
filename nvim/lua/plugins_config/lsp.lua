local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
    capabilities = capabilities,
}
lspconfig.cssls.setup {
    capabilities = capabilities,
}

-- tsserver requires tsconfig.json file, it can be empty
lspconfig.tsserver.setup {}

lspconfig.pyright.setup {}
lspconfig.vimls.setup {}
lspconfig.clangd.setup {}
lspconfig.rust_analyzer.setup {}

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
