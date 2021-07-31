CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"

lvim = {
    leader = "space",
    colorscheme = "spacegray",
    line_wrap_cursor_movement = true,
    transparent_window = false,
    format_on_save = true,
    vsnip_dir = os.getenv "HOME" .. "/.config/snippets",
    database = { save_location = "~/.config/nvim_db", auto_execute = 1 },
    keys = {},

    -- TODO why do we need this?
    builtin = {
        lspinstall = {},
        telescope = {},
        compe = {},
        autopairs = {},
        treesitter = {},
        nvimtree = {},
        gitsigns = {},
        which_key = {},
        comment = {},
        rooter = {},
        galaxyline = {},
        bufferline = {},
        dap = {},
        dashboard = {},
        terminal = {},
    },

    lsp = {
        diagnostics = {
            virtual_text = {
                prefix = "",
                spacing = 0,
            },
            signs = true,
            underline = true,
        },
        override = {},
        document_highlight = true,
        popup_border = "single",
        default_keybinds = true,
        on_attach_callback = nil,
    },

    plugins = {
        -- use lv-config.lua for this not put here
    },

    autocommands = {},
}

local schemas = nil
local common_on_attach = require("lsp.service").common_on_attach
local common_capabilities = require("lsp.service").common_capabilities()
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
    schemas = jsonls_settings.get_default_schemas()
end

