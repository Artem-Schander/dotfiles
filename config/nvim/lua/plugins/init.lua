local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    return
end

packer.init {
    -- compile_path = vim.fn.stdpath('data')..'/site/pack/loader/start/packer.nvim/plugin/packer_compiled.vim',
    compile_path = require("packer.util").join_paths(vim.fn.stdpath "config", "plugin", "packer_compiled.vim"),
    git = { clone_timeout = 300 },
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    use { "neovim/nvim-lspconfig" }
    use { "kabouzeid/nvim-lspinstall" }
    -- Telescope
    use { "nvim-lua/popup.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "tjdevries/astronauta.nvim" }
    use {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins/telescope").config()
        end,
        cmd = "Telescope",
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    }
    use {
        "junegunn/fzf",
        run = ":call fzf#install()"
    }

    -- Autocomplete
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("plugins/compe").config()
        end,
    }

    use {
        "hrsh7th/vim-vsnip",
        event = "InsertEnter",
        config = function()
            require("plugins/vsnip").config()
        end,
    }
    use {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter"
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins/treesitter").config()
        end,
    }

    -- Neoformat
    use {
        "sbdchd/neoformat",
        run = "npm install --g prettier",
        event = "BufEnter"
    }

    use {
        "kyazdani42/nvim-tree.lua",
        -- cmd = "NvimTreeToggle",
        config = function()
            require("plugins/nvimtree").config()
        end,
    }

    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins/gitsigns").config()
        end,
        event = "BufRead",
    }

    -- whichkey
    use {
        "folke/which-key.nvim",
        config = function()
            require("plugins/which-key").config()
        end,
        disable = not Globals.plugin.which_key.active,
    }

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        after = { "telescope.nvim", "nvim-compe" },
        config = function()
            require("plugins/autopairs").config()
        end,
    }

    -- Comments
    use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
            require("nvim_comment").setup()
        end,
    }

    -- -- Color
    -- use { "christianchiarulli/nvcode-color-schemes.vim", opt = true }
    use { "marko-cerovac/material.nvim" }

    -- Icons
    use { "kyazdani42/nvim-web-devicons" }

    -- Status Line and Bufferline
    use {
        "glepnir/galaxyline.nvim",
        config = function()
            require("plugins/galaxyline").config()
        end,
    }

    use {
        "romgrk/barbar.nvim",
        config = function()
            require("plugins/barbar").config()
        end,
        event = "BufWinEnter",
    }

    -- use {
    --     "akinsho/nvim-bufferline.lua",
    --     config = function() require("bufferline").config() end,
    --     event = "BufRead"
    -- }

    -- Extras, these do not load by default

    -- Better motions
    use {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("plugins/hop").config()
        end,
        disable = not Globals.plugin.hop.active,
        opt = true,
    }

    -- Enhanced increment/decrement
    use {
        "monaqa/dial.nvim",
        event = "BufRead",
        config = function()
            require("plugins/dial").config()
        end,
        disable = not Globals.plugin.dial.active,
        opt = true,
    }
    -- Dashboard
    use {
        "ChristianChiarulli/dashboard-nvim",
        event = "BufWinEnter",
        cmd = { "Dashboard", "DashboardNewFile", "DashboardJumpMarks" },
        config = function()
            require("plugins/dashboard").config()
        end,
        disable = not Globals.plugin.dashboard.active,
        opt = true,
    }
    use {
        "mhinz/vim-startify",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/startify.vim')
        end,
        disable = not Globals.plugin.startify.active,
    }

    -- Zen Mode
    use {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        event = "BufRead",
        config = function()
            require("plugins/zen").config()
        end,
        disable = not Globals.plugin.zen.active,
    }

    -- Ranger
    use {
        "kevinhwang91/rnvimr",
        cmd = "Rnvimr",
        config = function()
            require("plugins/rnvimr").config()
        end,
        disable = not Globals.plugin.ranger.active,
    }

    -- matchup
    use {
        "andymass/vim-matchup",
        event = "CursorMoved",
        config = function()
            require("plugins/matchup").config()
        end,
        disable = not Globals.plugin.matchup.active,
    }

    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("plugins/colorizer").config()
            vim.cmd "ColorizerReloadAllBuffers"
        end,
        disable = not Globals.plugin.colorizer.active,
    }

    use {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
        disable = not Globals.plugin.numb.active,
    }

    -- Treesitter playground
    use {
        "nvim-treesitter/playground",
        event = "BufRead",
        disable = not Globals.plugin.ts_playground.active,
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            require("plugins/indent-blankline").config()
        end,
        disable = not Globals.plugin.indent_line.active,
    }

    -- comments in context
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "BufRead",
        disable = not Globals.plugin.ts_context_commentstring.active,
    }

    -- Symbol Outline
    use {
        "simrat39/symbols-outline.nvim",
        -- cmd = "SymbolsOutline",
        setup = function()
            require("plugins/symbols-outline").config()
        end,
        disable = not Globals.plugin.symbol_outline.active,
    }

    -- diagnostics
    use {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        disable = not Globals.plugin.trouble.active,
    }

    -- Debugging
    use {
        "mfussenegger/nvim-dap",
        config = function()
            require "dap"
            vim.fn.sign_define("DapBreakpoint", {
                text = "",
                texthl = "LspDiagnosticsSignError",
                linehl = "",
                numhl = "",
            })
            require("dap").defaults.fallback.terminal_win_cmd = "50vsplit new"
        end,
        disable = not Globals.plugin.debug.active,
    }

    -- Better quickfix
    use {
        "kevinhwang91/nvim-bqf",
        event = "BufRead",
        disable = not Globals.plugin.bqf.active,
    }

    -- Floating terminal
    use {
        "numToStr/FTerm.nvim",
        event = "BufRead",
        config = function()
            require("FTerm").setup {
                dimensions = { height = 0.8, width = 0.8, x = 0.5, y = 0.5 },
                border = "single", -- or 'double'
            }
        end,
        disable = not Globals.plugin.floatterm.active,
    }
    -- Search & Replace
    use {
        "windwp/nvim-spectre",
        event = "BufRead",
        config = function()
            require("plugins/spectre").config()
        end,
        disable = not Globals.plugin.spectre.active,
    }

    -- lsp root with this nvim-tree will follow you
    use {
        "ahmedkhalf/lsp-rooter.nvim",
        event = "BufRead",
        config = function()
            require("lsp-rooter").setup()
        end,
        disable = not Globals.plugin.lsp_rooter.active,
    }

    -- Markdown preview
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
        disable = not Globals.plugin.markdown_preview.active,
    }

    -- Interactive scratchpad
    use {
        "metakirby5/codi.vim",
        cmd = "Codi",
        disable = not Globals.plugin.codi.active,
    }

    -- Use fzy for telescope
    use {
        "nvim-telescope/telescope-fzy-native.nvim",
        event = "BufRead",
        disable = not Globals.plugin.telescope_fzy.active,
    }

    -- Use project for telescope
    use {
        "nvim-telescope/telescope-project.nvim",
        event = "BufRead",
        after = "telescope.nvim",
        disable = not Globals.plugin.telescope_project.active,
    }

    -- Sane gx for netrw_gx bug
    use {
        "felipec/vim-sanegx",
        event = "BufRead",
        disable = not Globals.plugin.sanegx.active,
    }

    -- Todo Comments
    use {
        "folke/todo-comments.nvim",
        event = "BufRead",
        disable = not Globals.plugin.todo_comments.active,
    }

    -- LSP Colors
    use {
        "folke/lsp-colors.nvim",
        event = "BufRead",
        disable = not Globals.plugin.lsp_colors.active,
    }

    -- Git Blame
    use {
        "f-person/git-blame.nvim",
        event = "BufRead",
        disable = not Globals.plugin.git_blame.active,
    }

    use {
        "ruifm/gitlinker.nvim",
        event = "BufRead",
        config = function()
            require("gitlinker").setup {
                opts = {
                    -- remote = 'github', -- force the use of a specific remote
                    -- adds current line nr in the url for normal mode
                    add_current_line_on_normal_mode = true,
                    -- callback for what to do with the url
                    action_callback = require("gitlinker.actions").open_in_browser,
                    -- print the url after performing the action
                    print_url = false,
                    -- mapping to call url generation
                    mappings = "<leader>gy",
                },
            }
        end,
        requires = "nvim-lua/plenary.nvim",
        disable = not Globals.plugin.gitlinker.active,
    }

    -- Lazygit
    use {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        disable = not Globals.plugin.lazygit.active,
    }

    -- Octo
    use {
        "pwntester/octo.nvim",
        event = "BufRead",
        disable = not Globals.plugin.octo.active,
    }

    -- Diffview
    use {
        "sindrets/diffview.nvim",
        event = "BufRead",
        disable = not Globals.plugin.diffview.active,
    }

    -- Easily Create Gists
    use {
        "mattn/vim-gist",
        event = "BufRead",
        requires = "mattn/webapi-vim",
        disable = not Globals.plugin.gist.active,
    }

    -- Lush Create Color Schemes
    use {
        "rktjmp/lush.nvim",
        -- cmd = {"LushRunQuickstart", "LushRunTutorial", "Lushify"},
        disable = not Globals.plugin.lush.active,
    }

    -- HTML preview
    use {
        "turbio/bracey.vim",
        event = "BufRead",
        run = "npm install --prefix server",
        disable = not Globals.plugin.bracey.active,
    }

    -- Debugger management
    use {
        "Pocco81/DAPInstall.nvim",
        event = "BufRead",
        disable = not Globals.plugin.dap_install.active,
    }

    -- LANGUAGE SPECIFIC GOES HERE
    use {
        "lervag/vimtex",
        ft = "tex",
        config = function()
            require "vimtex"
        end,
    }

    -- Rust tools
    -- TODO: use lazy loading maybe?
    use {
        "simrat39/rust-tools.nvim",
        disable = not Globals.lang.rust.rust_tools.active,
    }

    -- Elixir
    use { "elixir-editors/vim-elixir", ft = { "elixir", "eelixir", "euphoria3" } }

    -- Javascript / Typescript
    use {
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        ft = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
        },
    }
    -- use {
    --   "jose-elias-alvarez/null-ls.nvim",
    --   ft = {
    --     "javascript",
    --     "javascriptreact",
    --     "javascript.jsx",
    --     "typescript",
    --     "typescriptreact",
    --     "typescript.tsx",
    --   },
    --   config = function()
    --     require("null-ls").setup()
    --   end,
    -- }

    -- Tabnine
    use {
        "tzachar/compe-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-compe",
        disable = not Globals.plugin.tabnine.active,
    }

    -- Pretty parentheses
    use {
        "p00f/nvim-ts-rainbow",
        disable = not Globals.plugin.ts_rainbow.active,
    }

    -- Autotags <div>|</div>
    use {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        disable = not Globals.plugin.ts_autotag.active,
    }

    -- Custom semantic text objects
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        disable = not Globals.plugin.ts_textobjects.active,
    }

    -- Smart text objects
    use {
        "RRethy/nvim-treesitter-textsubjects",
        disable = not Globals.plugin.ts_textsubjects.active,
    }

    -- Text objects using hint labels
    use {
        "mfussenegger/nvim-ts-hint-textobject",
        event = "BufRead",
        disable = not Globals.plugin.ts_hintobjects.active,
    }

    -- use {
    --     "blackCauldron7/surround.nvim",
    --     config = function()
    --         require("surround").setup({})
    --     end
    -- }

    -- TODO remove when found a lua implementation
    use {"tpope/vim-surround"}
    use {"tpope/vim-repeat"}
    use {"editorconfig/editorconfig-vim"}
    use {
        "lfv89/vim-interestingwords",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/interestingwords.vim')
        end,
        disable = not Globals.plugin.interestingwords.active,
    }
    use {"tpope/vim-abolish"}
    use {
        "tpope/vim-obsession",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/obsession.vim')
        end,
    }
    use {"dhruvasagar/vim-prosession"}
    use {
        "janko-m/vim-test",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/test.vim')
        end,
        disable = not Globals.plugin.test.active,
    }
    use {
        "embear/vim-localvimrc",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/localvimrc.vim')
        end,
        disable = not Globals.plugin.localvimrc.active,
    }
    use {
        "ntpeters/vim-better-whitespace",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/better-whitespace.vim')
        end,
        disable = not Globals.plugin.whitespace.active,
    }

    -- TODO remove when treesitter supports corresponding languages
    -- use {"cakebaker/scss-syntax.vim", ft = {'sass', 'scss', 'html', 'phtml', 'vue'}}
    -- use {"digitaltoad/vim-pug", ft = {'jade', 'pug', 'vue'}}
    -- use {"jparise/vim-graphql", ft = {'gql', 'graphql', 'graphqls'}}
    -- use {"sheerun/vim-polyglot", ft = {'blade', 'graphql', 'pug', 'sass'}}
    use {
        "sheerun/vim-polyglot",
        config = function()
            vim.cmd('source ~/.config/nvim/vimscript/plugins/polyglot.vim')
        end,
        disable = not Globals.plugin.polyglot.active,
    }

    for _, plugin in pairs(Globals.custom_plugins) do
        packer.use(plugin)
    end
