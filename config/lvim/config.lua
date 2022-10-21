--[[
filled in as strings with either
Linters should be

a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
-- lvim.colorscheme = "onedark"
lvim.colorscheme = "tokyonight-moon"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<CR>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.dashboard.active = false

lvim.builtin.alpha.active = false
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = false
vim.opt.showtabline = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "php",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local util = require 'lspconfig/util'
-- local bin_name = "phpactor"
--
-- local opts = {
--     cmd = {bin_name, "language-server"},
--     filetypes = {"php"},
--     root_dir = function (pattern)
--         local cwd  = vim.loop.cwd();
--         local root = util.root_pattern("composer.json", ".git")(pattern);
--
--         -- prefer cwd if root is a descendant
--         return util.path.is_descendant(cwd, root) and cwd or root;
--     end,
--     autostart = false,
--     -- on_attach = function ()
--     --     print 'FOOOOOOOOOOO'
--     -- end
-- } -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup(bin_name, opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
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
        -- ["<esc>"] = actions.close,
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

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<CR>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<CR>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<CR>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<CR>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<CR>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<CR>", "Diagnostics" },
-- }

-- Additional Leader bindings and overrides for WhichKey
lvim.builtin.which_key.mappings["."] = { "<c-^>", "Previous Buffer" }
lvim.builtin.which_key.mappings[";"] = { ":ToggleRelativeLineNumbers<CR>", "Toggle Linenumbers" }
-- lvim.builtin.which_key.mappings[">"] = { ":set list!<CR>:IndentBlanklineToggle!<CR>", "Toggle Invisible Characters" }
lvim.builtin.which_key.mappings[">"] = { ":IndentBlanklineToggle!<CR>", "Toggle Indent Lines" }

lvim.builtin.which_key.mappings["r"] = { ":Telescope lsp_document_symbols<CR>", "Find Symbol (current file)" }
lvim.builtin.which_key.mappings["t"] = { ":Telescope live_grep<CR>", "Find Text" }
lvim.builtin.which_key.mappings["a"] = { ":Telescope find_files find_command=rg,--smart-case,--files,--follow,--no-ignore,--hidden<CR>", "Find File (w. hidden)" }
lvim.builtin.which_key.mappings["s"]["s"] = { ":Telescope grep_string<CR>", "Find String Under Cursor" }

vim.api.nvim_set_keymap("n", "gp", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
lvim.builtin.which_key.mappings["l"]["p"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Peek Definition" }

lvim.builtin.which_key.mappings["q"] = { ":call Stopsession()<CR>", "Quit" }
-- lvim.builtin.which_key.mappings["h"] = { ":set hlsearch! hlsearch?<CR>", "Toggle Search Highlight" }

if lvim.builtin.bufferline.active == false then
    -- remove bufferline stuff
    lvim.builtin.which_key.mappings["b"] = { "<cmd>Telescope buffers<CR>", "Find Buffer" }
    lvim.builtin.which_key.mappings["c"] = { "<cmd>BufferKill<CR>", "Close Current Buffer" }
    lvim.builtin.which_key.mappings["C"] = { "<cmd>BWipeout other<CR>", "Close Other Buffers" }
else
    lvim.builtin.which_key.mappings["b"]["w"] = { "<cmd>BWipeout other<CR>", "Wipeout" }
end

-- lvim.builtin.which_key.mappings["h"] = { '<cmd>let @/=""<CR>', "Remove Search Highlight" }
lvim.builtin.which_key.mappings["k"] = "Interesting Word"
lvim.builtin.which_key.mappings["K"] = "Uninteresting All"

-- better indenting
lvim.keys.normal_mode["<"] = "<<"
lvim.keys.normal_mode[">"] = ">>"

-- Mac OS - Move current line / block with Alt-j/k ala vscode.
lvim.keys.normal_mode["∆"] = ":m .+1<CR>=="
lvim.keys.normal_mode["˚"] = ":m .-2<CR>=="
lvim.keys.insert_mode["∆"] = "<Esc>:m .+1<CR>=="
lvim.keys.insert_mode["˚"] = "<Esc>:m .-2<CR>=="
lvim.keys.visual_block_mode["∆"] = ">+1<CR>gv-gv"
lvim.keys.visual_block_mode["˚"] = "<-2<CR>gv-gv"

-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "cmp#complete()", { noremap = true, silent = true, expr = true })

-- Scroll faster
vim.api.nvim_set_keymap('n', '<C-e>', '3<C-e>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-y>', '3<C-y>', { noremap = true, silent = true })

-- Deal with other peoples code
vim.api.nvim_set_keymap('n', '\\t', ':set ts=4 sts=4 sw=4 noet<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\s', ':set ts=4 sts=4 sw=4 et<CR>', { noremap = true, silent = true })

-- if lvim.builtin.bufferline.active == false then
--     -- unset Bufferline mappings
--     vim.api.nvim_del_keymap('n', '<S-l>')
--     vim.api.nvim_del_keymap('n', '<S-h>')
-- end

lvim.builtin.sell_soul_to_devel = true

-- Additional Plugins
lvim.plugins = {
    -- {"folke/tokyonight.nvim"},
    {"sainnhe/sonokai"},
    {"matsuuu/pinkmare"},
    {"shaunsingh/solarized.nvim"},
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
            vim.cmd('source ~/.config/lvim/vimscript/plugins/startify.vim')
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
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     -- event = "BufWinEnter",
    --     setup = function()
    --         if lvim and lvim.colorscheme == "onedarker" then
    --             local C = require "onedarker.palette"
    --             local fg = C.gray
    --             vim.api.nvim_create_autocmd("ColorScheme", {
    --                   pattern = { "*" },
    --                   command = "highlight IndentBlanklineSpaceChar guifg=" .. fg .. " gui=nocombine",
    --             })
    --         end
    --         require("plugins/indent-blankline").config()
    --     end
    -- },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        setup = function()
            require("plugins/symbols-outline").config()
        end,
        disable = true
    },
    -- {
    --     "nvim-treesitter/playground",
    -- },
    -- {
    --     -- Sticky Context Header
    --     "nvim-treesitter/nvim-treesitter-context",
    --     setup = function()
    --         require("plugins/nvim-treesitter-context").config()
    --     end,
    -- },
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
        -- event = "BufRead",
        config = function()
            require("todo-comments").setup {
                highlight = {
                    before = "", -- "fg" or "bg" or empty
                    keyword = "fg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
                    after = "", -- "fg" or "bg" or empty
                    pattern = [[.*<(KEYWORDS)\s*:?]], -- pattern or table of patterns, used for highlightng (vim regex)
                },
                search = {
                    command = "rg",
                    args = {
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                    },
                    -- regex that will be used to match keywords.
                    -- don't replace the (KEYWORDS) placeholder
                    -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                    pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
                },
            }
        end,
        disable = false
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
    {"kazhala/close-buffers.nvim"},
    {
        "lfv89/vim-interestingwords",
        config = function()
            vim.cmd('source ~/.config/lvim/vimscript/plugins/interestingwords.vim')
        end
    },
    {"tpope/vim-abolish"},
    {
        "tpope/vim-obsession",
        config = function()
            vim.cmd('source ~/.config/lvim/vimscript/plugins/obsession.vim')
        end
    },
    {"dhruvasagar/vim-prosession"},
    {
        "vim-test/vim-test",
        config = function()
            vim.cmd('source ~/.config/lvim/vimscript/plugins/test.vim')
        end
    },
    {
        "embear/vim-localvimrc",
        config = function()
            vim.cmd('source ~/.config/lvim/vimscript/plugins/localvimrc.vim')
        end
    },
    {
        "ntpeters/vim-better-whitespace",
        event = "BufRead",
        config = function()
            vim.cmd('source ~/.config/lvim/vimscript/plugins/better-whitespace.vim')
        end,
        disable = false,
    },
    {
        "junegunn/fzf",
        dir = '~/.fzf',
        run = './install --bin'
        -- cmd = {"LushRunQuickstart", "LushRunTutorial", "Lushify"},
    },

    -- { "mfussenegger/nvim-dap" },

    -- {
    --     "github/copilot.vim",
    --     config = function ()
    --         vim.g.copilot_no_tab_map = true
    --     end
    -- },
    {
        "zbirenbaum/copilot.lua",
        event = {"VimEnter"},
        config = function ()
            vim.schedule(function ()
                require("copilot").setup({
                    -- cmp = {
                    --     enabled = true,
                    --     method = "getCompletionsCycling",
                    -- },
                    -- panel = { -- no config options yet
                    --     enabled = true,
                    -- },
                    -- ft_disable = { "markdown" },
                    plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
                })
            end)
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        -- module = "copilot_cmp",
        after = { "copilot.lua", "nvim-cmp" },
        config = function ()
            require("copilot_cmp").setup({
                -- method = "getPanelCompletions",
                method = "getCompletionsCycling",
            })
        end
    },

    -- TODO remove when treesitter supports corresponding languages
    -- {"cakebaker/scss-syntax.vim", ft = {'sass', 'scss', 'html', 'phtml', 'vue'}}
    -- {"jparise/vim-graphql", ft = {'gql', 'graphql', 'graphqls'}}
    -- {"sheerun/vim-polyglot", ft = {'blade', 'graphql', 'pug', 'sass'}}
    -- {
    --     "digitaltoad/vim-pug",
    --     event = "BufRead",
    --     ft = {'jade', 'pug', 'vue'}
    -- },
    -- {
    --     "sheerun/vim-polyglot",
    --     event = "BufRead",
    --     config = function()
    --         vim.cmd('source ~/.config/lvim/vimscript/plugins/polyglot.vim')
    --     end,
    --     ft = {'blade', 'graphql', 'pug', 'sass'},
    --     disable = true,
    -- },
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     config = function() require"lsp_signature".on_attach() end,
    --     event = "InsertEnter"
    -- }
}

