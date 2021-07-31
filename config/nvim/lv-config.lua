--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general

lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "onedark"
-- keymappings
lvim.leader = "space"
-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
-- lvim.keys.normal_mode = {
--     -- Page down/up
--     {'[d', '<PageUp>'},
--     {']d', '<PageDown>'},
--
--     -- Navigate buffers
--     {'<Tab>', ':bnext<CR>'},
--     {'<S-Tab>', ':bprevious<CR>'},
-- }
-- if you just want to augment the existing ones then use the utility function
require("utils").add_keymap_normal_mode({ silent = true }, {
    -- better indenting
    { "<", "<<" },
    { ">", ">>" },

    -- Mac OS - Move current line / block with Alt-j/k ala vscode.
    { "∆", ":m .+1<CR>==" },
    { "˚", ":m .-2<CR>==" },
})

require("utils").add_keymap_insert_mode({ silent = true }, {
    -- Mac OS - Move current line / block with Alt-j/k ala vscode.
    { "∆", "<Esc>:m .+1<CR>==" },
    { "˚", "<Esc>:m .-2<CR>==" },
})

require("utils").add_keymap_visual_block_mode({ silent = true }, {
    -- Mac OS - Move current line / block with Alt-j/k ala vscode.
    { "∆", ":m '>+1<CR>gv-gv" },
    { "˚", ":m '<-2<CR>gv-gv" },
})

-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

-- Scroll faster
vim.api.nvim_set_keymap('n', '<C-e>', '3<C-e>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-y>', '3<C-y>', {noremap = true, silent = true})

-- Deal with other peoples code
vim.api.nvim_set_keymap('n', '\\t', ':set ts=4 sts=4 sw=4 noet<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\s', ':set ts=4 sts=4 sw=4 et<cr>', {noremap = true, silent = true})

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = false
-- lvim.builtin.terminal.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- python

-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"},
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("plugins/hop").config()
        end
    },
    {
        "mhinz/vim-startify",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/startify.vim')
        end,
        disable = false
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("plugins/colorizer").config()
            vim.cmd "ColorizerReloadAllBuffers"
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            require("plugins/indent-blankline").config()
        end
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        setup = function()
            require("plugins/symbols-outline").config()
        end,
        disable = true
    },
    {
        -- Pretty list for showing diagnostics
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        disable = true
    },
    {
        -- Better quickfix
        "kevinhwang91/nvim-bqf",
        event = "BufRead"
    },
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
        disable = true
    },
    {
        -- Sane gx for netrw_gx bug
        "felipec/vim-sanegx",
        event = "BufRead",
        disable = true
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        disable = true
    },
    {
        "folke/lsp-colors.nvim",
        event = "BufRead",
        disable = true
    },
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
        disable = true
    },
    {
        -- Lush Create Color Schemes
        "rktjmp/lush.nvim",
        -- cmd = {"LushRunQuickstart", "LushRunTutorial", "Lushify"},
        disable = true
    },
    {
        -- Utilities to improve the TypeScript development experience for Neovim's built-in LSP client
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        ft = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
        },
        disable = true
    },
    {
        -- Pretty parentheses
        "p00f/nvim-ts-rainbow",
        disable = true
    },
    {
        -- Autotags <div>|</div>
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        disable = true
    },
    {"tpope/vim-surround"},
    {"tpope/vim-repeat"},
    {"chrisbra/csv.vim"},
    {"editorconfig/editorconfig-vim"},
    {
        "lfv89/vim-interestingwords",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/interestingwords.vim')
        end
    },
    {"tpope/vim-abolish"},
    {
        "tpope/vim-obsession",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/obsession.vim')
        end
    },
    {"dhruvasagar/vim-prosession"},
    {
        "janko-m/vim-test",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/test.vim')
        end
    },
    {
        "embear/vim-localvimrc",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/localvimrc.vim')
        end
    },
    {
        "ntpeters/vim-better-whitespace",
        event = "BufRead",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/better-whitespace.vim')
        end,
        disable = false,
    },

    -- TODO remove when treesitter supports corresponding languages
    -- use {"cakebaker/scss-syntax.vim", ft = {'sass', 'scss', 'html', 'phtml', 'vue'}}
    -- use {"digitaltoad/vim-pug", ft = {'jade', 'pug', 'vue'}}
    -- use {"jparise/vim-graphql", ft = {'gql', 'graphql', 'graphqls'}}
    -- use {"sheerun/vim-polyglot", ft = {'blade', 'graphql', 'pug', 'sass'}}
    {
        "sheerun/vim-polyglot",
        event = "BufRead",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/polyglot.vim')
        end,
        ft = {'blade', 'graphql', 'pug', 'sass'},
        disable = true,
    },
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     config = function() require"lsp_signature".on_attach() end,
    --     event = "InsertEnter"
    -- }
}

