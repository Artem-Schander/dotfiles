require("lspconfig").intelephense.setup {
    cmd = { DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense", "--stdio" },
    on_attach = require("lsp").common_on_attach,
    autostart = true,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = Globals.lang.php.diagnostics.virtual_text,
            signs = Globals.lang.php.diagnostics.signs,
            underline = Globals.lang.php.diagnostics.underline,
            update_in_insert = true,
        }),
    },
    filetypes = Globals.lang.php.filetypes,
    settings = {
        intelephense = {
            -- format = {
            --     braces = Globals.lang.php.format.braces,
            -- },
            environment = {
                phpVersion = Globals.lang.php.environment.php_version,
            },
        },
    },
}

vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