-- Custom settings
vim.g.onedark_style = "dark" --  dark, darker, cool, deep, warm, warmer
vim.cmd('source ~/.config/lvim/vimscript/functions.vim')

vim.cmd "filetype plugin on"
-- vim.cmd('let &titleold="' .. TERMINAL .. '"')
vim.cmd "set inccommand=split"
-- vim.cmd "set iskeyword+=-"
vim.cmd "set iskeyword+=$"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set incsearch" -- set incremental search, like modern browsers
vim.cmd "set magic" -- Set magic on, for regex

vim.cmd "set nolist" -- hide invisible chars
-- vim.cmd "set listchars=tab:> ,space:·,eol:¬,trail:-,extends:❯,precedes:❮" -- ⚬ ● • ¤ » ø Θ 0 O ⟶  ⟼  ⏤ ⤚
vim.cmd "set listchars=tab:-->,space:⋅,eol:↴,trail:-,extends:❯,precedes:❮" -- ⚬ ● • ¤ » ø Θ 0 O ⟶  ⟼  ⏤ ⤚
vim.cmd "set showbreak=↪" -- ↩︎  …
vim.cmd "set number relativenumber"

vim.opt.wrap = false
vim.opt.cmdheight = 1

vim.g.rooter_manual_only = 1


-- Additional bindings and overrides for Telescope
-- lvim.builtin.telescope.defaults.vimgrep_arguments = {
--     "ag",
--     "--filename",
--     "--noheading",
--     "--nogroup",
--     "--column",
--     "--color",
--     "--color-line-number",
--     "--smart-case",
-- }
lvim.builtin.telescope.defaults.prompt_prefix = " " --  
lvim.builtin.telescope.defaults.selection_caret = " "
-- lvim.builtin.telescope.defaults.file_sorter = require("telescope.sorters").get_fzf_sorter
lvim.builtin.telescope.defaults.layout_strategy = "flex"
lvim.builtin.telescope.defaults.layout_config = {
    width = 0.85,
    -- preview_cutoff = 120,
    horizontal = {
        mirror = false,
        height = 0.75,
    },
    vertical = {
        -- mirror = true
    },
    flex = {
        flip_columns = 180,
    },
}

