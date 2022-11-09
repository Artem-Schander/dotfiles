function! Listcommits()
    let git_dir = substitute(system("git rev-parse --show-toplevel 2>&1 | grep -v fatal:"),'\n','','g')
    if  git_dir != '' && isdirectory(git_dir) && index(split(&path, ","), git_dir) < 0
        let git = 'git -C ' . getcwd()
        let commits = systemlist(git . ' log --oneline | head -n5')
        let git = 'G' . git[1:]
        return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
    endif
endfunction

function! Listprosessions()
    let sessions = []

    let local_session_dir = get(g:, 'prosession_dir')
    if local_session_dir != '0' && isdirectory(local_session_dir) && strlen(getcwd()) > strlen($HOME)
        let lead = "%" . join(split(getcwd(), "/"), "%")
        if exists(":Rooter")
            let root_lead = "%" . join(split(FindRootDirectory(), "/"), "%")
            if (lead != root_lead)
                let files = map(split(globpath(local_session_dir, root_lead.'.vim'), '\n'), 'fnamemodify(v:val, ":t")')
                if len(files) >= 1
                    let path = join(split(files[0], "%"), "/")
                    let sessions = add(sessions, { "line": "~/" . path[strlen($HOME):][:-5], "cmd": ":Prosession /" . path[:-5] . " | :LspStart" })
                endif
            endif
        endif
        let files = map(split(globpath(local_session_dir, lead.'*'), '\n'), 'fnamemodify(v:val, ":t")')

        for session in reverse(files)
            let path = join(split(session, "%"), "/")

            if path[strlen(path)-3:] == 'vim' && isdirectory("/" . path[:-5]) == 1
                let sessions = add(sessions, { "line": "~/" . path[strlen($HOME):][:-5], "cmd": ":Prosession /" . path[:-5] . " | :LspStart" })
            endif
        endfor
    endif
    return sessions
endfunction

function! Listsessions()
    let sessions = []

    let global_session_dir = get(g:, 'startify_session_dir')
    if global_session_dir != '0' && isdirectory(expand(global_session_dir))
        for session in reverse(startify#session_list('*'))
            let path_list = split(session, "%")
            if session != 'last_session.vim' && session[strlen(session)-3:] == 'vim' && isdirectory("/" . split(session, "%")[0]) == 0
                " let sessions = add(sessions, { "line": join(split(session, "%"), "/")[strlen($HOME):][:-5], "cmd": ":SLoad " . session })
                let sessions = add(sessions, { "line": join(split(session, "%"), "/")[:-5], "cmd": ":SLoad " . session . " | :LspStart" })
            endif
        endfor
    endif
    return sessions
endfunction

function! Listallsessions()
    let sessions = []
    for session in Listprosessions()
        let session.line = "\uf07b " . session.line
        let session = add(sessions, session)
    endfor
    for session in Listsessions()
        let session.line = "\uf484 " . session.line
        let session = add(sessions, session)
    endfor
    return sessions
endfunction

function! Startsession()
    let sessions = []

    let local_session_dir = get(g:, 'prosession_dir')
    if local_session_dir != '0' && isdirectory(local_session_dir) && strlen(getcwd()) > strlen($HOME)
        let s:dir = local_session_dir[strlen(local_session_dir)-1:] != '/' ? expand(local_session_dir) . '/' : expand(local_session_dir)
        let s:name = "~" . getcwd()[strlen($HOME):]
        let s:filename = "%" . join(split(getcwd(), "/"), "%") . ".vim"
        if filereadable(s:dir . s:filename) == 0
            let s:filename = "\\%" . join(split(getcwd(), "/"), "\\%") . ".vim"
            let sessions = add(sessions, { "line": "\uf07b " . s:name, "cmd": ":silent Obsession " . s:dir . s:filename . " | :enew | :LspStart" })
        endif
    endif

    let global_session_dir = get(g:, 'startify_session_dir')
    if global_session_dir != '0' && isdirectory(expand(global_session_dir))
        let s:dir = global_session_dir[strlen(global_session_dir)-1:] != '/' ? expand(global_session_dir) . '/' : expand(global_session_dir)
        let s:name = split(getcwd(), "/")[-1]
        let s:filename = s:name . ".vim"
        if filereadable(s:dir . s:filename) == 0
            let sessions = add(sessions, { "line": "\uf484 " . s:name, "cmd": ":silent SSave " . s:filename . " | :enew | :LspStart" })
        endif
    endif

    return sessions
endfunction

function! Stopsession()
    let prosession = get(g:, 'this_obsession')
    if prosession != '0'
        unlet g:this_obsession
    endif
    execute 'SClose | LspStop'
endfunction

function! Deletesession()
    let prosession = get(g:, 'this_obsession')
    if prosession != '0'
        unlet g:this_obsession
    endif
    execute 'SDelete'
endfunction

function! UpdatePlugins()
    execute 'PackerCompile'
    execute 'PackerInstall'
    execute 'PackerSync'
endfunction

function! Header()
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
        \ '   ┏┓ ┏━╸  ┏━┓╻ ╻┏━╸┏━┓┏━┓┏┳┓┏━╸ ',
        \ '   ┣┻┓┣╸   ┣━┫┃╻┃┣╸ ┗━┓┃ ┃┃┃┃┣╸  ',
        \ '   ┗━┛┗━╸  ╹ ╹┗┻┛┗━╸┗━┛┗━┛╹ ╹┗━╸ ',
        \ '   ' . folder,
        \ ]
    else
        let header = ''
    endif

    return header

    " let longest_line = max(map(copy(header), 'strwidth(v:val)'))
    " return map(copy(header), 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
