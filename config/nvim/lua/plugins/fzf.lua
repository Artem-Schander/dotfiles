---@type LazySpec
return {
  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    priority = 400,
    dependencies = {
      {
        "junegunn/fzf",
        dir = "~/.fzf",
        lazy = true,
        build = "./install --bin",
      },
      -- {
      --   "junegunn/fzf.vim",
      --   dependencies = { "junegunn/fzf" },
      --   opts = function(_, opts)
      --     vim.cmd "source ~/.config/nvim/vimscript/fzf.vim"
      --     -- lvim.builtin.which_key.mappings["b"] = { "<cmd>Buffers<CR>", "Find Buffer" }
      --     --
      --     -- lvim.builtin.which_key.mappings["t"] = { ":RG<CR>", "Find Text" }
      --     -- lvim.builtin.which_key.mappings["a"] = { ":Files<CR>", "Find File (w. hidden)" }
      --     -- lvim.builtin.which_key.mappings["s"]["s"] = { ":Rg <c-r><c-w><CR>", "Find String Under Cursor" }
      --     --
      --     -- if vim.fn.isdirectory('.git') ~= 0 then
      --     --   lvim.builtin.which_key.mappings["f"] = { "<cmd>GitFiles --cached --others --exclude-standard<CR>", "Find File" }
      --     -- else
      --     --   lvim.builtin.which_key.mappings["f"] = { "<cmd>FZF<CR>", "Find File" }
      --     -- end
      --   end,
      --   enabled = false,
      -- },
      {
        "AstroNvim/astrocore",
        lazy = true,
        opts = function(plugin, opts)
          require("fzf-lua").setup {
            -- fzf_bin = 'sk',            -- use skim instead of fzf?
            -- https://github.com/lotabout/skim
            global_resume = true, -- enable global `resume`?
            -- can also be sent individually:
            -- `<any_function>.({ gl ... })`
            global_resume_query = true, -- include typed query in `resume`?
            winopts = {
              -- split         = "belowright new",-- open in a split instead?
              -- "belowright new"  : split below
              -- "aboveleft new"   : split above
              -- "belowright vnew" : split right
              -- "aboveleft vnew   : split left
              -- Only valid when using a float window
              -- (i.e. when 'split' is not defined, default)
              height = 0.85, -- window height
              width = 0.80, -- window width
              row = 0.35, -- window row position (0=top, 1=bottom)
              col = 0.50, -- window col position (0=left, 1=right)
              -- border argument passthrough to nvim_open_win(), also used
              -- to manually draw the border characters around the preview
              -- window, can be set to 'false' to remove all borders or to
              -- 'none', 'single', 'double', 'thicc' or 'rounded' (default)
              border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
              fullscreen = false, -- start fullscreen?
              -- highlights should optimally be set by the colorscheme using
              -- FzfLuaXXX highlights. If your colorscheme doesn't set these
              -- or you wish to override its defaults use these:
              -- hl = {
              --   normal = 'Normal', -- window normal color (fg+bg)
              --   border = 'FloatBorder', -- border color
              --   help_normal = 'Normal', -- <F1> window normal
              --   help_border = 'FloatBorder', -- <F1> window border
              --   -- Only used with the builtin previewer:
              --   cursor = 'Cursor', -- cursor highlight (grep/LSP matches)
              --   cursorline = 'CursorLine', -- cursor line
              --   cursorlinenr = 'CursorLineNr', -- cursor line number
              --   search = 'IncSearch', -- search matches (ctags|help)
              --   title = 'Normal', -- preview border title (file/buffer)
              --   -- Only used with 'winopts.preview.scrollbar = 'float'
              --   scrollfloat_e = 'PmenuSbar', -- scrollbar "empty" section highlight
              --   scrollfloat_f = 'PmenuThumb', -- scrollbar "full" section highlight
              --   -- Only used with 'winopts.preview.scrollbar = 'border'
              --   scrollborder_e = 'FloatBorder', -- scrollbar "empty" section highlight
              --   scrollborder_f = 'FloatBorder', -- scrollbar "full" section highlight
              -- },
              preview = {
                -- default     = 'bat',           -- override the default previewer?
                -- default uses the 'builtin' previewer
                border = "border", -- border|noborder, applies only to
                -- native fzf previewers (bat/cat/git/etc)
                wrap = "nowrap", -- wrap|nowrap
                hidden = "nohidden", -- hidden|nohidden
                vertical = "up:60%", -- up|down:size
                horizontal = "right:60%", -- right|left:size
                layout = "flex", -- horizontal|vertical|flex
                flip_columns = 180, -- #cols to switch to horizontal on flex
                -- Only used with the builtin previewer:
                title = true, -- preview border title (file/buf)?
                title_align = "left", -- left|center|right, title alignment
                scrollbar = "float", -- `false` or string:'float|border'
                -- float:  in-window floating border
                -- border: in-border chars (see below)
                scrolloff = "-2", -- float scrollbar offset from right
                -- applies only when scrollbar = 'float'
                scrollchars = { "█", "" }, -- scrollbar chars ({ <full>, <empty> }
                -- applies only when scrollbar = 'border'
                delay = 100, -- delay(ms) displaying the preview
                -- prevents lag on fast scrolling
                winopts = { -- builtin previewer window options
                  number = true,
                  relativenumber = false,
                  cursorline = true,
                  cursorlineopt = "both",
                  cursorcolumn = false,
                  signcolumn = "no",
                  list = false,
                  foldenable = false,
                  foldmethod = "manual",
                },
              },
              on_create = function()
                -- called once upon creation of the fzf main window
                -- can be used to add custom fzf-lua mappings, e.g:
                --   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>",
                --     { silent = true, noremap = true })
              end,
            },
            fzf_opts = {
              -- options are sent as `<left>=<right>`
              -- set to `false` to remove a flag
              -- set to '' for a non-value flag
              -- for raw args use `fzf_args` instead
              ["--ansi"] = "",
              ["--info"] = "inline",
              ["--height"] = "100%",
              -- ['--layout'] = 'default',
              ["--layout"] = "reverse",
              ["--border"] = "none",
            },
            -- fzf '--color=' options (optional)
            -- fzf_colors = {
            --       ["fg"] = { "fg", "CursorLine" },
            --       ["bg"] = { "bg", "Normal" },
            --       ["hl"] = { "fg", "Comment" },
            --       ["fg+"] = { "fg", "Normal" },
            --       ["bg+"] = { "bg", "CursorLine" },
            --       ["hl+"] = { "fg", "Statement" },
            --       ["info"] = { "fg", "PreProc" },
            --       ["prompt"] = { "fg", "Conditional" },
            --       ["pointer"] = { "fg", "Exception" },
            --       ["marker"] = { "fg", "Keyword" },
            --       ["spinner"] = { "fg", "Label" },
            --       ["header"] = { "fg", "Comment" },
            --       ["gutter"] = { "bg", "Normal" },
            --   },
          }

          local maps = opts.mappings
          local astro = require "astrocore"
          local is_available = astro.is_available
          maps.n["<Leader>f"] = vim.tbl_get(opts, "_map_sections", "f")
          maps.n["<Leader>f'"] = { function() require("fzf-lua").marks() end, desc = "Find marks" }
          maps.n["<Leader>f/"] = {
            function() require("fzf-lua").lgrep_curbuf() end,
            desc = "Find words in current buffer",
          }
          maps.n["<Leader>fa"] = {
            function() require("fzf-lua").files { cwd = "~/.config" } end,
            desc = "Find AstroNvim config files",
          }
          maps.n["<Leader>fb"] = {
            function() require("fzf-lua").buffers() end,
            desc = "Find buffers",
          }
          maps.n["<Leader>fc"] = { function() require("fzf-lua").grep_cword() end, desc = "Find word under cursor" }
          maps.n["<Leader>fC"] = { function() require("fzf-lua").commands() end, desc = "Find commands" }
          maps.n["<Leader>ff"] = { function() require("fzf-lua").files() end, desc = "Find files" }
          maps.n["<Leader>fF"] = {
            function()
              require("fzf-lua").files {
                fd_opts = "--color=never --type f --hidden --follow --no-ignore",
                rg_opts = "--color=never --files --hidden --follow --no-ignore",
              }
            end,
            desc = "Find all files",
          }
          maps.n["<Leader>fh"] = { function() require("fzf-lua").helptags() end, desc = "Find help" }
          maps.n["<Leader>fk"] = { function() require("fzf-lua").keymaps() end, desc = "Find keymaps" }
          maps.n["<Leader>fm"] = {}
          maps.n["<Leader>fo"] = { function() require("fzf-lua").oldfiles() end, desc = "Find history" }
          maps.n["<Leader>fr"] = { function() require("fzf-lua").registers() end, desc = "Find registers" }
          maps.n["<Leader>ft"] = {
            function() require("fzf-lua").colorschemes { winopts = { height = 0.33, width = 0.33 } } end,
            desc = "Find themes",
          }

          if vim.fn.executable "rg" == 1 then
            if vim.fn.executable "git" == 1 then
              maps.n["<Leader>fw"] = {
                function() require("fzf-lua").live_grep { cmd = "git grep --line-number --column --color=always" } end,
                desc = "Find words",
              }

              maps.n["<Leader>fW"] = {
                function() require("fzf-lua").live_grep() end,
                desc = "Find words in all files",
              }
            else
              maps.n["<Leader>fw"] = {
                function() require("fzf-lua").live_grep() end,
                desc = "Find words in all files",
              }
            end
            maps.n["<Leader>f<CR>"] =
              { function() require("fzf-lua").live_grep_resume() end, desc = "Resume previous search" }
          end

          if vim.fn.executable "git" == 1 then
            maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
            maps.n["<Leader>gb"] = {
              function() require("fzf-lua").git_branches() end,
              desc = "Git branches",
            }
            -- NOTE
            -- maps.n["<Leader>gc"] = {
            --   function() require("fzf-lua").git_commits() end,
            --   desc = "Git commits (repository)",
            -- }
            -- maps.n["<Leader>gC"] = {
            --   function() require("fzf-lua").git_bcommits() end,
            --   desc = "Git commits (current file)",
            -- }
            maps.n["<Leader>gt"] = { function() require("fzf-lua").git_status() end, desc = "Git status" }
          end
        end,
      },
      {
        "AstroNvim/astrolsp",
        opts = function(plugin, opts)
          local maps = opts.mappings

          maps.n["<Leader>r"] = {
            function() require("fzf-lua").lsp_document_symbols() end,
            desc = "Find document symbols",
            cond = "textDocument/definition",
          }

          -- maps.n["<Leader>ls"] = {
          --   function()
          --     -- if is_available "aerial.nvim" then
          --     --   require("telescope").extensions.aerial.aerial()
          --     -- else
          --     --   require("fzf-lua").lsp_document_symbols()
          --     -- end
          --     require("fzf-lua").lsp_document_symbols()
          --   end,
          --   desc = "Search symbols",
          --   cond = "textDocument/definition",
          -- }

          maps.n["<Leader>lG"] = nil
          maps.n["<Leader>ls"] = {
            function() require("fzf-lua").lsp_live_workspace_symbols() end,
            desc = "Search workspace symbols",
            cond = "workspace/symbol",
          }
        end,
      },
    },
  },
}
