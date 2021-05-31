require'lspconfig'.intelephense.setup {
    cmd = { DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense", "--stdio" },
    on_attach = require'lsp'.common_on_attach,
    -- NOTE: not working
    -- settings = {
    --     diagnostics = {
    --         undefinedTypes = false,
    --         undefinedFunctions = false,
    --         undefinedConstants = true,
    --         undefinedClassConstants = true,
    --         undefinedMethods = false,
    --         undefinedProperties = false,
    --         undefinedVariables = false
    --     }
    -- }
}

-- require'lspconfig'.phpactor.setup{}
