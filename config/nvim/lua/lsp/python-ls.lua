-- npm i -g pyright
require'lspconfig'.pyright.setup {
    cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = globals.python.diagnostics.virtual_text,
            signs = globals.python.diagnostics.signs,
            underline = globals.python.diagnostics.underline,
            update_in_insert = true
        })
    },
	 settings = {
      python = {
        analysis = {
		  typeCheckingMode = globals.python.analysis.type_checking,
		  autoSearchPaths = globals.python.analysis.auto_search_paths,
          useLibraryCodeForTypes = globals.python.analysis.use_library_code_types
        }
      }
    }
}
