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
    let session_dir = get(g:, 'prosession_dir')
    if session_dir != '0' && isdirectory(session_dir) && strlen(getcwd()) > strlen($HOME)
        let lead = "%" . join(split(getcwd(), "/"), "%")
        let files = map(split(globpath(session_dir, lead.'*'), '\n'), 'fnamemodify(v:val, ":t")')

        let sessions = []
        for session in reverse(files)
            let path = join(split(session, "%"), "/")
            if path[strlen(path)-3:] == 'vim'
                let sessions = add(sessions, { "line": "~/" . path[strlen($HOME):][:-5], "cmd": ":Prosession /" . path[:-5] })
            endif
        endfor
        return sessions
    endif
endfunction

function! helpers#startify#startsession()
    let sessions = []

    let session_dir = get(g:, 'prosession_dir')
    if session_dir != '0' && isdirectory(session_dir) && strlen(getcwd()) > strlen($HOME)
        let local_session_name = "~" . getcwd()[strlen($HOME):]
        let local_session_file_name = "\\%" . join(split(getcwd(), "/"), "\\%") . ".vim"

        let filename = "%" . join(split(getcwd(), "/"), "%") . ".vim"
        let files = split(globpath(session_dir, filename), '\n')

        if len(files) == 0
            let sessions = add(sessions, { "line": "\uf07b " . local_session_name, "cmd": ":silent Obsession " . session_dir . local_session_file_name . " | :enew" })
        endif
    endif

    let global_session_name = split(getcwd(), "/")[-1]
    let global_session_file_name = global_session_name . ".vim"

    let existing_global_sessions = startify#session_list(global_session_file_name)
    if len(existing_global_sessions) == 0
        let sessions = add(sessions, { "line": "\uf484 " . global_session_name, "cmd": ":silent SSave " . global_session_file_name . " | :enew" })
    endif

    return sessions
endfunction

