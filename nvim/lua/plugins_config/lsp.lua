local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup({
    capabilities = capabilities,
})
lspconfig.cssls.setup({
    capabilities = capabilities,
})

lspconfig.tsserver.setup({
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})
lspconfig.volar.setup({})

lspconfig.pyright.setup({})
lspconfig.vimls.setup({})
lspconfig.clangd.setup({})
lspconfig.rust_analyzer.setup({})

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

local signs = {
    { 'DiagnosticSignError', '' },
    { 'DiagnosticSignWarn', '' },
    { 'DiagnosticSignHint', '󰘥' },
    { 'DiagnosticSignInfo', '' },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign[1], {
        texthl = sign[1],
        text = sign[2],
        numhl = '',
    })
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
