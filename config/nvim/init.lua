require "globals"
require "keybindings"
vim.cmd("luafile " .. CONFIG_PATH .. "/config.lua")
require "settings"
require "plugins"
-- require "colorscheme"
require "utils"
require "lsp"
if Globals.lang.emmet.active then
    require "lsp.emmet-ls"
end

-- autoformat
if Globals.format_on_save then
    require("utils").define_augroups {
        autoformat = {
            {
                "BufWritePre",
                "*",
                [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
            },
        },
    }
end






-- require 'globals'
-- require 'keybindings'

-- -- vim.cmd('luafile ~/.config/nvim/config.lua')
-- vim.cmd("luafile " .. CONFIG_PATH .. "/config.lua")

-- require('settings')
-- require('plugins')

-- require('plugins/nvimtree') -- must be placed before colorscheme
-- require('colorscheme')

-- require('plugins/telescope')
-- require('plugins/compe')
-- require('plugins/treesitter')
-- require('plugins/indent-blankline')
-- require('plugins/gitsigns') -- must be placed after colorscheme
-- -- require('plugins/dashboard')
-- require('plugins/autopairs')
-- require('plugins/comment')
-- require('plugins/galaxyline')
-- -- require('plugins/which-key')
-- require('plugins/barbar')
-- -- require('plugins/rnvimr')

-- require('utils')
-- require('autocommands')

-- -- TODO is there a way to do this without vimscript
-- vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/plugins/obsession.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/plugins/startify.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/plugins/test.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/plugins/localvimrc.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/plugins/better-whitespace.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/plugins/interestingwords.vim')
-- vim.cmd('source ~/.config/nvim/vimscript/plugins/polyglot.vim')

-- -- LSP
-- require('lsp')
-- require('lsp.angular-ls')
-- require('lsp.bash-ls')
-- require('lsp.clangd')
-- require('lsp.css-ls')
-- require('lsp.dart-ls')
-- require('lsp.docker-ls')
-- require('lsp.efm-general-ls')
-- require('lsp.elm-ls')
-- require('lsp.emmet-ls')
-- require('lsp.graphql-ls')
-- require('lsp.go-ls')
-- require('lsp.html-ls')
-- require('lsp.json-ls')
-- require('lsp.js-ts-ls')
-- require('lsp.kotlin-ls')
-- require('lsp.latex-ls')
-- require('lsp.lua-ls')
-- require('lsp.php-ls')
-- require('lsp.python-ls')
-- require('lsp.ruby-ls')
-- require('lsp.rust-ls')
-- require('lsp.svelte-ls')
-- require('lsp.terraform-ls')
-- -- require('lsp.tailwindcss-ls')
-- require('lsp.vim-ls')
-- require('lsp.vue-ls')
-- require('lsp.yaml-ls')
-- -- require('lsp.elixir-ls')