-- lvim.builtin.telescope.extensions = {
--     -- fzy_native = {
--     --     override_generic_sorter = false,
--     --     override_file_sorter = true,
--     -- },
--     fzf = {
--         override_generic_sorter = true, -- override the generic sorter
--         override_file_sorter = true,     -- override the file sorter
--         case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--         -- the default case_mode is "smart_case"
--     }
-- }
lvim.builtin.telescope.pickers = {
    buffers = {
        ignore_current_buffer = true,
        -- sort_lastused = true,
        sort_mru = true,
    },
    -- git_files = {
    --     show_untracked = true,
    -- }
}

-- Overrides for NvimTree
-- lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.width = 60
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

-- load netrw to be able to use scp
lvim.builtin.nvimtree.setup.disable_netrw = false -- "1 by default, disables netrw
lvim.builtin.nvimtree.setup.hijack_netrw = false --"1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.netrw_banner = 0

-- Overrides for GitSigns
lvim.builtin.gitsigns.current_line_blame = true

-- Overrides for lualine
local components = require "lvim.core.lualine.components"
local conditions = require "lvim.core.lualine.conditions"
local colors = require "lvim.core.lualine.colors"
lvim.builtin.lualine.options.disabled_filetypes = { "startify", "dashboard", "NvimTree", "Outline" }
-- lvim.builtin.lualine.options.component_separators = { left = lvim.icons.ui.DividerRight, right = lvim.icons.ui.DividerLeft }
-- lvim.builtin.lualine.options.section_separators = { left = lvim.icons.ui.BoldDividerRight, right = lvim.icons.ui.BoldDividerLeft }

