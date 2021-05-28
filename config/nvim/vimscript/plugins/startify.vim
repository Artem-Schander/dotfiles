" Don't change to directory when selecting a file
let g:startify_change_to_dir = 0
let g:startify_files_number = 5
let g:startify_custom_header = helpers#startify#header()
let g:startify_relative_path = 1
let g:startify_use_env = 1
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_autoload = 0
let g:startify_session_persistence = 0

" \ { 'type': function('helpers#startify#listprosessions'), 'header': [ 'Location Related Sessions' ] },
" \ { 'type': function('helpers#startify#listsessions'), 'header': [ 'Global Sessions' ] },
" \ { 'type': function('helpers#startify#listcommits'), 'header': [ 'Recent Commits' ] },
let g:startify_lists = [
    \ { 'type': function('helpers#startify#listallsessions'), 'header': [ 'Sessions' ] },
    \ { 'type': function('helpers#startify#startsession'), 'header': [ 'New Session' ] },
    \ { 'type': 'dir', 'header': [ 'Files '. getcwd() ] },
    \ { 'type': 'bookmarks', 'header': [ 'Bookmarks' ] },
    \ { 'type': 'commands', 'header': [ 'Commands' ] },
\ ]

let g:startify_commands = [
    \ { 'a': [ 'Find File', ':Telescope find_files' ] },
    \ { 'p': [ 'Find File In Project', ':Telescope git_files' ] },
    \ { 'f': [ 'Find Word In File', ':Telescope live_grep' ] },
    \ { 'gs': [ 'Git Status', ':Telescope git_status' ] },
    \ { 'gc': [ 'Checkout Commit', ':Telescope git_commits' ] },
    \ { 'gb': [ 'Checkout Branch', ':Telescope git_branches' ] },
    \ { 'up': [ 'Update Plugins', ':PackerSync' ] },
\ ]

let g:startify_bookmarks = [
    \ { 's': '~/.config/nvim/settings.lua' },
    \ { 'g': '~/.gitconfig' },
    \ { 'z': '~/.zshrc' }
\ ]

autocmd User Startified setlocal cursorline

cabbrev SClose call helpers#startify#stopsession()
cabbrev SDelete call helpers#startify#deletesession()

nmap <leader>q :SClose<cr>
