
--[[
Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
Globals.format_on_save = false
Globals.auto_complete = true
-- Globals.colorscheme = 'material'
Globals.colorscheme = 'onedark'
-- Globals.colorscheme = 'spacegray'
Globals.auto_close_tree = 1
Globals.wrap_lines = true
Globals.timeoutlen = 500
Globals.document_highlight = true
Globals.leader_key = ' '
Globals.ignore_case = true
Globals.smart_case = true
Globals.lushmode = false
Globals.transparent_window = false

-- TODO User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
Globals.plugin.hop.active = false
Globals.plugin.dial.active = false
Globals.plugin.dashboard.active = false
Globals.plugin.startify.active = true
Globals.plugin.matchup.active = false
Globals.plugin.colorizer.active = true
Globals.plugin.numb.active = true
Globals.plugin.ts_playground.active = true
Globals.plugin.indent_line.active = true
Globals.plugin.gitlinker.active = false
Globals.plugin.git_blame.active = true
Globals.plugin.zen.active = false
Globals.plugin.which_key.active = true
Globals.plugin.symbol_outline.active = true
Globals.plugin.test.active = true
Globals.plugin.whitespace.active = true
Globals.plugin.localvimrc.active = true
Globals.plugin.interestingwords.active = true
Globals.plugin.polyglot.active = true

-- dashboard
-- Globals.dashboard.custom_header = {""}
-- Globals.dashboard.footer = {""}

-- if you don't want all the parsers change this to a table of the ones you want
Globals.treesitter.ensure_installed = 'all'
Globals.treesitter.ignore_install = {'haskell'}
Globals.treesitter.highlight.enabled = true


Globals.lang.clang.diagnostics.virtual_text = false
Globals.lang.clang.diagnostics.signs = false
Globals.lang.clang.diagnostics.underline = false

-- python
-- add things like Globals.python.formatter.yapf.exec_path
-- add things like Globals.python.linter.flake8.exec_path
-- add things like Globals.python.formatter.isort.exec_path
-- Globals.lang.python.linter = 'flake8'
Globals.lang.python.isort = true
Globals.lang.python.diagnostics.virtual_text = true
Globals.lang.python.diagnostics.signs = true
Globals.lang.python.diagnostics.underline = true
Globals.lang.python.analysis.type_checking = 'off'
Globals.lang.python.analysis.auto_search_paths = true
Globals.lang.python.analysis.use_library_code_types = true

-- lua
-- TODO look into stylua
Globals.lang.lua.formatter = 'lua-format'
-- Globals.lang.lua.formatter = 'lua-format'
Globals.lang.lua.autoformat = false

-- javascript
Globals.lang.tsserver.formatter = 'prettier'
Globals.lang.tsserver.linter = nil
Globals.lang.tsserver.autoformat = true

-- json
Globals.lang.json.autoformat = true

-- php
Globals.lang.php.environment.php_version = "7.4"
Globals.lang.php.diagnostics.signs = true
Globals.lang.php.diagnostics.underline = true
Globals.lang.php.filetypes = {"php", "phtml"}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- Globals.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Plugins
-- Globals.custom_plugins = {{"windwp/nvim-ts-autotag"}}

