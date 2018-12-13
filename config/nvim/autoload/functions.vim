" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! functions#WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" smart tab completion
function! functions#Smart_TabComplete()
    let line = getline('.')                         " current line

    let substr = strpart(line, -1, col('.')+1)      " from the start of the current
    " line to one character right
    " of the cursor
    let substr = matchstr(substr, '[^ \t]*$')       " word till cursor
    if (strlen(substr)==0)                          " nothing to match on empty string
        return '\<tab>'
    endif
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (!has_period && !has_slash)
        return '\<C-X>\<C-P>'                         " existing text matching
    elseif ( has_slash )
        return '\<C-X>\<C-F>'                         " file matching
    else
        return '\<C-X>\<C-O>'                         " plugin matching
    endif
endfunction

" execute a custom command
function! functions#RunCustomCommand()
    up
    if g:silent_custom_command
        execute 'silent !' . s:customcommand
    else
        execute '!' . s:customcommand
    endif
endfunction

function! functions#SetCustomCommand()
    let s:customcommand = input('Enter Custom Command$ ')
endfunction

function! functions#TrimWhiteSpace()
    %s/\s\+$//e
endfunction

function! functions#HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction


" delete the current buffer
function! functions#Delete(...)
    if (exists('a:1'))
        let file=a:1
    elseif ( &ft == 'help' )
        echohl Error
        echo "Cannod delete a help buffer!"
        echohl None
        return -1
    else
        let file=expand('%:p')
    endif
    let status=delete(file)
    if (status == 0)
        echo "Deleted " . file
    else
        echohl WarningMsg
        echo "Failed to delete " . file
        echohl None
    endif
    return status
endfunction

function! functions#Expander()
    let line   = getline(".")
    let col    = col(".")
    let first  = line[col-2]
    let second = line[col-1]
    let third  = line[col]

    if first ==# ">"
        if second ==# "<" && third ==# "/"
            return "\<CR>\<C-o>==\<C-o>O"
        else
            return "\<CR>"
        endif
    else
        return "\<CR>"
    endif
endfunction

function! functions#BufOnly(buffer, bang)
    if a:buffer == ''
        " No buffer provided, use the current buffer.
        let buffer = bufnr('%')
    elseif (a:buffer + 0) > 0
        " A buffer number was provided.
        let buffer = bufnr(a:buffer + 0)
    else
        " A buffer name was provided.
        let buffer = bufnr(a:buffer)
    endif

    if buffer == -1
        echohl ErrorMsg
        echomsg "No matching buffer for" a:buffer
        echohl None
        return
    endif

    let last_buffer = bufnr('$')

    let delete_count = 0
    let n = 1
    while n <= last_buffer
        if n != buffer && buflisted(n)
            if a:bang == '' && getbufvar(n, '&modified')
                echohl ErrorMsg
                echomsg 'No write since last change for buffer'
                            \ n '(add ! to override)'
                echohl None
            else
                silent exe 'bdel' . a:bang . ' ' . n
                if ! buflisted(n)
                    let delete_count = delete_count+1
                endif
            endif
        endif
        let n = n+1
    endwhile

    if delete_count == 1
        echomsg delete_count "buffer deleted"
    elseif delete_count > 1
        echomsg delete_count "buffers deleted"
    endif

endfunction

" function! functions#ShowSpaces(...)
"     let @/='\v(\s+$)|( +\ze\t)'
"     let oldhlsearch=&hlsearch
"     if !a:0
"         let &hlsearch=!&hlsearch
"     else
"         let &hlsearch=a:1
"     end
"     return oldhlsearch
" endfunction

" function! functions#TrimSpaces() range
"   let oldhlsearch=functions#ShowSpaces(1)
"   execute a:firstline.",".a:lastline."substitute ///gec"
"   let &hlsearch=oldhlsearch
" endfunction

function! functions#DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction
