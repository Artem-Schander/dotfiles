require('nvim-treesitter.configs').setup {
    ensure_installed = globals.treesitter.ensure_installed, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = globals.treesitter.ignore_install,
    highlight = {
        enable = globals.treesitter.highlight.enabled -- false will disable the whole extension
    },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    -- TODO seems to be broken
    indent = {enable = {"javascriptreact"}},
    autotag = {enable = true},
}
