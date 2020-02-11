"display a warning if &et is wrong, or we have mixed-indenting
" set statusline+=%#error#
" set statusline+=%{StatuslineTabWarning()}
" set statusline+=%*

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:mixed_indent_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! helpers#whitespace#DetectMixedIndent()
    if !exists("b:mixed_indent_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:mixed_indent_warning =  '[mixed-indent]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:mixed_indent_warning = '[&et]'
        else
            let b:mixed_indent_warning = ''
        endif
    endif
    return b:mixed_indent_warning
endfunction

" set statusline+=%{StatuslineTrailingSpaceWarning()}

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! helpers#whitespace#DetectTrailingSpaces()
    if !exists("b:trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:trailing_space_warning = '[\s]'
        else
            let b:trailing_space_warning = ''
        endif
    endif
    return b:trailing_space_warning
endfunction
