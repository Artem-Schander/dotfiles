local M = {}

M.config = function()
    -- require("indent_blankline").setup {
    --     enabled = true,
    --     char = '│', -- '|', '¦', '┆', '┊', '│'
    --     show_end_of_line = false,
    --     space_char_blankline = " ",
    --     show_current_context = true
    -- }
    -- vim.g.indent_blankline_enabled = true
    vim.g.indent_blankline_char = '│' -- '|', '¦', '┆', '┊', '│'
    vim.g.indent_blankline_filetype_exclude = {
        'help',
        'packer',
        'gitcommit',
        'help',
        'coc-explorer',
        'startify',
        'NvimTree',
        'TelescopePrompt'
    }
    vim.g.indent_blankline_buftype_exclude = {
        'terminal'
    }
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
end

return M