end)































-- local execute = vim.api.nvim_command
-- local fn = vim.fn

-- local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- if fn.empty(fn.glob(install_path)) > 0 then
--     execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
--     execute "packadd packer.nvim"
-- end

-- --- Check if a file or directory exists in this path
-- local function require_plugin(plugin)
--     local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

--     local plugin_path = plugin_prefix .. plugin .. "/"
--     --  print('test '..plugin_path)
--     local ok, err, code = os.rename(plugin_path, plugin_path)
--     if not ok then
--         if code == 13 then
--             -- Permission denied, but it exists
--             return true
--         end
--     end
--     --  print(ok, err, code)
--     if ok then
--         vim.cmd("packadd " .. plugin)
--     end
--     return ok, err, code
-- end

-- vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

-- return require("packer").startup(
--     function(use)
--         -- Packer can manage itself as an optional plugin
--         use "wbthomason/packer.nvim"

--         -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
--         use {"neovim/nvim-lspconfig", opt = true}
--         use {"glepnir/lspsaga.nvim", opt = true}
--         use {"kabouzeid/nvim-lspinstall", opt = true}

--         -- Telescope
--         use {"nvim-lua/popup.nvim", opt = true}
--         use {"nvim-lua/plenary.nvim", opt = true}
--         use {"nvim-telescope/telescope.nvim", opt = true}
--         use {"nvim-telescope/telescope-fzf-native.nvim", run = "make", opt = true}

--         -- Debugging
--         use {"mfussenegger/nvim-dap", opt = true}

--         -- Autocomplete
--         use {"hrsh7th/nvim-compe", opt = true}
--         use {"hrsh7th/vim-vsnip", opt = true}
--         use {"rafamadriz/friendly-snippets", opt = true}

--         -- Treesitter
--         use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
--         use {"nvim-treesitter/playground", opt = true, run =":TSInstall query"}
--         use {"windwp/nvim-ts-autotag", opt = true}

--         -- Explorer
--         use {"kyazdani42/nvim-tree.lua", opt = true}
--         -- TODO remove when open on dir is supported by nvimtree
--         -- use "kevinhwang91/rnvimr"

--         -- Comment
--         use {"terrortylor/nvim-comment", opt = true}
--         use {"JoosepAlviste/nvim-ts-context-commentstring", opt = true}

--         -- Color
--         -- use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
--         use {"tomasiser/vim-code-dark", opt = true}
--         -- use {"navarasu/onedark.nvim", opt = true}
--         -- use {"ful1e5/onedark.nvim", opt = true}
--         use {"tiagovla/tokyodark.nvim", opt = true}
--         use {"marko-cerovac/material.nvim", opt = true}
--         use {"bluz71/vim-nightfly-guicolors", opt = true}
--         use {"glepnir/zephyr-nvim", opt = true}

--         use {"norcalli/nvim-colorizer.lua", opt = true}

--         -- Icons
--         use {"kyazdani42/nvim-web-devicons", opt = true}

--         -- Status Line and Bufferline
--         use {"glepnir/galaxyline.nvim", opt = true}
--         use {"romgrk/barbar.nvim", opt = true}

--         -- Utils
--         use {"lukas-reineke/indent-blankline.nvim", opt = true}
--         use {"lewis6991/gitsigns.nvim", opt = true}
--         use {"folke/which-key.nvim", opt = true}
--         use {"glepnir/dashboard-nvim", opt = true}
--         use {"windwp/nvim-autopairs", opt = true}
--         use {"kevinhwang91/nvim-bqf", opt = true}
--         use {"junegunn/fzf", opt = true, run = ":call fzf#install()"}

--         -- TODO remove when found a lua implementation
--         use {"tpope/vim-surround"}
--         use {"tpope/vim-repeat"}
--         use {"editorconfig/editorconfig-vim"}
--         use {"lfv89/vim-interestingwords"}
--         use {"mhinz/vim-startify"}
--         use {"tpope/vim-obsession"}
--         use {"tpope/vim-abolish"}
--         use {"dhruvasagar/vim-prosession"}
--         use {"janko-m/vim-test"}
--         use {"embear/vim-localvimrc"}
--         use {"easymotion/vim-easymotion"}
--         use {"ntpeters/vim-better-whitespace"}

--         -- TODO remove when treesitter supports corresponding languages
--         -- use {"cakebaker/scss-syntax.vim", ft = {'sass', 'scss', 'html', 'phtml', 'vue'}}
--         -- use {"digitaltoad/vim-pug", ft = {'jade', 'pug', 'vue'}}
--         -- use {"jparise/vim-graphql", ft = {'gql', 'graphql', 'graphqls'}}
--         -- use {"sheerun/vim-polyglot", ft = {'blade', 'graphql', 'pug', 'sass'}}
--         use {"sheerun/vim-polyglot"}

--         require_plugin("nvim-lspconfig")
--         require_plugin("lspsaga.nvim")
--         require_plugin("nvim-lspinstall")
--         require_plugin("friendly-snippets")
--         require_plugin("telescope.nvim")
--         require_plugin("telescope-fzf-native.nvim")
--         require_plugin("popup.nvim")
--         require_plugin("plenary.nvim")
--         require_plugin("nvim-dap")
--         require_plugin("nvim-compe")
--         require_plugin("vim-vsnip")
--         require_plugin("nvim-treesitter")
--         require_plugin("playground")
--         require_plugin("nvim-ts-autotag")
--         require_plugin("nvim-tree.lua")
--         require_plugin("indent-blankline.nvim")
--         require_plugin("gitsigns.nvim")
--         -- require_plugin("which-key.nvim")
--         -- require_plugin("dashboard-nvim")
--         require_plugin("nvim-autopairs")
--         require_plugin("nvim-comment")
--         require_plugin("nvim-ts-context-commentstring")
--         require_plugin("fzf")
--         require_plugin("nvim-bqf")
--         -- require_plugin("nvcode-color-schemes.vim")
--         require_plugin("vim-code-dark")
--         -- require_plugin("onedark.nvim")
--         require_plugin("zephyr-nvim")
--         require_plugin("tokyodark.nvim")
--         require_plugin("material.nvim")
--         require_plugin("vim-nightfly-guicolors")
--         require_plugin("nvim-colorizer.lua")
--         require_plugin("nvim-web-devicons")
--         require_plugin("galaxyline.nvim")
--         require_plugin("barbar.nvim")
--         -- require_plugin("rnvimr")
--     end
-- )
