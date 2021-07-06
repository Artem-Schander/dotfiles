local python_arguments = {}

-- TODO replace with path argument
local flake8 = {
  LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
}

local isort = { formatCommand = "isort --quiet -", formatStdin = true }

local yapf = { formatCommand = "yapf --quiet", formatStdin = true }
local black = { formatCommand = "black --quiet -", formatStdin = true }

if Globals.lang.python.linter == "flake8" then
  table.insert(python_arguments, flake8)
end

if Globals.lang.python.isort then
  table.insert(python_arguments, isort)
end

require("lspconfig").efm.setup {
  -- init_options = {initializationOptions},
  cmd = { DATA_PATH .. "/lspinstall/efm/efm-langserver" },
  init_options = { documentFormatting = true, codeAction = false },
  filetypes = { "python" },
  settings = {
    rootMarkers = { ".git/", "requirements.txt" },
    languages = {
      python = python_arguments,
    },
  },
}

-- npm i -g pyright
require("lspconfig").pyright.setup {
  cmd = {
    DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
    "--stdio",
  },
  on_attach = require("lsp").common_on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = Globals.lang.python.diagnostics.virtual_text,
      signs = Globals.lang.python.diagnostics.signs,
      underline = Globals.lang.python.diagnostics.underline,
      update_in_insert = true,
    }),
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = Globals.lang.python.analysis.type_checking,
        autoSearchPaths = Globals.lang.python.analysis.auto_search_paths,
        useLibraryCodeForTypes = Globals.lang.python.analysis.use_library_code_types,
      },
    },
  },
}

if Globals.plugin.debug.active and Globals.plugin.dap_install.active then
  local dap_install = require("dap-install")
  dap_install.config("python_dbg", {})
end
