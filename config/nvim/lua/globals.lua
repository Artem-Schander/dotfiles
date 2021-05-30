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
        dark = '#001001',
        bg = '#1e2127',
        black = '#1e2127',
        gray = '#8f96a5',
        white = '#c3ccdc',
        bright = '#dbdfe6',
        dark_gray = '#282c34',
        gutter_gray = '#4b5263',
        comment_gray = '#5c6370',
        light_gray = '#abb2bf',
        red = '#e06c75',
        dark_red = '#be5046',
        green = '#98c379',
        blue = '#61afef',
        magenta = '#c678dd',
        purple = '#9556ff',
        cyan = '#56b6c2',
        yellow = '#e5c07b',
        orange = '#d19a66',
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
