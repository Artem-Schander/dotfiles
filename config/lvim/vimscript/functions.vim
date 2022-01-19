function! functions#ToggleNumberDisplay()
    if &rnu == 1
        set nu nornu
    else
        set nu rnu
    endif
endfunction
command! ToggleRelativeLineNumbers call functions#ToggleNumberDisplay()

" delete all empty buffers
function! functions#DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete!' join(empty)
    endif
endfunction
command! Bcleanup call functions#DeleteEmptyBuffers()

" Deal with other peoples code
function! functions#FixIndentation(...)
    let type = a:1
    if type == 'tabs'
        set noet
    elseif type == 'spaces'
        set et
    endif
    if (exists('a:2'))
        let chars = a:2
        exe 'set ts='.chars.' sts='.chars.' sw='.chars
    endif
    exe '%retab!'
endfunction
command! -nargs=? Tabs call functions#FixIndentation('tabs', <args>)
command! -nargs=? Spaces call functions#FixIndentation('spaces', <args>)
" -- vim.api.nvim_set_keymap('n', '\\t', ':set ts=4 sts=4 sw=4 noet<cr>', {noremap = true, silent = true})
" -- vim.api.nvim_set_keymap('n', '\\s', ':set ts=4 sts=4 sw=4 et<cr>', {noremap = true, silent = true})
