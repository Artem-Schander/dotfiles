require'lspconfig'.clangd.setup {
    cmd = {DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd"},
    on_attach = require'lsp'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = globals.clang.diagnostics.virtual_text,
            signs = globals.clang.diagnostics.signs,
            underline = globals.clang.diagnostics.underline,
            update_in_insert = true

        })
    }
}
