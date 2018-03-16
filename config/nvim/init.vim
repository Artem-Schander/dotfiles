"
" " ┏┓╻┏━┓╺┳╸┏━╸┏━┓   ┏━┓┏┓╻╺┳┓   ╺┳╸╻┏━┓┏━┓ " "
" " ┃┗┫┃ ┃ ┃ ┣╸ ┗━┓   ┣━┫┃┗┫ ┃┃    ┃ ┃┣━┛┗━┓ " "
" " ╹ ╹┗━┛ ╹ ┗━╸┗━┛   ╹ ╹╹ ╹╺┻┛    ╹ ╹╹  ┗━┛ " "
"
"   SEARCH AND MOVEMENTS
"
" " :344 " go to line number 344
" " ]} or [{ " go to the start and end of a code block
" " <leader><leader>f " find any letter, get them highlighted and move to the desired location --> easymotion/vim-easymotion
" " <C-f>f " search in multiple files (entire project). Results can be changed --> dyng/ctrlsf.vim
" " zt / zz / zb " top / center / bottom the line where the cursor is located
" " <leader>t " open and go to new tab
" " öä or äö " navigate through tabs
" " <leader>. " switch to the last used buffer
" " <leader>p " search file by name --> junegunn/fzf.vim
" " <leader>b " search file in open buffers --> junegunn/fzf.vim
" " <leader>r " search tag in current buffer --> junegunn/fzf.vim
" " <leader>k " toggle NERDTree --> scrooloose/nerdtree
" " <leader>y " reveal current file in NERDTree --> scrooloose/nerdtree
"
" " :!ctags -R --exclude=node_modules --exclude=dist " create a tags index --> ctags
" " <C-]> " (ctrl+alt+6) go to declaration of whatever is under the cursor --> ctags
"
"
"   EDIT / COPY & PASTE
"
" " <leader>ev " edit ~/.vimrc file instantly
" " yy " copy the whole line
" " p " (lowercase) paste below
" " P " (capital) paste above
" " C " (capital) change rest of line
" " gc " comment line or block out --> tpope/vim-commentary
" " ysiw " add surroundings --> tpope/vim-surround
" " S " add surroundings to selection in visual mode --> tpope/vim-surround
" " dst " delete surrounding tag --> tpope/vim-surround
" " cst " change surrounding tag --> tpope/vim-surround
" " <leader><f " format php file (psr-2) --> stephpy/vim-php-cs-fixer
" " crs " convert to snake_case --> tpope/vim-abolish
" " crc " convert to camelCase --> tpope/vim-abolish
" " cit " change in tag
" " cat " like ciw but takes the tag also
"
"
"   AUTOCOMPLETE / SNIPPETS / SYNTAX
"
" " <C-y><leader> " (ctrl+y ,) render emmet-string to html--> mattn/emmet-vim
" " <C-y>n " (ctrl+y n) go to next edit point --> mattn/emmet-vim
" " <C-o> or <C-i> " snippet - navigate between edit points
" " <C-w> E " toggle syntastic mode {passive|active} default => passive --> vim-syntastic/syntastic
" " <leader>n " Automatically adds the corresponding use statement for the name under the cursor --> arnaud-lb/vim-php-namespace
"
"   VISUALS
"
" " <leader>l " toggles the invisible chars
" " <leader>ig " toggles the indent guides --> nathanaelkane/vim-indent-guides
" " zo " open fold
" " zc " close fold
" " zf<Motion> " zfa} -> folds all incl. parent curly brackets - only in manual mode " :setlocal foldmethod=manual "
"
"
"   RECOMMENDATIONS
"
" " map capslock to <C> [cmd] "
" " in your OS settings "
"
"
" " ┏━╸┏━┓┏┓╻┏━╸╻┏━╸ " "
" " ┃  ┃ ┃┃┗┫┣╸ ┃┃╺┓ " "
" " ┗━╸┗━┛╹ ╹╹  ╹┗━┛ " "
"
" run:
" nvim +PlugInstall

source ~/.config/nvim/plugins.vim



" Section General {{{

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

set nocompatible " not compatible with vi
set autoread " detect when a file is changed

set history=1000 " change history to 1000
set textwidth=120

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" let g:python_host_prog = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = 'python'
let g:python2_host_prog = 'python2'
let g:python3_host_prog = 'python3'

if has('nvim')
    " show results of substition as they're happening
    " but don't open a split
    set inccommand=nosplit
endif

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" go through tabs
map <silent> öä :tabn<cr>
map <silent> äö :tabp<cr>
map <silent> <leader>t :tabnew<cr>

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" More natural split opening
set splitbelow
set splitright

" remap <CR> to indent html
inoremap <leader><CR> <CR><C-o>==<C-o>O

" expand previous indent on new line
inoremap <expr> <CR> functions#Expander()

" unset search highlight on pres esc
nnoremap <esc> :noh<return><esc>

" A: don't give the "ATTENTION" message when an existing swap file set
set shortmess+=A

" }}}


" Section User Interface {{{

set number " show line numbers
set relativenumber " show relative line numbers

set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking

set autoindent " automatically set indent of new line
set smartindent

" toggle invisible characters
set list
" set invlist
" set nolist
set listchars=tab:⏤ ,space:·,eol:¬,trail:⚬,extends:❯,precedes:❮
" set showbreak=↩︎

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
" set noexpandtab " insert tabs rather than spaces for <Tab>
set expandtab " Expand TABs to spaces
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" code folding settings
set foldmethod=indent " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

set clipboard=unnamed

set ttyfast " faster redrawing
set diffopt+=vertical
set laststatus=2 " show the satus line all the time
set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=1 " command bar height
set title " set terminal title

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results"
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
let b:match_debug=1 " fixes the - not jumping to other bracket with % - issue

set mat=2 " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

if has('mouse')
    set mouse=a
    " set ttymouse=xterm2
endif

" }}}


" Section Mappings {{{

" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

" remap esc
inoremap jk <esc>

" wipout buffer
" nmap <silent> <leader>b :bw<cr>

" shortcut to save
nmap <leader>s :w<cr>

" toggle auto-indenting for code paste
set pastetoggle=<F6>

" toggle paste mode
" map <leader>v :set paste!<cr>

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit ~/.config/nvim/snippets
map <leader>es :e! ~/.config/nvim/snippets<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

" show hidden chars
nmap <leader>l :set list!<cr>

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" create split with current buffer in it
" map <silent> <C-h> :call functions#WinMove('h')<cr>
" map <silent> <C-j> :call functions#WinMove('j')<cr>
" map <silent> <C-k> :call functions#WinMove('k')<cr>
" map <silent> <C-l> :call functions#WinMove('l')<cr>

" quit current buffer
map <leader>wc :wincmd q<cr>

" move line mappings
" º is <A-j> on macOS
" ∆ is <A-k> on macOS
nnoremap º :m .+1<cr>==
nnoremap ∆ :m .-2<cr>==
inoremap º <Esc>:m .+1<cr>==gi
inoremap ∆ <Esc>:m .-2<cr>==gi
vnoremap º :m '>+1<cr>gv=gv
vnoremap ∆ :m '<-2<cr>gv=gv

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

map <leader>r :call RunCustomCommand()<cr>
" map <leader>s :call SetCustomCommand()<cr>
let g:silent_custom_command = 0

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

command! Rm call functions#Delete()
command! RM call functions#Delete() <Bar> q!

" }}}


" Section AutoGroups {{{
" file type specific settings
augroup configgroup
    autocmd!

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
    autocmd BufWritePost .vimrc.local source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    " autocmd FocusLost * silent! wa

    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J
    autocmd FileType qf nmap q :q<cr>

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

    " autocmd! BufEnter * call functions#ApplyLocalSettings(expand('<afile>:p:h'))

    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

    autocmd FileType php UltiSnipsAddFiletypes php-laravel
    autocmd FileType blade UltiSnipsAddFiletypes html

    autocmd FileType vue syntax sync fromstart
    " autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
    let g:vue_disable_pre_processors=1

    autocmd FileType nerdtree setlocal relativenumber nolist

    " autocmd BufNewFile,BufRead *.ejs set filetype=html
    " autocmd BufNewFile,BufRead *.ino set filetype=c
    " autocmd BufNewFile,BufRead *.svg set filetype=xml
    " autocmd BufNewFile,BufRead .babelrc set filetype=json
    " autocmd BufNewFile,BufRead .jshintrc set filetype=json
    " autocmd BufNewFile,BufRead .eslintrc set filetype=json
    " autocmd BufNewFile,BufRead *.es6 set filetype=javascript
    autocmd BufNewFile,BufRead *.docker set filetype=dockerfile
    autocmd BufNewFile,BufRead *.dockerfile set filetype=dockerfile

    autocmd FileType php setlocal commentstring=//\ %s

augroup END

" }}}


" Section Plugins {{{

" vim-test
"""""""""""""""""""""""""""""""""""""
" make test commands execute using neovim
let test#strategy = "neovim"

nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" NERDTree
"""""""""""""""""""""""""""""""""""""

" Toggle NERDTree
function! ToggleNerdTree()
    if @% != "" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
        :NERDTreeFind
    else 
        :NERDTreeToggle
    endif
endfunction

nmap <silent> <leader>k :call ToggleNerdTree()<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '+'
let NERDTreeDirArrowCollapsible = '-'
"
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" remove some files by extension
let NERDTreeIgnore = ['\.js.map$','\.DS_Store']
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
" refresh NERDtree and jump back to previous window
" nmap <leader>nr :NERDTree<cr> \| R \| <c-w><c-p>

" adjust the space between icon and filename
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" enable open and close folder/directory glyph flags
let g:DevIconsEnableFoldersOpenClose = 0

let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"	  : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"	  : "✗",
\ "Clean"	  : "✔︎",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }
" NerdCommenter
"""""""""""""""""""""""""""""""""""""

