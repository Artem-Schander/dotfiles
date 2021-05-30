globals = {
    auto_close_tree = 1,
    auto_complete = true,
    colorscheme = 'onedark',
    hidden_files = true,
    wrap_lines = false,
    number = true,
    relative_number = true,
    shell = 'bash',
    timeoutlen = 200,

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
        dark_cyan = '#2b6f77',
        dark_red = '#993939',
        dark_yellow = '#93691d',
        dark_purple = '#8a3fa0',
        diff_red = '#773440',
        diff_green = '#587738',
        diff_blue = '#354A77',
        diff_add = '#1E2326',
        diff_change = '#262b3d',
        diff_delete = '#281B27',
    },

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = false}
    },

    database = {
        save_location = '~/.config/nvim/db',
        auto_execute = 1
    },
    python = {
        linter = '',
        -- @usage can be 'yapf', 'black'
        formatter = '',
        autoformat = false,
        isort = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
        analysis = {type_checking = "basic", auto_search_paths = true, use_library_code_types = true}
    },
    dart = {
        sdk_path = '/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot'
    },
    lua = {
        -- @usage can be 'lua-format'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    sh = {
        -- @usage can be 'shellcheck'
        linter = '',
        -- @usage can be 'shfmt'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    tsserver = {
        -- @usage can be 'eslint'
        linter = '',
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    tailwindls = {
        filetypes = {'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}
    },
    clang = {
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    ruby = {
        diagnostics = {virtualtext = {spacing = 0, prefix = ""}, signs = true, underline = true},
        filetypes = {'rb', 'erb', 'rakefile'}
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

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
