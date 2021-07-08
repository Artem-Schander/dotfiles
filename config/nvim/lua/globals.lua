CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

Globals = {
    format_on_save = true,
    auto_close_tree = 1,
    auto_complete = true,
    colorscheme = "lunar",
    hidden_files = true,
    wrap_lines = false,
    number = true,
    relative_number = true,
    cursorline = true,
    shell = "bash",
    timeoutlen = 100,
    nvim_tree_disable_netrw = 0,
    ignore_case = true,
    smart_case = true,
    lushmode = false,
    hl_search = false,
    transparent_window = false,
    leader_key = "space",
    vnsip_dir = vim.fn.stdpath "config" .. "/snippets",
    colors = {
        black = '#17191e',
        bg = '#1e2127',
        bg0 = '#282c34',
        bg1 = '#31353f',
        bg2 = '#393f4a',
        bg3 = '#3b3f4c',
        bg_d = '#21252b',
        bg_blue = '#73b8f1',
        bg_yellow = '#ebd09c',
        fg = '#abb2bf',
        white = '#c3ccdc',
        bright = '#dbdfe6',
        magenta = '#c678dd',
        purple = '#9556ff',
        green = '#98c379',
        orange = '#d19a66',
        blue = '#61afef',
        yellow = '#e5c07b',
        cyan = '#56b6c2',
        red = '#e06c75',
        -- red = '#e86671',
        gray = '#8f96a5',
        comment_gray = '#5c6370',
        dark_blue = '#274964',
        dark_cyan = '#2b6f77',
        dark_red = '#993939',
        dark_yellow = '#93691d',
        dark_purple = '#8a3fa0',
        diff_red = '#773440',
        diff_green = '#587738',
        diff_blue = '#5574A3',
        diff_add = '#1E2326',
        diff_change = '#262b3d',
        diff_delete = '#281B27',
    },

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = "all",
        ignore_install = { "haskell" },
        highlight = { enabled = true },
        rainbow = { enabled = false },
        -- The below are for treesitter-textobjects plugin
        textobj_prefixes = {
            goto_next = "]", -- Go to next
            goto_previous = "[", -- Go to previous
            inner = "i", -- Select inside
            outer = "a", -- Selct around
            swap = "<leader>a", -- Swap with next
        },
        textobj_suffixes = {
            -- Start and End respectively for the goto keys
            -- for other keys it only uses the first
            ["function"] = { "f", "F" },
            ["class"] = { "m", "M" },
            ["parameter"] = { "a", "A" },
            ["block"] = { "k", "K" },
            ["conditional"] = { "i", "I" },
            ["call"] = { "c", "C" },
            ["loop"] = { "l", "L" },
            ["statement"] = { "s", "S" },
            ["comment"] = { "/", "?" },
        },
        -- The below is for treesitter hint textobjects plugin
        hint_labels = { "h", "j", "f", "d", "n", "v", "s", "l", "a" },
    },

    lsp = {
        popup_border = "single",
    },

    database = {
        save_location = '~/.config/nvim/db',
        auto_execute = 1
    },


    plugin = {
        -- TODO remove non built-ins
        -- Builtins
        dashboard = { active = false },
        startify = { active = false },
        colorizer = { active = false },
        zen = { active = false },
        ts_playground = { active = false },
        ts_context_commentstring = { active = false },
        ts_hintobjects = { active = false },
        ts_autotag = { active = false },
        ts_rainbow = { active = false },
        ts_textobjects = { active = false },
        ts_textsubjects = { active = false },
        telescope_fzy = { active = false },
        telescope_project = { active = false },
        indent_line = { active = false },
        symbol_outline = { active = false },
        debug = { active = false },
        dap_install = { active = false },
        lazygit = { active = false },
        lush = { active = false },
        diffview = { active = false },
        which_key = { active = false },
        test = { active = false },
        whitespace = { active = false },
        localvimrc = { active = false },
        interestingwords = { active = false },
        polyglot = { active = false },

        ----------------------------------------------------------------------
        -- Non builtins

        octo = { active = false },
        gitlinker = { active = false },
        todo_comments = { active = false },
        gist = { active = false },
        git_blame = { active = false },
        lsp_colors = { active = false },
        ranger = { active = false },
        hop = { active = false },
        dial = { active = false },
        matchup = { active = false },
        numb = { active = false },
        bqf = { active = false },
        trouble = { active = false },
        floatterm = { active = false },
        spectre = { active = false },
        lsp_rooter = { active = false },
        markdown_preview = { active = false },
        bracey = { active = false },
        codi = { active = false },
        sanegx = { active = false },
        tabnine = { active = false },
    },

    custom_plugins = {
        -- use config.lua for this not put here
    },

    user_autocommands = {
        { "FileType", "qf", "set nobuflisted" },
    },

    lang = {
        python = {
            linter = "",
            isort = false,
            diagnostics = {
                virtual_text = { spacing = 0, prefix = "" },
                signs = true,
                underline = true,
            },
            analysis = {
                type_checking = "basic",
                auto_search_paths = true,
                use_library_code_types = true,
            },
        },
        dart = {
            sdk_path = "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot",
        },
        lua = {
            diagnostics = {
                virtual_text = { spacing = 0, prefix = "" },
                signs = true,
                underline = true,
            },
        },
        sh = {
            -- @usage can be 'shellcheck'
            linter = "",
            -- @usage can be 'shfmt'
            diagnostics = {
                virtual_text = { spacing = 0, prefix = "" },
                signs = true,
                underline = true,
            },
        },
        tsserver = {
            -- @usage can be 'eslint'
            linter = "",
            diagnostics = {
                virtual_text = { spacing = 0, prefix = "" },
                signs = true,
                underline = true,
            },
        },
        json = {
            diagnostics = {
                virtual_text = { spacing = 0, prefix = "" },
                signs = true,
                underline = true,
            },
        },
        tailwindcss = {
            filetypes = {
                "html",
                "css",
                "scss",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
            },
        },
        clang = {
            diagnostics = {
                virtual_text = { spacing = 0, prefix = "" },
                signs = true,
                underline = true,
            },
            cross_file_rename = true,
            header_insertion = "never",
        },
        ruby = {
            diagnostics = {
                virtualtext = { spacing = 0, prefix = "" },
                signs = true,
                underline = true,
            },
            filetypes = { "rb", "erb", "rakefile", "ruby" },
        },
        go = {},
        elixir = {},
        vim = {},
        yaml = {},
        terraform = {},
        rust = {
            rust_tools = {
                active = false,
            },
            linter = "",
            diagnostics = {
                virtual_text = { spacing = 0, prefix = "" },
                signs = true,
                underline = true,
            },
        },
        svelte = {},
        php = {
            environment = {
                php_version = "7.4",
            },
            diagnostics = {
                virtual_text = { spacing = 0, prefix = "" },
                signs = true,
                underline = true,
            },
            filetypes = { "php", "phtml" },
        },
        latex = {},
        kotlin = {},
        html = {},
        elm = {},
        emmet = { active = true },
        graphql = {},
        efm = {},
        docker = {},
        cmake = {},
        java = {},
        css = {
            virtual_text = true,
        },
    },

    dashboard = {
        custom_header = {
            ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
            ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
            ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
            ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
            ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
            ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
        },
        footer = {}
    }
}