endfunction


" Don't change to directory when selecting a file
let g:startify_change_to_dir = 0
let g:startify_files_number = 5
let g:startify_custom_header = Header()
let g:startify_relative_path = 1
let g:startify_use_env = 1
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_autoload = 0
let g:startify_session_persistence = 0

" \ { 'type': function('Listprosessions'), 'header': [ 'Location Related Sessions' ] },
" \ { 'type': function('Listsessions'), 'header': [ 'Global Sessions' ] },
" \ { 'type': function('Listcommits'), 'header': [ 'Recent Commits' ] },
let g:startify_lists = [
    \ { 'type': function('Listallsessions'), 'header': [ 'Sessions' ] },
    \ { 'type': function('Startsession'), 'header': [ 'New Session' ] },
    \ { 'type': 'dir', 'header': [ 'Files '. getcwd() ] },
    \ { 'type': 'bookmarks', 'header': [ 'Bookmarks' ] },
    \ { 'type': 'commands', 'header': [ 'Commands' ] },
\ ]

" let g:startify_commands = [
"     \ { 'f': [ 'Find File In Project', ':Telescope find_files hidden=true' ] },
"     \ { 'a': [ 'Find File In Directory', ':Telescope find_files find_command=rg,--smart-case,--files,--follow,--no-ignore,--hidden' ] },
"     \ { 't': [ 'Find Text', ':Telescope live_grep' ] },
"     \ { 'gs': [ 'Git Status', ':Telescope git_status' ] },
"     \ { 'gc': [ 'Checkout Commit', ':Telescope git_commits' ] },
"     \ { 'gb': [ 'Checkout Branch', ':Telescope git_branches' ] },
"     \ { 'up': [ 'Update Plugins', ':call UpdatePlugins()' ] },
" \ ]

let g:startify_commands = [
    \ { 'f': [ 'Find File In Project', ':FzfLua files' ] },
    \ { 'a': [ 'Find File In Directory', ":lua require('fzf-lua').files({ fd_opts = '--color=never --type f --hidden --follow --no-ignore', rg_opts = '--color=never --files --hidden --follow --no-ignore' })" ] },
    \ { 't': [ 'Find Text', ':FzfLua grep_project' ] },
    \ { 'gs': [ 'Git Status', ':FzfLua git_status' ] },
    \ { 'gc': [ 'Checkout Commit', ':FzfLua git_commits' ] },
    \ { 'gb': [ 'Checkout Branch', ':FzfLua git_branches' ] },
    \ { 'up': [ 'Update Plugins', ':call UpdatePlugins()' ] },
\ ]

let g:startify_bookmarks = [
    \ { 's': '~/.config/nvim/config.lua' },
    \ { 'g': '~/.gitconfig' },
    \ { 'z': '~/.zshrc' }
\ ]

autocmd User Startified setlocal cursorline

cabbrev SClose call Stopsession()
cabbrev SDelete call Deletesession()