let NERDSpaceDelims=1

" UltiSnips
"""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Snipmate
"""""""""""""""""""""""""""""""""""""

let g:snips_author = 'Artem Schander'

" CtrlP
"""""""""""""""""""""""""""""""""""""

" nmap <silent> <leader>b :CtrlPBuffer<cr>
" nmap <silent> <leader>r :CtrlPBufTag<cr>
" nmap <silent> <leader>ö :CtrlPMRUFiles<cr>
" let g:ctrlp_map='<leader>p'
" let g:ctrlp_dotfiles=1
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_max_files=0

" " CtrlP ignore patterns
" " let g:ctrlp_custom_ignore = {
" "             \ 'dir': '\.git$\|node_modules$\|bower_components$\|\.hg$\|\.svn$',
" "             \ 'file': '\.exe$\|\.so$'
" "             \ }
" " only show files that are not ignored by git
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" " search the nearest ancestor that contains .git, .hg, .svn
" let g:ctrlp_working_path_mode = 2
" let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" " Ignore spaces when searching
" let g:ctrlp_abbrev = {
" \   'gmode': 'i',
" \   'abbrevs': [
" \     {
" \       'pattern': ' ',
" \       'expanded': '',
" \       'mode': 'pfrz',
" \     },
" \   ]
" \ }

" CtrlSF
""""""""""""""""""""""""""""""""""""

" search in ctags
" nmap <leader>f :tag<space>

" " search and replace in multiple files
" nmap     <C-F>f <Plug>CtrlSFPrompt
" vmap     <C-F>f <Plug>CtrlSFVwordPath
" vmap     <C-F>F <Plug>CtrlSFVwordExec
" nmap     <C-F>n <Plug>CtrlSFCwordPath
" nmap     <C-F>p <Plug>CtrlSFPwordPath
" nnoremap <C-F>o :CtrlSFOpen<CR>
" nnoremap <C-F>t :CtrlSFToggle<CR>
" inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" let g:ctrlsf_ackprg = '/usr/local/bin/ag'

" Indent Guides
"""""""""""""""""""""""""""""""""""""

" define the indent guides
let g:indent_guides_auto_colors = 1
" hi IndentGuidesOdd  guibg=black ctermbg=237
" hi IndentGuidesEven guibg=black ctermbg=236

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" FZF
"""""""""""""""""""""""""""""""""""""

" if has('nvim')
"     let g:fzf_layout = { 'window': 'enew' }
" else
"     let g:fzf_layout = { 'down': '~25%' }
" endif

let g:fzf_layout = { 'up': '~35%' }

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R --exclude=node_modules --exclude=dist'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

if isdirectory(".git")
    " if in a git project, use :GFiles
    " nmap <silent> <leader>p :GFiles --cached --others --exclude-standard<cr>
    nmap <silent> <leader>p :GitFiles<cr>
else
    " otherwise, use :FZF
    nmap <silent> <leader>p :FZF<cr>
endif

nmap <silent> <leader>b :Buffers<cr>
nmap <silent> <leader>r :BTags<cr>
nmap <silent> <leader>e :FZF<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" " hide statusline
" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" autocmd! User FzfStatusLine call <SID>fzf_statusline()

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

command! FZFMru call fzf#run({
\   'source':  v:oldfiles,
\   'sink':    'e',
\   'options': '-m -x +s',
\   'down':    '40%'
\ })

command! -bang -nargs=* Find call fzf#vim#grep(
\ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
\ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

if has('nvim')
    command! -bang Commits
        \ call fzf#vim#commits({'window': 'enew'}, <bang>0)
else
    command! -bang Commits
        \ call fzf#vim#commits({'down': '70%'}, <bang>0)
endif

command! -bang BTags
    \ call fzf#vim#buffer_tags(<q-args>, {'right': '30%'}, <bang>0)

command! -bang GitFiles
    \ call fzf#vim#gitfiles('--cached --others --exclude-standard'.<q-args>,
    \ fzf#vim#with_preview('right:50%', '?'), <bang>0)

command! -bang FZF
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)

" Emmet
"""""""""""""""""""""""""""""""""""""
let g:user_emmet_settings = {
\  'javascript.jsx': {
\      'extends': 'jsx',
\  },
\}

" Fugitive Shortcuts
"""""""""""""""""""""""""""""""""""""

nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>
nmap <leader>* *<c-o>:%s///gn<cr>

" ALE - Asynchronous Lint Engine
"""""""""""""""""""""""""""""""""""""

let g:ale_set_highlights = 0
let g:ale_change_sign_column_color = 1
let g:ale_sign_column_always = 1
" let g:ale_sign_error = '✕'
" let g:ale_sign_error = '☓'
let g:ale_sign_error = '!'
" let g:ale_sign_warning = '⚠'
let g:ale_sign_warning = 'i'

" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

" let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'typescript': ['eslint', 'tslint', 'tsserver'],
\   'vue': ['eslint', 'stylelint', 'tsserver'],
\   'php': ['phpcs'],
\   'html': []
\ }
let g:ale_linter_aliases = {'vue': ['css', 'javascript', 'typescript']}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" vim-gitgutter
"""""""""""""""""""""""""""""""""""""

set updatetime=100

let g:gitgutter_sign_added = '•'
" let g:gitgutter_sign_modified = '⌇'
let g:gitgutter_sign_modified = '•'
" let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed = '⚬'
let g:gitgutter_sign_removed_first_line = '⚬'
" let g:gitgutter_sign_modified_removed = '⎓'
" let g:gitgutter_sign_modified_removed = '⑊'
let g:gitgutter_sign_modified_removed = '⚬'

" Airline
"""""""""""""""""""""""""""""""""""""
" airline options

let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.crypt = ""
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '' "       
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' ' "    
let g:airline_symbols.maxlinenr = '' "    

" let g:airline_theme='solarized'
let g:airline_theme='onedark'
" let g:airline_theme='base16'
" let g:airline_theme='badwolf'
" let g:airline_theme='wombat'
" let g:airline_theme='molokai'

" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1

" Statusline
"""""""""""""""""""""""""""""""""""""

" Syntastic syntax check - result in statusline
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" Systastic
"""""""""""""""""""""""""""""""""""""

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" " let g:syntastic_phpcs_disable = 1
" " let g:syntastic_phpmd_disable = 1

" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>" let g:syntastic_phpcs_disable = 1

" let g:syntastic_javascript_checkers = ['eslint']

" Vim PHP Namespace
"""""""""""""""""""""""""""""""""""""
" arnaud-lb/vim-php-namespace

" Automatically adds the corresponding use statement for the name under the cursor.
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

" stephpy/vim-php-cs-fixer
autocmd FileType php nnoremap <silent><leader><f :call PhpCsFixerFixFile()<CR>
nnoremap <silent><leader><d :call PhpCsFixerFixDirectory()<CR>
" unmap <Leader>pcd
" unmap <Leader>pcf

" Vim Tagbar
"""""""""""""""""""""""""""""""""""""
" majutsushi/tagbar

nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = -1
let g:tagbar_autofocus = 0

" YouCompleteMe
"""""""""""""""""""""""""""""""""""""
" valloric/youcompleteme

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0

" }}}




" Section Mappings {{{

" Format code
noremap <F2> :set tabstop=4 shiftwidth=4 expandtab<CR> :retab<CR>
noremap <F3> :set tabstop=4 shiftwidth=4 expandtab<CR> :Autoformat<CR>
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Easier split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" disable Ex mode
noremap Q <NOP>

" nnoremap <Left> :echo "won't happen! Use the h key"<cr>
" nnoremap <Right> :echo "won't happen! Use the l key"<cr>
" nnoremap <Up> :echo "won't happen! Use the k key"<cr>
" nnoremap <Down> :echo "won't happen! Use the j key"<cr>

" inoremap <Left> <nop>
" inoremap <Right> <nop>
" inoremap <Up> <nop>
" inoremap <Down> <nop>

" }}}




" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif



" Colorscheme and final setup {{{
" switch syntax highlighting on
if !exists('g:encoding_set') || !has('nvim')
    set encoding=utf-8
    let g:encoding_set = 1
endif
scriptencoding utf-8
setglobal fileencoding=utf-8

highlight Comment cterm=italic
highlight htmlArg cterm=italic

set fillchars+=vert:┃

syntax on
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"

" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
\,sm:block-blinkwait175-blinkoff150-blinkon175

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if (has('mac') && empty($TMUX) && has("termguicolors"))
    set termguicolors
endif

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
else
    let g:onedark_termcolors=256
    let g:onedark_terminal_italics=1
    let g:solarized_termcolors=256
endif

set background=dark
" let g:solarized_termcolors=16
" let g:onedark_termcolors=16
" let g:onedark_terminal_italics=1

if (has("gui_running"))
    syntax on
    set background=dark
    colorscheme onedark

    set hlsearch
    set ai
    set ruler
    set bs=2
    set guioptions=egmrt
    set guioptions=
    set linespace=2

    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline_powerline_fonts=0
    let g:airline_theme='solarized'

    set macligatures
    set guifont=FiraCode\ Nerd\ Font:h13
else
    " colorscheme base16-railscasts
    " colorscheme solarized
    " colorscheme monokai
    colorscheme onedark
endif

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=236
highlight NonText ctermfg=236

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic
highlight Normal ctermbg=none
" }}}
