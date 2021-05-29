--[[
Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
globals.auto_complete = true
globals.colorscheme = 'onedark'
globals.auto_close_tree = 1
globals.wrap_lines = true
globals.timeoutlen = 500

-- dashboard 
-- globals.dashboard.custom_header = {""}
-- globals.dashboard.footer = {""}

-- if you don't want all the parsers change this to a table of the ones you want
globals.treesitter.ensure_installed = "all"
globals.treesitter.ignore_install = {"haskell"}
globals.treesitter.highlight.enabled = true


globals.clang.diagnostics.virtual_text = false
globals.clang.diagnostics.signs = false
globals.clang.diagnostics.underline = false

-- python
-- add things like globals.python.formatter.yapf.exec_path
-- add things like globals.python.linter.flake8.exec_path
-- add things like globals.python.formatter.isort.exec_path
globals.python.formatter = 'yapf'
-- globals.python.linter = 'flake8'
globals.python.isort = true
globals.python.autoformat = true
globals.python.diagnostics.virtual_text = true
globals.python.diagnostics.signs = true
globals.python.diagnostics.underline = true
globals.python.analysis.type_checking = "off"
globals.python.analysis.auto_search_paths = true
globals.python.analysis.use_library_code_types = true

-- lua
-- TODO look into stylua
globals.lua.formatter = 'lua-format'
-- globals.lua.formatter = 'lua-format'
globals.lua.autoformat = false

-- javascript
globals.tsserver.formatter = 'prettier'
globals.tsserver.linter = nil
globals.tsserver.autoformat = true

-- json
globals.json.autoformat = true

-- ruby
-- globals.ruby.autoformat = true
-- create custom autocommand field (This would be easy with lua)
