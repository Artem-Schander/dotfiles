nmap <C-space> :StripWhitespace<cr>
let g:strip_whitespace_on_save = 0
let g:better_whitespace_filetypes_blacklist = [
    \ 'help',
    \ 'pug',
    \ 'diff',
    \ 'gitcommit',
    \ 'unite',
    \ 'qf',
    \ 'help',
    \ 'markdown',
    \ 'coc-explorer',
    \ 'startify',
    \ 'TelescopePrompt'
\ ]
let g:show_spaces_that_precede_tabs = 1
let g:better_whitespace_skip_empty_lines = 0