function! helpers#startify#listsessions()
    let sessions = []
    for session in reverse(startify#session_list('*'))
        let path = join(split(session, "%"), "/")
        let beginning = path[:strlen($HOME)-2]
        if path[strlen(path)-3:] == 'vim' && beginning != $HOME[1:]
            " let sessions = add(sessions, { "line": join(split(session, "%"), "/")[strlen($HOME):][:-5], "cmd": ":SLoad " . session })
            let sessions = add(sessions, { "line": join(split(session, "%"), "/")[:-5], "cmd": ":SLoad " . session })
        endif
    endfor
    return sessions
endfunction

function! helpers#startify#header()
    " TODO
    " generate dynamic header by projet path

    let folder = "in ~/" . getcwd()[strlen($HOME)+1:]
    if strlen(getcwd()) < strlen($HOME)
        let folder = "in " . getcwd()
    endif

    if winwidth('%') > 125
        " toilet -f future -t 'with great power comes great responsibility'
        let header = [
        \ '   ╻ ╻╻╺┳╸╻ ╻  ┏━╸┏━┓┏━╸┏━┓╺┳╸  ┏━┓┏━┓╻ ╻┏━╸┏━┓  ┏━╸┏━┓┏┳┓┏━╸┏━┓  ┏━╸┏━┓┏━╸┏━┓╺┳╸  ┏━┓┏━╸┏━┓┏━┓┏━┓┏┓╻┏━┓╻┏┓ ╻╻  ╻╺┳╸╻ ╻ ',
        \ '   ┃╻┃┃ ┃ ┣━┫  ┃╺┓┣┳┛┣╸ ┣━┫ ┃   ┣━┛┃ ┃┃╻┃┣╸ ┣┳┛  ┃  ┃ ┃┃┃┃┣╸ ┗━┓  ┃╺┓┣┳┛┣╸ ┣━┫ ┃   ┣┳┛┣╸ ┗━┓┣━┛┃ ┃┃┗┫┗━┓┃┣┻┓┃┃  ┃ ┃ ┗┳┛ ',
        \ '   ┗┻┛╹ ╹ ╹ ╹  ┗━┛╹┗╸┗━╸╹ ╹ ╹   ╹  ┗━┛┗┻┛┗━╸╹┗╸  ┗━╸┗━┛╹ ╹┗━╸┗━┛  ┗━┛╹┗╸┗━╸╹ ╹ ╹   ╹┗╸┗━╸┗━┛╹  ┗━┛╹ ╹┗━┛╹┗━┛╹┗━╸╹ ╹  ╹  ',
        \ '   ' . folder,
        \ ]
    elseif winwidth('%') > 67
        " let header = [
        " \ '   ╻ ╻╻╺┳╸╻ ╻  ┏━╸┏━┓┏━╸┏━┓╺┳╸  ┏━┓┏━┓╻ ╻┏━╸┏━┓  ┏━╸┏━┓┏┳┓┏━╸┏━┓ ',
        " \ '   ┃╻┃┃ ┃ ┣━┫  ┃╺┓┣┳┛┣╸ ┣━┫ ┃   ┣━┛┃ ┃┃╻┃┣╸ ┣┳┛  ┃  ┃ ┃┃┃┃┣╸ ┗━┓ ',
        " \ '   ┗┻┛╹ ╹ ╹ ╹  ┗━┛╹┗╸┗━╸╹ ╹ ╹   ╹  ┗━┛┗┻┛┗━╸╹┗╸  ┗━╸┗━┛╹ ╹┗━╸┗━┛ ',
        " \ '   ┏━╸┏━┓┏━╸┏━┓╺┳╸  ┏━┓┏━╸┏━┓┏━┓┏━┓┏┓╻┏━┓╻┏┓ ╻╻  ╻╺┳╸╻ ╻         ',
        " \ '   ┃╺┓┣┳┛┣╸ ┣━┫ ┃   ┣┳┛┣╸ ┗━┓┣━┛┃ ┃┃┗┫┗━┓┃┣┻┓┃┃  ┃ ┃ ┗┳┛         ',
        " \ '   ┗━┛╹┗╸┗━╸╹ ╹ ╹   ╹┗╸┗━╸┗━┛╹  ┗━┛╹ ╹┗━┛╹┗━┛╹┗━╸╹ ╹  ╹          ',
        " \ '   ' . folder,
        " \ ]
        " http://patorjk.com/software/taag/#p=display&f=Calvin%20S&t=WITH%20GREAT%20POWER%20COMES%20GREAT%20RESPONSIBILITY%0A
        let header = [
        \ '   ╦ ╦╦╔╦╗╦ ╦  ╔═╗╦═╗╔═╗╔═╗╔╦╗  ╔═╗╔═╗╦ ╦╔═╗╦═╗  ╔═╗╔═╗╔╦╗╔═╗╔═╗ ',
        \ '   ║║║║ ║ ╠═╣  ║ ╦╠╦╝║╣ ╠═╣ ║   ╠═╝║ ║║║║║╣ ╠╦╝  ║  ║ ║║║║║╣ ╚═╗ ',
        \ '   ╚╩╝╩ ╩ ╩ ╩  ╚═╝╩╚═╚═╝╩ ╩ ╩   ╩  ╚═╝╚╩╝╚═╝╩╚═  ╚═╝╚═╝╩ ╩╚═╝╚═╝ ',
        \ '   ╔═╗╦═╗╔═╗╔═╗╔╦╗  ╦═╗╔═╗╔═╗╔═╗╔═╗╔╗╔╔═╗╦╔╗ ╦╦  ╦╔╦╗╦ ╦         ',
        \ '   ║ ╦╠╦╝║╣ ╠═╣ ║   ╠╦╝║╣ ╚═╗╠═╝║ ║║║║╚═╗║╠╩╗║║  ║ ║ ╚╦╝         ',
        \ '   ╚═╝╩╚═╚═╝╩ ╩ ╩   ╩╚═╚═╝╚═╝╩  ╚═╝╝╚╝╚═╝╩╚═╝╩╩═╝╩ ╩  ╩          ',
        \ '   ' . folder,
        \ ]
    elseif winwidth('%') > 35
        " http://patorjk.com/software/taag/#p=display&f=Calvin%20S&t=BE%20AWESOME
        let header = [
        \ '   ╔╗ ╔═╗  ╔═╗╦ ╦╔═╗╔═╗╔═╗╔╦╗╔═╗ ',
        \ '   ╠╩╗║╣   ╠═╣║║║║╣ ╚═╗║ ║║║║║╣  ',
        \ '   ╚═╝╚═╝  ╩ ╩╚╩╝╚═╝╚═╝╚═╝╩ ╩╚═╝ ',
        \ '   ' . folder,
        \ ]
    else
        let header = ''
    endif

    return header

    " let longest_line = max(map(copy(header), 'strwidth(v:val)'))
    " return map(copy(header), 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
endfunction
