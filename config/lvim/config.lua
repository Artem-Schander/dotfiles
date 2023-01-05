--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
-- lvim.colorscheme = "onedark"
-- lvim.colorscheme = "tokyonight-night"
lvim.colorscheme = "lunar"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
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

require("lsp")

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

vim.api.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
lvim.builtin.which_key.mappings["l"]["h"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Symbol Information" }

vim.api.nvim_set_keymap("n", "gp", ":lua require('peek').Peek('definition')<CR>", { noremap = true, silent = true })
lvim.builtin.which_key.mappings["l"]["p"] = { ":lua require('peek').Peek('definition')<CR>", "Peek Definition" }

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

-- indent blankline
lvim.builtin.indentlines.options.enabled = false

-- misc
lvim.builtin.sell_soul_to_devel = true

-- Additional Plugins
lvim.plugins = {
    -- {"folke/tokyonight.nvim"},
    {"sainnhe/sonokai"},
    {"matsuuu/pinkmare"},
    {"shaunsingh/solarized.nvim"},

    {"lunarvim/synthwave84.nvim"},
    {"lunarvim/horizon.nvim"},
    {"lunarvim/darkplus.nvim"},
    -- {"lunarvim/onedarker.nvim"},
    -- {"lunarvim/tokyonight.nvim"},

 --    {
	-- 	"projekt0n/github-nvim-theme",
	-- 	config = function()
	-- 		require("github-theme").setup({
	-- 			theme_style = "dimmed",
	-- 			comment_style = "NONE",
	-- 			keyword_style = "NONE",
	-- 			function_style = "NONE",
	-- 			variable_style = "NONE",
	-- 			sidebars = { "qf", "vista_kind", "terminal", "packer" },
	-- 		})
	-- 		-- vim.cmd([[ colorscheme "github-theme" ]])
	-- 	end,
	-- },

    {"LunarVim/peek.lua"},

    {
		"folke/twilight.nvim",
		event = "BufRead",
		config = function()
			require("twilight").setup({
				dimming = {
					alpha = 0.25, -- amount of dimming
					-- we try to get the foreground from the highlight groups or fallback color
					color = { "Normal", "#ffffff" },
				},
				context = 20, -- amount of lines we will try to show around the current line
				-- treesitter is used to automatically expand the visible text,
				-- but you can further control the types of nodes that should always be fully expanded
				expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
					"function",
					"method",
					"table",
					"if_statement",
				},
				exclude = {}, -- exclude these filetypes
			})
		end,
	},

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
    {
        "nvim-treesitter/playground",
    },
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
        -- disable = true
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
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- "antoinemadec/FixCursorHold.nvim",
            "olimorris/neotest-phpunit",
        }
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
        disable = true,
    },
    {
        "echasnovski/mini.indentscope",
        config = function()
            require("mini.indentscope").setup {
                draw = {
                    -- Delay (in ms) between event and start of drawing scope indicator
                    delay = 100,

                    -- Animation rule for scope's first drawing. A function which, given
                    -- next and total step numbers, returns wait time (in ms). See
                    -- |MiniIndentscope.gen_animation| for builtin options. To disable
                    -- animation, use `require('mini.indentscope').gen_animation.none()`.
                    animation = function(s, n) return 2 end,
                },

                -- -- Module mappings. Use `''` (empty string) to disable one.
                -- mappings = {
                --     -- Textobjects
                --     object_scope = 'ii',
                --     object_scope_with_border = 'ai',

                --     -- Motions (jump to respective border line; if not present - body line)
                --     goto_top = '[i',
                --     goto_bottom = ']i',
                -- },

                -- -- Options which control scope computation
                -- options = {
                --     -- Type of scope's border: which line(s) with smaller indent to
                --     -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
                --     border = 'both',

                --     -- Whether to use cursor column when computing reference indent.
                --     -- Useful to see incremental scopes with horizontal cursor movements.
                --     indent_at_cursor = true,

                --     -- Whether to first check input line to be a border of adjacent scope.
                --     -- Use it if you want to place cursor on function header to get scope of
                --     -- its body.
                --     try_as_border = false,
                -- },

                -- Which character to use for drawing scope indicator
                symbol = '▏', -- ╹ ▞ ░ ╿ ║ ┃ │ ╎ ┆ ┊   ▏

                -- vim.api.nvim_command("hi MiniIndentscopeSymbol guifg=#ff0000")
            }

            -- local statusline_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
            -- local cursorline_hl = vim.api.nvim_get_hl_by_name("CursorLine", true)
            -- local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)
            -- local colors = require("tokyonight.colors").setup({ transform = true })

            local color = vim.api.nvim_get_hl_by_name('SpecialKey', true) -- LineNr
            vim.schedule(function ()
                vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", color)
            end)

            -- vim.api.nvim_create_autocmd("FileType", {
            --     pattern = { "startify" },
            --     -- command = "let b:miniindentscope_disable=1",
            --     command = "echo 'test'"
            -- })

            vim.cmd('au FileType startify,packerNvimTree,TelescopePrompt lua vim.b.miniindentscope_disable = true')
        end,
        disable = false,
    },
    {
        "junegunn/fzf",
        dir = '~/.fzf',
        run = './install --bin'
        -- cmd = {"LushRunQuickstart", "LushRunTutorial", "Lushify"},
    },
    {
        "junegunn/fzf.vim",
        requires = { "junegunn/fzf" },
        config = function()
            vim.cmd('source ~/.config/lvim/vimscript/plugins/fzf.vim')
            lvim.builtin.which_key.mappings["b"] = { "<cmd>Buffers<CR>", "Find Buffer" }

            lvim.builtin.which_key.mappings["t"] = { ":RG<CR>", "Find Text" }
            lvim.builtin.which_key.mappings["a"] = { ":Files<CR>", "Find File (w. hidden)" }
            lvim.builtin.which_key.mappings["s"]["s"] = { ":Rg <c-r><c-w><CR>", "Find String Under Cursor" }

            if vim.fn.isdirectory('.git') ~= 0 then
                lvim.builtin.which_key.mappings["f"] = { "<cmd>GitFiles --cached --others --exclude-standard<CR>", "Find File" }
            else
                lvim.builtin.which_key.mappings["f"] = { "<cmd>FZF<CR>", "Find File" }
            end
        end,
        disable = true,
    },
    {
        "ibhagwan/fzf-lua",
        requires = {
            "junegunn/fzf",
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("plugins/fzf").setup()
            lvim.builtin.which_key.mappings["b"] = { "<cmd>FzfLua buffers<CR>", "Find Buffer" }
            lvim.builtin.which_key.mappings["r"] = { ":FzfLua lsp_document_symbols<CR>", "Find Symbol (current file)" }
            lvim.builtin.which_key.mappings["a"] = { ":lua require('fzf-lua').files({ fd_opts = '--color=never --type f --hidden --follow --no-ignore', rg_opts = '--color=never --files --hidden --follow --no-ignore' })<CR>", "Find File (w. hidden)" }
            lvim.builtin.which_key.mappings["f"] = { ":FzfLua files<CR>", "Find File" }

            lvim.builtin.which_key.mappings["s"]["b"] = nil
            lvim.builtin.which_key.mappings["s"]["c"] = { ":FzfLua colorschemes<CR>", "Colorscheme" }
            lvim.builtin.which_key.mappings["s"]["f"] = { ":FzfLua files<CR>", "Find File" }
            lvim.builtin.which_key.mappings["s"]["h"] = { ":FzfLua help_tags<CR>", "Find Help" }
            lvim.builtin.which_key.mappings["s"]["H"] = { ":FzfLua highlights<CR>", "Find Highlight Groups" }
            lvim.builtin.which_key.mappings["s"]["M"] = { ":FzfLua man_pages<CR>", "Man Pages" }
            lvim.builtin.which_key.mappings["s"]["r"] = { ":FzfLua oldfiles<CR>", "Open Recent File" }
            lvim.builtin.which_key.mappings["s"]["R"] = { ":FzfLua registers<CR>", "Registers" }
            lvim.builtin.which_key.mappings["s"]["k"] = { ":FzfLua keymaps<CR>", "Keymaps" }
            lvim.builtin.which_key.mappings["s"]["p"] = nil

            lvim.builtin.which_key.mappings["s"]["d"] = { ":FzfLua diagnostics_document<CR>", "Document Diagnostics" }
            lvim.builtin.which_key.mappings["s"]["D"] = { ":FzfLua diagnostics_workspace<CR>", "Workspace Diagnostics" }
            lvim.builtin.which_key.mappings["s"]["S"] = { ":FzfLua lsp_live_workspace_symbols<CR>", "Workspace Symbols" }
            lvim.builtin.which_key.mappings["s"]["i"] = { ":FzfLua lsp_definitions<CR>", "Definition Informations Under Cursor" }

            lvim.builtin.which_key.mappings["s"]["s"] = { ":FzfLua grep_cword<CR>", "Find String Under Cursor" }
            lvim.builtin.which_key.mappings["s"]["C"] = { ":FzfLua commands<CR>", "Commands" }

            if vim.fn.isdirectory('.git') ~= 0 then
                lvim.builtin.which_key.mappings["s"]["g"] = {
                    name = "Git",
                    ["b"] = { ":FzfLua git_branches<CR>", "Checkout Branch" },
                    ["c"] = { ":FzfLua git_commits<CR>", "Checkout Commit" },
                    ["C"] = { ":FzfLua git_bcommits<CR>", "Checkout Commit (current file)" },
                    ["s"] = { ":FzfLua git_status<CR>", "Git Status" },
                    ["S"] = { ":FzfLua git_stash<CR>", "Git Stash" },
                }

                lvim.builtin.which_key.mappings["t"] = { ":FzfLua grep_project<CR>", "Find Text" }
            else
                lvim.builtin.which_key.mappings["t"] = { ":FzfLua live_grep<CR>", "Find Text" }
            end

            lvim.builtin.which_key.mappings["g"]["o"] = { ":FzfLua git_status<CR>", "Open changed file" }
            lvim.builtin.which_key.mappings["g"]["b"] = { ":FzfLua git_branches<CR>", "Checkout Branch" }
            lvim.builtin.which_key.mappings["g"]["c"] = { ":FzfLua git_commits<CR>", "Checkout Commit" }
            lvim.builtin.which_key.mappings["g"]["C"] = { ":FzfLua git_bcommits<CR>", "Checkout Commit (current file)" }

            lvim.builtin.which_key.mappings["l"]["d"] = { ":FzfLua diagnostics_document<CR>", "Buffer Diagnostics" }
            lvim.builtin.which_key.mappings["l"]["w"] = { ":FzfLua diagnostics_workspace<CR>", "Diagnostics" }

            lvim.builtin.which_key.mappings["l"]["s"] = { ":FzfLua lsp_document_symbols<CR>", "Document Symbols" }
            lvim.builtin.which_key.mappings["l"]["S"] = { ":FzfLua lsp_live_workspace_symbols<CR>", "Workspace Symbols" }
            lvim.builtin.which_key.mappings["l"]["e"] = { ":FzfLua quickfix<CR>", "Telescope Quickfix" }
        end,
        disable = false,
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
    -- {
    --     "kdheepak/lazygit.nvim"
    -- },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("plugins/notify").setup()
        end,
        requires = { "nvim-telescope/telescope.nvim" },
    },
    {
        "Wansmer/treesj",
        requires = { 'nvim-treesitter' },
        config = function()
            -- local langs = require('treesj.langs')
            -- local u = require('treesj.langs.utils')
            -- langs["php"] = {
            --     array_creation_expression = u.set_preset_for_dict {
            --         join = {
            --             space_in_brackets = false,
            --         },
            --     },
            --     arguments = u.set_preset_for_args {
            --         join = {
            --             space_in_brackets = false,
            --         },
            --     },
            --     formal_parameters = u.set_preset_for_args(),
            --     compound_statement = u.set_preset_for_statement(),
            --     expression_statement = {
            --         target_nodes = { 'array_creation_expression' },
            --     },
            -- }
            -- langs["pug"] = {
            --     attributes = u.set_default_preset({
            --         both = {
            --             space_separator = 1,
            --             separator = ' ',
            --         },
            --     }),
            -- }
            require('treesj').setup({
                -- Use default keymaps
                -- (<space>m - toggle, <space>j - join, <space>s - split)
                use_default_keymaps = false,

                -- Node with syntax error will not be formatted
                check_syntax_error = true,

                -- If line after join will be longer than max value,
                -- node will not be formatted
                max_join_length = 120,

                -- hold|start|end:
                -- hold - cursor follows the node/place on which it was called
                -- start - cursor jumps to the first symbol of the node being formatted
                -- end - cursor jumps to the last symbol of the node being formatted
                cursor_behavior = 'hold',

                -- Notify about possible problems or not
                notify = true,

                -- langs = langs,
            })

            lvim.builtin.which_key.mappings["m"] = { ":TSJToggle<CR>", "Split/Join Block" }
        end,
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
    git_files = {
        show_untracked = true,
    }
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
-- local colors = require "lvim.core.lualine.colors"
lvim.builtin.lualine.options.disabled_filetypes = { "startify", "dashboard", "NvimTree", "Outline" }
-- lvim.builtin.lualine.options.component_separators = { left = lvim.icons.ui.DividerRight, right = lvim.icons.ui.DividerLeft }
-- lvim.builtin.lualine.options.section_separators = { left = lvim.icons.ui.BoldDividerRight, right = lvim.icons.ui.BoldDividerLeft }

lvim.builtin.lualine.style = 'default'
-- local colors = require("tokyonight.colors").setup({ transform = true })
-- -- local tokyonight = require("tokyonight.lualine.themes.tokyonight")
-- local tokyonight = require("lualine.themes.tokyonight")
-- tokyonight.inactive.a.bg = colors.blue
-- tokyonight.inactive.b.bg = colors.blue
-- tokyonight.inactive.c.bg = colors.blue

-- lvim.builtin.lualine.options.theme = tokyonight

local statusline_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
local cursorline_hl = vim.api.nvim_get_hl_by_name("CursorLine", true)
local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)
vim.schedule(function ()
    vim.api.nvim_set_hl(0, "SLCopilot", { fg = "#6CC644" })
end)

lvim.builtin.lualine.options.component_separators = { left = '', right = '' }
lvim.builtin.lualine.options.section_separators = { left = '', right = '' }

lvim.builtin.lualine.sections.lualine_a = {
    components.mode,
}

lvim.builtin.lualine.sections.lualine_b = {
    -- components.branch,
    {
        'branch',
        icon = {
            lvim.icons.git.Branch,
            -- align = 'right'
        },
        color = { gui = "bold" },
    },
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

lvim.builtin.lualine.sections.lualine_c = {
    components.diff,
    components.python_env,
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