-- globals = {
--     auto_close_tree = 1,
--     auto_complete = true,
--     colorscheme = 'onedark',
--     hidden_files = true,
--     wrap_lines = false,
--     number = true,
--     relative_number = true,
--     shell = 'bash',
--     timeoutlen = 200,

--     colors = {
--         black = '#17191e',
--         bg = '#1e2127',
--         bg0 = '#282c34',
--         bg1 = '#31353f',
--         bg2 = '#393f4a',
--         bg3 = '#3b3f4c',
--         bg_d = '#21252b',
--         bg_blue = '#73b8f1',
--         bg_yellow = '#ebd09c',
--         fg = '#abb2bf',
--         white = '#c3ccdc',
--         bright = '#dbdfe6',
--         magenta = '#c678dd',
--         purple = '#9556ff',
--         green = '#98c379',
--         orange = '#d19a66',
--         blue = '#61afef',
--         yellow = '#e5c07b',
--         cyan = '#56b6c2',
--         red = '#e06c75',
--         -- red = '#e86671',
--         gray = '#8f96a5',
--         comment_gray = '#5c6370',
--         dark_blue = '#274964',
--         dark_cyan = '#2b6f77',
--         dark_red = '#993939',
--         dark_yellow = '#93691d',
--         dark_purple = '#8a3fa0',
--         diff_red = '#773440',
--         diff_green = '#587738',
--         diff_blue = '#5574A3',
--         diff_add = '#1E2326',
--         diff_change = '#262b3d',
--         diff_delete = '#281B27',
--     },

--     -- @usage pass a table with your desired languages
--     treesitter = {
--         ensure_installed = "all",
--         ignore_install = {"haskell"},
--         highlight = {enabled = true},
--         playground = {enabled = true},
--         rainbow = {enabled = false}
--     },

--     database = {
--         save_location = '~/.config/nvim/db',
--         auto_execute = 1
--     },
--     python = {
--         linter = '',
--         -- @usage can be 'yapf', 'black'
--         formatter = '',
--         autoformat = false,
--         isort = false,
--         diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
--         analysis = {type_checking = "basic", auto_search_paths = true, use_library_code_types = true}
--     },
--     dart = {
--         sdk_path = '/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot'
--     },
--     lua = {
--         -- @usage can be 'lua-format'
--         formatter = '',
--         autoformat = false,
--         diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
--     },
--     sh = {
--         -- @usage can be 'shellcheck'
--         linter = '',
--         -- @usage can be 'shfmt'
--         formatter = '',
--         autoformat = false,
--         diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
--     },
--     tsserver = {
--         -- @usage can be 'eslint'
--         linter = '',
--         -- @usage can be 'prettier'
--         formatter = '',
--         autoformat = false,
--         diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
--     },
--     json = {
--         -- @usage can be 'prettier'
--         formatter = '',
--         autoformat = false,
--         diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
--     },
--     tailwindls = {
--         filetypes = {'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}
--     },
--     clang = {
--         diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
--     },
--     ruby = {
--         diagnostics = {virtualtext = {spacing = 0, prefix = ""}, signs = true, underline = true},
--         filetypes = {'rb', 'erb', 'rakefile'}
--     },

--     dashboard = {
--         custom_header = {
--             ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
--             ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
--             ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
--             ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
--             ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
--             ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
--         },
--         footer = {}
--     }
-- }

-- DATA_PATH = vim.fn.stdpath('data')
-- CACHE_PATH = vim.fn.stdpath('cache')
