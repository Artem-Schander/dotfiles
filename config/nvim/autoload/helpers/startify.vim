function! helpers#startify#listcommits()
    let git_dir = substitute(system("git rev-parse --show-toplevel 2>&1 | grep -v fatal:"),'\n','','g')
    if  git_dir != '' && isdirectory(git_dir) && index(split(&path, ","), git_dir) < 0
        let git = 'git -C ' . getcwd()
        let commits = systemlist(git . ' log --oneline | head -n5')
        let git = 'G' . git[1:]
        return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
    endif
endfunction

function! helpers#startify#listprosessions()
    let sessions = []

    let local_session_dir = get(g:, 'prosession_dir')
    if local_session_dir != '0' && isdirectory(local_session_dir) && strlen(getcwd()) > strlen($HOME)
        let lead = "%" . join(split(getcwd(), "/"), "%")
        let files = map(split(globpath(local_session_dir, lead.'*'), '\n'), 'fnamemodify(v:val, ":t")')

        for session in reverse(files)
            let path = join(split(session, "%"), "/")
            if path[strlen(path)-3:] == 'vim' && isdirectory("/" . path[:-5]) == 1
                let sessions = add(sessions, { "line": "~/" . path[strlen($HOME):][:-5], "cmd": ":Prosession /" . path[:-5] })
            endif
        endfor
    endif
    return sessions
endfunction

function! helpers#startify#listsessions()
    let sessions = []

    let global_session_dir = get(g:, 'startify_session_dir')
    if global_session_dir != '0' && isdirectory(expand(global_session_dir))
        for session in reverse(startify#session_list('*'))
            let path_list = split(session, "%")
            if session != 'last_session.vim' && session[strlen(session)-3:] == 'vim' && isdirectory("/" . split(session, "%")[0]) == 0
                " let sessions = add(sessions, { "line": join(split(session, "%"), "/")[strlen($HOME):][:-5], "cmd": ":SLoad " . session })
                let sessions = add(sessions, { "line": join(split(session, "%"), "/")[:-5], "cmd": ":SLoad " . session })
            endif
        endfor
    endif
    return sessions
endfunction

function! helpers#startify#listallsessions()
    let sessions = []
    for session in helpers#startify#listprosessions()
        let session.line = "\uf07b " . session.line
        let session = add(sessions, session)
    endfor
    for session in helpers#startify#listsessions()
        let session.line = "\uf484 " . session.line
        let session = add(sessions, session)
    endfor
    return sessions
endfunction

function! helpers#startify#startsession()
    let sessions = []

    let local_session_dir = get(g:, 'prosession_dir')
    if local_session_dir != '0' && isdirectory(local_session_dir) && strlen(getcwd()) > strlen($HOME)
        let s:dir = local_session_dir[strlen(local_session_dir)-1:] != '/' ? expand(local_session_dir) . '/' : expand(local_session_dir)
        let s:name = "~" . getcwd()[strlen($HOME):]
        let s:filename = "%" . join(split(getcwd(), "/"), "%") . ".vim"
        if filereadable(s:dir . s:filename) == 0
            let s:filename = "\\%" . join(split(getcwd(), "/"), "\\%") . ".vim"
            let sessions = add(sessions, { "line": "\uf07b " . s:name, "cmd": ":silent Obsession " . s:dir . s:filename . " | :enew" })
        endif
    endif

    let global_session_dir = get(g:, 'startify_session_dir')
    if global_session_dir != '0' && isdirectory(expand(global_session_dir))
        let s:dir = global_session_dir[strlen(global_session_dir)-1:] != '/' ? expand(global_session_dir) . '/' : expand(global_session_dir)
        let s:name = split(getcwd(), "/")[-1]
        let s:filename = s:name . ".vim"
        if filereadable(s:dir . s:filename) == 0
            let sessions = add(sessions, { "line": "\uf484 " . s:name, "cmd": ":silent SSave " . s:filename . " | :enew" })
        endif
    endif

    return sessions
endfunction

function! helpers#startify#stopsession()
    let prosession = get(g:, 'this_obsession')
    if prosession != '0'
        unlet g:this_obsession
    endif
    execute 'SClose'
endfunction

function! helpers#startify#deletesession()
    let prosession = get(g:, 'this_obsession')
    if prosession != '0'
        unlet g:this_obsession
    endif
    execute 'SDelete'
endfunction

function! helpers#startify#header()
    " TODO
    " generate dynamic header by projet path

    let folder = "in ~/" . getcwd()[strlen($HOME)+1:]
    if strlen(getcwd()) < strlen($HOME)
        let folder = "in " . getcwd()
    endif

    if winwidth('%') > 67
        let header = [
        \ '   ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
        \ '   ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
        \ '   ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
        \ '   ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
        \ '   ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
        \ '   ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
        \ '   ' . folder,
        \ ]
    elseif winwidth('%') > 35
        " http://patorjk.com/software/taag/#p=display&f=Calvin%20S&t=BE%20AWESOME
        let header = [
        \ '   ┏┓ ┏━╸  ┏━┓╻ ╻┏━╸╔═╗┏━┓┏┳┓┏━╸ ',
        \ '   ┣┻┓┣╸   ┣━┫┃╻┃┣╸ ╚═╗┃ ┃┃┃┃┣╸  ',
        \ '   ┗━┛┗━╸  ╹ ╹┗┻┛┗━╸╚═╝┗━┛╹ ╹┗━╸ ',
        \ '   ' . folder,
        \ ]
    else
        let header = ''
    endif

    return header

    " let longest_line = max(map(copy(header), 'strwidth(v:val)'))
    " return map(copy(header), 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
endfunction
