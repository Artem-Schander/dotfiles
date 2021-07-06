local M = {}

M.config = function()
    vim.g.indentLine_enabled = 1
    vim.g.indent_blankline_char = '│' -- '|', '¦', '┆', '┊', '│'
    vim.g.indent_blankline_filetype_exclude = {
        'help',
        'startify',
        'dashboard',
        'packer'
    }
    vim.g.indent_blankline_buftype_exclude = {
        'terminal'
    }
    vim.g.indent_blankline_space_char = ' '
    vim.g.indent_blankline_space_char_blankline = ' '
    -- vim.g.indent_blankline_show_end_of_line = true
    vim.g.indent_blankline_show_first_indent_level = true

    vim.g.indent_blankline_use_treesitter = true
    vim.g.indent_blankline_show_current_context = true
    vim.g.indent_blankline_context_patterns = {
        'class',
        'function',
        'method',
        '^if',
        '^while',
        '^for',
        '^object',
        '^table',
        'block',
        'arguments',
        'array',
        '^switch',
        'case',
    }
    vim.g.indent_blankline_show_trailing_blankline_indent = false

    vim.cmd('highlight IndentBlanklineChar guifg=' .. Globals.colors.bg0 .. ' guibg=NONE')
    vim.cmd('highlight IndentBlanklineContextChar guifg=' .. Globals.colors.bg3 .. ' guibg=NONE')
end

return M