local statusline_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
local cursorline_hl = vim.api.nvim_get_hl_by_name("CursorLine", true)
local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)
vim.schedule(function ()
    vim.api.nvim_set_hl(0, "SLCopilot", { fg = "#6CC644" })
end)

lvim.builtin.lualine.options.component_separators = { left = '', right = '' }
lvim.builtin.lualine.options.section_separators = { left = '', right = '' }

lvim.builtin.lualine.sections.lualine_b = {
    -- components.branch,
    'branch',
    {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        separator = nil,
        color = { bg = statusline_hl.background },
        cond = conditions.hide_in_width,
    },
    -- {
    --     function()
    --         -- local file = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
    --         -- -- local file = vim.fn.fnamemodify(vim.fn.expand "%:t", ":~:.")
    --         -- if vim.fn.empty(file) == 1 then return "" end
    --         -- -- if vim.bo.filetype == "startify" then return "" end

    --         -- local modified_icon = ""
    --         -- local readonly_icon = ""

    --         -- local readonly = vim.bo.readonly
    --         -- if vim.bo.filetype == "help" then
    --         --     readonly = false
    --         -- end

    --         -- if readonly then
    --         --     file = readonly_icon .. " " .. file
    --         -- end

    --         -- -- local is_modified = vim.api.nvim_buf_get_option(vim.fn.bufnr, "modified")
    --         -- if vim.bo.modifiable and vim.bo.modified then
    --         --     file = file .. " " .. modified_icon
    --         --     vim.api.nvim_command("hi GalaxyFileName guifg=" .. colors.yellow)
    --         -- else
    --         --     vim.api.nvim_command("hi GalaxyFileName guifg=" .. colors.white)
    --         -- end

    --         -- return file .. " "
    --         return 'test'
    --     end,
    --     color = { fg = colors.green },
    --     cond = conditions.hide_in_width,
    -- },
}

local lsp = components.lsp
lsp.separator = ''
lsp.padding = { left = 1, right = 2 }

local spaces = components.spaces
spaces.separator = ''

lvim.builtin.lualine.sections.lualine_x = {
    -- components.diagnostics,
    'diagnostics',
    lsp,
    spaces,
    -- components.filetype,
    'filetype',
}

-- lvim.builtin.lualine.sections.lualine_x[2].separator = nil
-- lvim.builtin.lualine.sections.lualine_x[2].separator = ''

-- for i = 1, #lvim.builtin.lualine.sections.lualine_x do
--     if lvim.builtin.lualine.sections.lualine_x[i].separator then
--          lvim.builtin.lualine.sections.lualine_x[i].separator = nil
--     end
-- end

function _G.put_text(...)
    local objects = {}
    for i = 1, select('#', ...) do
        local v = select(i, ...)
        table.insert(objects, vim.inspect(v))
    end

    local lines = vim.split(table.concat(objects, '\n'), '\n')
    local lnum = vim.api.nvim_win_get_cursor(0)[1]
    vim.fn.append(lnum, lines)
    return ...
end


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--     -- { "FileType", "startify", "highlight BufferTabpageFill guibg=NONE" },
--     { "FileType", "startify", "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=" .. vim.opt.showtabline._value },
--     { "BufRead,BufNewFile", "*.graphql,*.graphqls,*.gql", "setfiletype graphql" },
-- }

-- vim.api.nvim_create_autocmd("FileType", {
--    pattern = { "startify" },
--    command = "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=",
-- })

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile", "BufEnter"}, {
      pattern = { "*.graphql", "*.graphqls", "*.gql" },
      command = "setfiletype graphql",
})