-- TODO move all of this into lang specific files, only require when using
lvim.lang = {
    asm = {
        formatter = {
            exe = "asmfmt",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "",
            setup = {},
        },
    },
    beancount = {
        formatter = {
            exe = "bean_format",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "beancount",
            setup = {
                cmd = { "beancount-langserver" },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    c = {
        formatter = {
            exe = "clang_format",
            args = {},
            stdin = true,
        },
        linters = {
            "clangtidy",
        },
        lsp = {
            provider = "clangd",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd",
                    "--background-index",
                    "--header-insertion=never",
                    "--cross-file-rename",
                    "--clang-tidy",
                    "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    cpp = {
        formatter = {
            exe = "clang_format",
            args = {},
            stdin = true,
        },
        linters = {
            "cppcheck",
            "clangtidy",
        },
        lsp = {
            provider = "clangd",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd",
                    "--background-index",
                    "--header-insertion=never",
                    "--cross-file-rename",
                    "--clang-tidy",
                    "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    crystal = {
        formatter = {
            exe = "crystal_format",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "crystalline",
            setup = {
                cmd = { "crystalline" },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    cs = {
        formatter = {
            exe = "clang_format",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "omnisharp",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/csharp/omnisharp/run",
                    "--languageserver",
                    "--hostPID",
                    tostring(vim.fn.getpid()),
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    cmake = {
        formatter = {
            exe = "cmake_format",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "cmake",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/cmake/venv/bin/cmake-language-server",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    clojure = {
        formatter = {
            exe = "",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "clojure_lsp",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/clojure/clojure-lsp",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    css = {
        formatter = {
            exe = "prettier",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "cssls",
            setup = {
                cmd = {
                    "node",
                    DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    d = {
        formatter = {
            exe = "dfmt",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "serve_d",
            setup = {
                cmd = { "serve-d" },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    dart = {
        formatter = {
            exe = "dart_format",
            args = {},
            stdin = true,
        },
        linters = {},
        lsp = {
            provider = "dartls",
            setup = {
                cmd = {
                    "dart",
                    "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot",
                    "--lsp",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    docker = {
        formatter = {
            exe = "",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "dockerls",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/dockerfile/node_modules/.bin/docker-langserver",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    elixir = {
        formatter = {
            exe = "mix",
            args = {},
            stdin = true,
        },
        linters = {},
        lsp = {
            provider = "elixirls",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/elixir/elixir-ls/language_server.sh",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    elm = {
        formatter = {
            exe = "elm_format",
            args = {},
            stdin = true,
        },
        linters = {},
        lsp = {
            provider = "elmls",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/elm/node_modules/.bin/elm-language-server",
                },
                on_attach = common_on_attach,
                init_options = {
                    elmAnalyseTrigger = "change",
                    elmFormatPath = DATA_PATH .. "/lspinstall/elm/node_modules/.bin/elm-format",
                    elmPath = DATA_PATH .. "/lspinstall/elm/node_modules/.bin/",
                    elmTestPath = DATA_PATH .. "/lspinstall/elm/node_modules/.bin/elm-test",
                },
            },
        },
    },
    erlang = {
        formatter = {
            exe = "erlfmt",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "erlangls",
            setup = {
                cmd = {
                    "erlang_ls",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    emmet = { active = false },
    fish = {
        formatter = {
            exe = "fish_indent",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "",
            setup = {
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    go = {
        formatter = {
            exe = "gofmt",
            args = {},
            stdin = true,
        },
        linters = {
            "golangcilint",
            "revive",
        },
        lsp = {
            provider = "gopls",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/go/gopls",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    graphql = {
        formatter = {
            exe = "",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "graphql",
            setup = {
                cmd = {
                    "graphql-lsp",
                    "server",
                    "-m",
                    "stream",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    html = {
        formatter = {
            exe = "prettier",
            args = {},
        },
        linters = {
            "tidy",
            -- https://docs.errata.ai/vale/scoping#html
            "vale",
        },
        lsp = {
            provider = "html",
            setup = {
                cmd = {
                    "node",
                    DATA_PATH .. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    java = {
        formatter = {
            exe = "prettier",
            args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
        },
        linters = {},
        lsp = {
            provider = "jdtls",
            setup = {
                cmd = { DATA_PATH .. "/lspinstall/java/jdtls.sh" },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    json = {
        formatter = {
            exe = "json_tool",
            args = {},
            stdin = true,
        },
        linters = {},
        lsp = {
            provider = "jsonls",
            setup = {
                cmd = {
                    "node",
                    DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
                settings = {
                    json = {
                        schemas = schemas,
                        --   = {
                        --   {
                        --     fileMatch = { "package.json" },
                        --     url = "https://json.schemastore.org/package.json",
                        --   },
                        -- },
                    },
                },
                commands = {
                    Format = {
                        function()
                            vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
                        end,
                    },
                },
            },
        },
    },
    julia = {
        formatter = {
            exe = "",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "julials",
            setup = {
                {
                    "julia",
                    "--startup-file=no",
                    "--history-file=no",
                    -- vim.fn.expand "~/.config/nvim/lua/lsp/julia/run.jl",
                    CONFIG_PATH .. "/utils/julia/run.jl",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    kotlin = {
        formatter = {
            exe = "",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "kotlin_language_server",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/kotlin/server/bin/kotlin-language-server",
                },
                on_attach = common_on_attach,
                root_dir = function(fname)
                    local util = require "lspconfig/util"

                    local root_files = {
                        "settings.gradle", -- Gradle (multi-project)
                        "settings.gradle.kts", -- Gradle (multi-project)
                        "build.xml", -- Ant
                        "pom.xml", -- Maven
                    }

                    local fallback_root_files = {
                        "build.gradle", -- Gradle
                        "build.gradle.kts", -- Gradle
                    }
                    return util.root_pattern(unpack(root_files))(fname) or util.root_pattern(unpack(fallback_root_files))(fname)
                end,
            },
        },
    },
    lua = {
        formatter = {
            exe = "stylua",
            args = {},
        },
        linters = { "luacheck" },
        lsp = {
            provider = "sumneko_lua",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server",
                    "-E",
                    DATA_PATH .. "/lspinstall/lua/main.lua",
                },
                on_attach = common_on_attach,
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT",
                            -- Setup your lua path
                            path = vim.split(package.path, ";"),
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim", "lvim" },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = {
                                [vim.fn.expand "~/.config/nvim/lua"] = true,
                                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                            },
                            maxPreload = 100000,
                            preloadFileSize = 1000,
                        },
                    },
                },
            },
        },
    },
    nginx = {
        formatter = {
            exe = "nginx_beautifier",
            args = {
                provider = "",
                setup = {},
            },
        },
        linters = {},
        lsp = {},
    },
    perl = {
        formatter = {
            exe = "perltidy",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "",
            setup = {},
        },
    },
    sql = {
        formatter = {
            exe = "sqlformat",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "sqls",
            setup = {
                cmd = { "sqls" },
            },
        },
    },
    php = {
        formatter = {
            exe = "phpcbf",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "intelephense",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense",
                    "--stdio",
                },
                on_attach = common_on_attach,
                filetypes = { "php", "phtml" },
                settings = {
                    intelephense = {
                        environment = {
                            phpVersion = "7.4",
                        },
                    },
                },
            },
        },
    },
    puppet = {
        formatter = {
            exe = "",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "puppet",
            setup = {
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    javascript = {
        -- @usage can be prettier or eslint
        formatter = {
            exe = "prettier",
            args = {},
        },
        linters = {
            "eslint",
        },
        lsp = {
            provider = "tsserver",
            setup = {
                cmd = {
                    -- TODO:
                    DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    javascriptreact = {
        -- @usage can be prettier or eslint
        formatter = {
            exe = "prettier",
            args = {},
        },
        linters = {
            "eslint",
        },
        lsp = {
            provider = "tsserver",
            setup = {
                cmd = {
                    -- TODO:
                    DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    python = {
        -- @usage can be flake8 or yapf
        formatter = {
            exe = "black",
            args = {},
        },
        linters = {
            "flake8",
            "pylint",
            "mypy",
        },
        lsp = {
            provider = "pyright",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    -- R -e 'install.packages("formatR",repos = "http://cran.us.r-project.org")'
    -- R -e 'install.packages("readr",repos = "http://cran.us.r-project.org")'
    r = {
        formatter = {
            exe = "format_r",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "r_language_server",
            setup = {
                cmd = {
                    "R",
                    "--slave",
                    "-e",
                    "languageserver::run()",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    ruby = {
        formatter = {
            exe = "rufo",
            args = {},
        },
        linters = { "ruby" },
        lsp = {
            provider = "solargraph",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/ruby/solargraph/solargraph",
                    "stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    rust = {
        formatter = {
            exe = "rustfmt",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "rust_analyzer",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/rust/rust-analyzer",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    scala = {
        formatter = {
            exe = "scalafmt",
            args = {},
        },
        linters = { "" },
        lsp = {
            provider = "metals",
            setup = {
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    sh = {
        -- @usage can be 'shfmt'
        formatter = {
            exe = "shfmt",
            args = {},
        },
        -- @usage can be 'shellcheck'
        linters = { "shellcheck" },
        lsp = {
            provider = "bashls",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server",
                    "start",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    svelte = {
        formatter = {
            exe = "",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "svelte",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/svelte/node_modules/.bin/svelteserver",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    swift = {
        formatter = {
            exe = "swiftformat",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "sourcekit",
            setup = {
                cmd = {
                    "xcrun",
                    "sourcekit-lsp",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    tailwindcss = {
        active = false,
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
    terraform = {
        formatter = {
            exe = "terraform_fmt",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "terraformls",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/terraform/terraform-ls",
                    "serve",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    tex = {
        formatter = {
            exe = "latexindent",
            args = {},
            stdin = false,
        },
        linters = { "chktex" },
        lsp = {
            provider = "texlab",
            setup = {
                cmd = { DATA_PATH .. "/lspinstall/latex/texlab" },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    typescript = {
        -- @usage can be prettier or eslint
        formatter = {
            exe = "prettier",
            args = {},
        },
        linters = {
            "eslint",
        },
        lsp = {
            provider = "tsserver",
            setup = {
                cmd = {
                    -- TODO:
                    DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    typescriptreact = {
        -- @usage can be prettier or eslint
        formatter = {
            exe = "prettier",
            args = {},
        },
        linters = {
            "eslint",
        },
        lsp = {
            provider = "tsserver",
            setup = {
                cmd = {
                    -- TODO:
                    DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    vim = {
        formatter = {
            exe = "",
            args = {},
        },
        linters = { "" },
        lsp = {
            provider = "vimls",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/vim/node_modules/.bin/vim-language-server",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    vue = {
        formatter = {
            exe = "prettier",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "vuels",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/vue/node_modules/.bin/vls",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    yaml = {
        formatter = {
            exe = "prettier",
            args = {},
        },
        linters = {},
        lsp = {
            provider = "yamlls",
            setup = {
                cmd = {
                    DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server",
                    "--stdio",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
    zig = {
        formatter = {
            exe = "",
            args = {},
            stdin = false,
        },
        linters = {},
        lsp = {
            provider = "zls",
            setup = {
                cmd = {
                    "zls",
                },
                on_attach = common_on_attach,
                capabilities = common_capabilities,
            },
        },
    },
}

require("core.which-key").config()
require "core.status_colors"
require("core.gitsigns").config()
require("core.compe").config()
require("core.dashboard").config()
require("core.dap").config()
require("core.terminal").config()
require("core.telescope").config()
require("core.treesitter").config()
require("core.nvimtree").config()