-- Custom settings
vim.g.onedark_style = "dark" --  dark, darker, cool, deep, warm, warmer
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

vim.cmd "filetype plugin on"
vim.cmd('let &titleold="' .. TERMINAL .. '"')
vim.cmd "set inccommand=split"
-- vim.cmd "set iskeyword+=-"
vim.cmd "set iskeyword+=$"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set incsearch" -- set incremental search, like modern browsers
vim.cmd "set magic" -- Set magic on, for regex

vim.cmd "set nolist" -- hide invisible chars
vim.cmd "set listchars=tab:> ,space:·,eol:¬,trail:-,extends:❯,precedes:❮" -- ⚬ ● • ¤ » ø Θ 0 O ⟶  ⟼  ⏤ ⤚
vim.cmd "set showbreak=↪" -- ↩︎  …
vim.cmd "set number relativenumber"

vim.opt.wrap = true

-- load netrw to be able to use scp
vim.g.nvim_tree_disable_netrw = 0 -- "1 by default, disables netrw
vim.g.nvim_tree_hijack_netrw = 0 --"1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)

vim.g.rooter_manual_only = 1


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
    -- { "FileType", "startify", "highlight BufferTabpageFill guibg=NONE" },
    { "BufRead,BufNewFile", "*.graphql,*.graphqls,*.gql", "setfiletype graphql" },
}

-- Additional Leader bindings and overrides for WhichKey
lvim.builtin.which_key.mappings["."] = { "<c-^>", "Previous Buffer" }
lvim.builtin.which_key.mappings[";"] = { ":ToggleRelativeLineNumbers<cr>", "Toggle Linenumbers" }
lvim.builtin.which_key.mappings[">"] = { ":set list!<cr>:IndentBlanklineToggle<cr>", "Toggle Invisible Characters" }

lvim.builtin.which_key.mappings["r"] = { ":Telescope lsp_document_symbols<CR>", "Find Symbol (current file)" }
lvim.builtin.which_key.mappings["t"] = { ":Telescope live_grep<CR>", "Find Text" }
lvim.builtin.which_key.mappings["a"] = { ":Telescope find_files find_command=rg,--smart-case,--files,--follow,--no-ignore,--hidden<cr>", "Find File (w. hidden)" }
lvim.builtin.which_key.mappings["s"]["s"] = { ":Telescope grep_string<cr>", "Find String Under Cursor" }

lvim.builtin.which_key.mappings["q"] = { ":call Stopsession()<cr>", "Quit" }
-- lvim.builtin.which_key.mappings["h"] = { ":set hlsearch! hlsearch?<cr>", "Toggle Search Highlight" }


-- lvim.builtin.which_key.mappings["h"] = { '<cmd>let @/=""<CR>', "Remove Search Highlight" }
lvim.builtin.which_key.mappings["k"] = "Interesting Word"
lvim.builtin.which_key.mappings["K"] = "Uninteresting All"

-- lvim.builtin.which_key.mappings["t"] = {
--     name = "+Trouble",
--     r = { "<cmd>Trouble lsp_references<cr>", "References" },
--     f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--     d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--     q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--     l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--     w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- Additional bindings and overrides for Telescope
require("telescope").load_extension("fzf")
local actions = require "telescope.actions"
lvim.builtin.telescope.defaults.find_command = {
    "ag",
    "--filename",
    "--noheading",
    "--nogroup",
    "--column",
    "--color",
    "--color-line-number",
    "--smart-case",
}
lvim.builtin.telescope.defaults.prompt_prefix = " " --  
lvim.builtin.telescope.defaults.selection_caret = "契"
lvim.builtin.telescope.defaults.file_sorter = require("telescope.sorters").get_fzf_sorter
lvim.builtin.telescope.defaults.mappings = {
    i = {
        ["<C-down>"] = actions.cycle_history_next,
        ["<C-up>"] = actions.cycle_history_prev,
        ["<C-c>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default + actions.center,
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        -- ["<c-t>"] = trouble.open_with_trouble,
        -- ["<c-x>"] = false,
        ["<esc>"] = actions.close,
        -- Otherwise, just set the mapping to the function that you want it to be.
        -- ["<C-i>"] = actions.select_horizontal,
        -- Add up multiple actions
        -- You can perform as many actions in a row as you like
        -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
    },
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- ["<c-t>"] = trouble.open_with_trouble,
        -- ["<C-i>"] = my_cool_custom_action,
    },
}
lvim.builtin.telescope.defaults.extensions = {
    -- fzy_native = {
    --     override_generic_sorter = false,
    --     override_file_sorter = true,
    -- },
    fzf = {
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
    }
}

-- Overrides for NvimTree
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.width = 40
lvim.builtin.nvimtree.show_icons.git = 0
-- lvim.builtin.nvimtree.quit_on_open = 1
lvim.builtin.nvimtree.indent_markers = 0
