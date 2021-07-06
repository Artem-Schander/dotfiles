-- If you are using rvm, make sure to change below configuration
require("lspconfig").solargraph.setup {
  cmd = { DATA_PATH .. "/lspinstall/ruby/solargraph/solargraph", "stdio" },
  on_attach = require("lsp").common_on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = Globals.lang.ruby.diagnostics.virtual_text,
      signs = Globals.lang.ruby.diagnostics.signs,
      underline = Globals.lang.ruby.diagnostics.underline,
      update_in_insert = true,
    }),
  },
  filetypes = Globals.lang.ruby.filetypes,
}
