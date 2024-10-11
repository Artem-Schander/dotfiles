-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

local wk = require "which-key"

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  "LunarVim/lunar.nvim",

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.formatting.format_on_save.enabled = false
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings

      local astro = require "astrocore"
      local is_available = astro.is_available

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

      -- better indenting
      vim.keymap.set("n", "<S-Tab>", "<<")
      vim.keymap.set("v", "<S-Tab>", "<gv")
      vim.keymap.set("n", "<Tab>", ">>")
      vim.keymap.set("v", "<Tab>", ">gv")

      -- Scroll faster
      vim.keymap.set("n", "<C-e>", "3<C-e>", { noremap = true, silent = true })
      vim.keymap.set("n", "<C-y>", "3<C-y>", { noremap = true, silent = true })

      -- Deal with other peoples code
      vim.keymap.set("n", "\\t", ":set ts=4 sts=4 sw=4 noet<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "\\s", ":set ts=4 sts=4 sw=4 et<CR>", { noremap = true, silent = true })

      -- Gitsigns
      if is_available "gitsigns.nvim" then
        maps.n["<Leader>gj"] = {
          function() require("gitsigns").next_hunk() end,
          desc = "Next Git Hunk",
        }
        maps.n["<Leader>gk"] = {
          function() require("gitsigns").prev_hunk() end,
          desc = "Previous Git Hunk",
        }
      end

      -- quickfix
      -- vim.keymap.del({ "n", "v" }, "<C-q>")
      maps.n["<C-Q>"] = nil
      if is_available "nvim-bqf" then
        vim.cmd [[
          function! QuickFixToggle()
            if empty(filter(getwininfo(), 'v:val.quickfix'))
              copen
            else
              cclose
            endif
          endfunction
        ]]
        vim.keymap.set({ "n", "v" }, "<C-Q>", ":call QuickFixToggle()<CR>")
      end

      maps.n["<Leader><"] = {
        ":IBLToggle<CR>",
        desc = "Toggle Indent Lines",
      }
      maps.n["<Leader>>"] = {
        ":set list!<CR>",
        desc = "Toggle Invisible Characters",
      }

      maps.n["<Leader>h"] = {
        function() require("fzf-lua").buffers() end,
        desc = "Find buffers",
      }
      maps.n["<Leader>a"] = {
        function()
          require("fzf-lua").files {
            fd_opts = "--color=never --type f --hidden --follow --no-ignore",
            rg_opts = "--color=never --files --hidden --follow --no-ignore",
          }
        end,
        desc = "Find All Files",
      }
      if vim.fn.executable "rg" == 1 then
        if vim.fn.executable "git" == 1 then
          maps.n["<Leader>s"] = {
            -- function() require("fzf-lua").live_grep { cmd = "git grep --line-number --column --color=always" } end,
            function() require("fzf-lua").files() end,
            desc = "Find Files",
          }
        end
      end

      if vim.fn.executable "git" == 1 then
        maps.n["<Leader>j"] = {
          function() require("fzf-lua").grep_project() end,
          desc = "Find Text",
        }
      else
        maps.n["<Leader>j"] = {
          function() require("fzf-lua").live_grep() end,
          desc = "Find Text",
        }
      end
    end,
  },

  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function(_, opts)
      local path = vim.fn.getcwd()
      local home = vim.fn.expand "$HOME"

      -- customize the dashboard header
      opts.section.header.val = {
        "~" .. path:gsub(home, ""),
      }

      opts.config.layout = {
        {
          type = "padding",
          val = vim.fn.max { 1, vim.fn.floor(vim.fn.winheight(0) * 0.15) },
        },
        opts.section.header,
        {
          type = "padding",
          val = 2,
        },
        opts.section.buttons,
        {
          type = "padding",
          val = 1,
        },
        opts.section.footer,
      }

      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })

      vim.tbl_map(
        function(type)
          require("luasnip.loaders.from_" .. type).lazy_load { paths = { vim.fn.stdpath "config" .. "/snippets" } }
        end,
        { "vscode", "snipmate", "lua" }
      )
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't' delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  { "EmranMR/tree-sitter-blade" },

  { "tpope/vim-surround" },
  { "tpope/vim-abolish" },
  { "tpope/vim-repeat" },
  { "chrisbra/csv.vim" },
  { "editorconfig/editorconfig-vim" },
  -- {
  --   "Shatur/neovim-session-manager",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   event = "VeryLazy",
  --   config = function()
  --     local Path = require "plenary.path"
  --     local config = require "session_manager.config"
  --     require("session_manager").setup {
  --       sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"), -- The directory where the session files will be saved.
  --       -- session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
  --       -- dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.uv.cwd()` if the passed `dir` is `nil`.
  --       -- autoload_mode = config.AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. See "Autoload mode" section below.
  --       -- autoload_mode = config.AutoloadMode.Disabled,
  --       autoload_mode = config.AutoloadMode.Disabled,
  --       autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  --       autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  --       autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
  --       autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
  --         "alpha",
  --         "gitcommit",
  --         "gitrebase",
  --       },
  --       autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
  --       autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  --       max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
  --     }
  --   end,
  -- },
  {
    "folke/flash.nvim",
    -- event = "VeryLazy",
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
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
    enabled = true,
  },
  {
    -- Better quickfix
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
  },
  {
    "lfv89/vim-interestingwords",
    config = function() vim.cmd "source ~/.config/nvim/vimscript/interestingwords.vim" end,
  },
  -- NOTE: cannot highlight selection
  -- {
  --   "Mr-LLLLL/interestingwords.nvim",
  --   config = function()
  --     require("interestingwords").setup {
  --       colors = {
  --         "#A4E57E",
  --         "#FFDB72",
  --         "#E06C75",
  --         "#FFB3FF",
  --         "#D19A66",
  --         "#DBDFE6",
  --         "#A38CFF",
  --         "#C6F8DD",
  --         "#B8AFA9",
  --         "#8CCBEA",
  --       },
  --       search_count = true,
  --       navigation = true,
  --       scroll_center = true,
  --       search_key = false,
  --       cancel_search_key = false,
  --       color_key = false,
  --       cancel_color_key = false,
  --     }
  --     -- wk.register {
  --     --   ["<leader>m"] = false,
  --     -- }
  --   end,
  -- },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter" },
    config = function()
      local u = require "treesj.langs.utils"
      local langs = require "treesj.langs"
      langs = u._prepare_presets(langs.presets)
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

      langs["graphql"] = {
        selection_set = u.set_default_preset {
          split = {
            recursive = true,
          },
        },
        tag = {
          target_nodes = { "selection_set" },
        },
      }
      require("treesj").setup {
        -- Use default keymaps
        -- (<space>m - toggle, <space>j - join, <space>s - split)
        use_default_keymaps = false,

        -- Node with syntax error will not be formatted
        check_syntax_error = true,

        -- If line after join will be longer than max value,
        -- node will not be formatted
        max_join_length = 120000,

        -- hold|start|end:
        -- hold - cursor follows the node/place on which it was called
        -- start - cursor jumps to the first symbol of the node being formatted
        -- end - cursor jumps to the last symbol of the node being formatted
        cursor_behavior = "hold",

        -- Notify about possible problems or not
        notify = true,
        -- langs = langs,

        -- Use `dot` for repeat action
        dot_repeat = true,
      }

      -- lvim.builtin.which_key.mappings["m"] = { ":TSJToggle<CR>", "Split/Join Block" }
    end,
  },
  {
    "klen/nvim-config-local",
    config = function()
      require('config-local').setup {
        -- Default options (optional)

        -- Config file patterns to load (lua supported)
        config_files = { ".nvim.lua", ".nvimrc", ".exrc", ".vimrc.lua", ".vimrc" },

        -- Where the plugin keeps files data
        hashfile = vim.fn.stdpath("data") .. "/config-local",

        autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true,     -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
        silent = false,             -- Disable plugin messages (Config loaded/ignored)
        lookup_parents = false,     -- Lookup config files in parent directories
      }
    end
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
}
