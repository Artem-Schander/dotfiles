function! helpers#startify#listcommits()
    let git = 'git -C ' . getcwd()
    let commits = systemlist(git . ' log --oneline | head -n5')
    let git = 'G' . git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

function! helpers#startify#listsessions()
    let sessions = []
    for session in reverse(startify#session_list(join(split(getcwd(), "/"), "%")))
        let sessions = add(sessions, { "line": join(split(session, "%"), "/")[strlen($HOME):][:-5], "cmd": ":SLoad " . session })
    endfor
    return sessions
endfunction
