function! helpers#startify#listcommits()
    let git = 'git -C ' . getcwd()
    let commits = systemlist(git . ' log --oneline | head -n5')
    let git = 'G' . git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

function! helpers#startify#listsessions()
    let filedir = expand('%:p:h')[strlen($HOME):]
    let project = getcwd()[strlen($HOME):]

    if (filedir != project)
        let files = reverse(startify#session_list(split(filedir, "/")[-1]))
            \ + startify#session_list(split(project, "/")[-1])
    else
        let files = reverse(startify#session_list(split(project, "/")[-1]))
    endif

    let sessions = []
    for file in files
        let sessions = add(sessions, { "line": join(split(file, "%"), "/")[strlen($HOME):][:-5], "cmd": ":SLoad " . file })
    endfor

    return sessions

endfunction
