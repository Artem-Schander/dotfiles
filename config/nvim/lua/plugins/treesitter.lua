require('nvim-treesitter.configs').setup {
    ensure_installed = globals.treesitter.ensure_installed, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = globals.treesitter.ignore_install,
    highlight = {
        enable = globals.treesitter.highlight.enabled -- false will disable the whole extension
    },
    -- TODO seems to be broken
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    -- indent = {enable = {"javascriptreact"}},
    indent = {enable = true},
    autotag = {enable = true},
}

require "nvim-treesitter.configs".setup {
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    }
}

vim.cmd [[
    command! TSHighlightCapturesUnderCursor :lua require'nvim-treesitter-playground.hl-info'.show_hl_captures()<cr>
]]

