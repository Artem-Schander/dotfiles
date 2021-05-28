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
        exe 'set ts='.chars.' sts='.chars.' sw='.chars.' noet'
    endif
    exe '%retab!'
endfunction
command! -nargs=? Tabs call functions#FixIndentation('tabs', <args>)
command! -nargs=? Spaces call functions#FixIndentation('spaces', <args>)
" -- vim.api.nvim_set_keymap('n', '\\t', ':set ts=4 sts=4 sw=4 noet<cr>', {noremap = true, silent = true})
" -- vim.api.nvim_set_keymap('n', '\\s', ':set ts=4 sts=4 sw=4 et<cr>', {noremap = true, silent = true})

" Lsp
command! LspCodeAction lua require 'utils'.code_action()
command! LspDeclaration lua require 'utils'.declaration()
command! LspDefinition lua require 'utils'.definition()
command! LspDocumentSymbol lua require 'utils'.document_symbol()
command! LspFormatting lua require 'utils'.formatting()
command! LspFormattingSync lua require 'utils'.formatting_sync()
command! LspHover lua require 'utils'.hover()
command! LspImplementation lua require 'utils'.implementation()
command! LspRangeCodeAction lua require 'utils'.range_code_action()
command! LspRangeFormatting lua require 'utils'.range_formatting()
command! LspReferences lua require 'utils'.references()
command! LspRename lua require 'utils'.rename()
command! LspTypeDefinition lua require 'utils'.type_definition()
command! LspWorkspaceSymbol lua require 'utils'.workspace_symbol()
command! LspGotoNext lua require 'utils'.goto_next()
command! LspGotoPrev lua require 'utils'.goto_prev()
command! LspShowLineDiagnostics lua require 'utils'.show_line_diagnostics()
command! NextHunk lua require 'utils'.next_hunk()
command! PrevHunk lua require 'utils'.prev_hunk()
command! StageHunk lua require 'utils'.stage_hunk()
command! UndoStageHunk lua require 'utils'.undo_stage_hunk()
command! ResetHunk lua require 'utils'.reset_hunk()
command! ResetBuffer lua require 'utils'.reset_buffer()
command! PreviewHunk lua require 'utils'.preview_hunk()
command! BlameLine lua require 'utils'.blame_line()
command! W noa w

" Debugging
command! DebugToggleBreakpoint lua require'dap'.toggle_breakpoint()
command! DebugStart lua require'dap'.continue()
command! DebugContinue lua require'dap'.continue()
command! DebugStepOver lua require'dap'.step_over()
command! DebugStepOut lua require'dap'.step_out()
command! DebugStepInto lua require'dap'.step_into()
command! DebugToggleRepl lua require'dap'.repl.toggle()
command! DebugGetSession lua require'dap'.session()

" Available Debug Adapters:
"   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
" 
" Adapter configuration and installation instructions:
"   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
" 
" Debug Adapter protocol:
"   https://microsoft.github.io/debug-adapter-protocol/

" TODO Add full support later
" nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
" nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
" nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
" nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
" nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

autocmd! User GoyoEnter lua require('gitsigns').toggle_signs()
autocmd! User GoyoLeave lua require('gitsigns').toggle_signs()

autocmd User GoyoEnter set laststatus=0 
autocmd User GoyoLeave set laststatus=2

" autocmd! User GoyoEnter lua require('galaxyline').disable_galaxyline()
" autocmd! User GoyoLeave lua require('galaxyline').galaxyline_augroup()
