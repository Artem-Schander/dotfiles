vim.g.indent_blankline_char = '│' -- '|', '¦', '┆', '┊', '│'
vim.g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer'}
vim.g.indent_blankline_space_char = ' '
vim.g.indent_blankline_space_char_blankline = ' '
-- vim.g.indent_blankline_show_end_of_line = true
vim.g.indent_blankline_show_first_indent_level = false

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
