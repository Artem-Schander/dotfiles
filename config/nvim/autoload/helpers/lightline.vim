function! helpers#lightline#fileName() abort
    let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
    if filename =~ 'NERD_tree'
        return ''
    endif
    let modified = &modified ? ' +' : ''
    return fnamemodify(filename, ":~:.") . modified
endfunction

function! helpers#lightline#fileEncoding()
    " only show the file encoding if it's not 'utf-8'
    return &fileencoding == 'utf-8' ? '' : &fileencoding
endfunction

function! helpers#lightline#fileFormat()
    " only show the file format if it's not 'unix'
    let format = &fileformat == 'unix' ? '' : &fileformat
    return winwidth(0) > 70 ? format . ' ' . WebDevIconsGetFileFormatSymbol() . ' ' : ''
endfunction

function! helpers#lightline#fileType()
    return (exists('*WebDevIconsGetFileTypeSymbol') ? WebDevIconsGetFileTypeSymbol() : &filetype)
endfunction

function! helpers#lightline#whitespace()
    " try
        let mixedindent = helpers#whitespace#DetectMixedIndent()
        let trailingspaces = helpers#whitespace#DetectTrailingSpaces()
        " return (trailingspaces == '[\s]' ? 'trailing spaces' : '')
        return mixedindent . trailingspaces
    " catch
    " endtry
endfunction

function! helpers#lightline#gitBranch()
    " TODO: check if current projet is a git repo
    return "\uF402" . (exists('*FugitiveHead') ? ' ' . FugitiveHead() : '')
endfunction

function! helpers#lightline#currentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! helpers#lightline#gitBlame()
    return winwidth(0) > 100 ? strpart(substitute(get(b:, 'coc_git_blame', ''), '[\(\)]', '', 'g'), 0, 50) : ''
    " return winwidth(0) > 100 ? strpart(get(b:, 'coc_git_blame', ''), 0, 20) : ''
endfunction
