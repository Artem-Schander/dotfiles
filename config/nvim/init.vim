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
" " <leader>1 " highlights all occurrences of the word under the cursor (different colors 1 - 6)
" " <C-c> " (ctrl+c) like buffer delete but keeps the split open
"
" " :!ctags -R --exclude=node_modules --exclude=dist " create a tags index --> ctags
" " <C-]> " (ctrl+alt+6) go to declaration of whatever is under the cursor --> ctags
" " :tabonly " close all tabs except for the active one
"
"
"   EDIT / COPY & PASTE
"
" " <leader>ev " edit ~/.vimrc file instantly
" " yy " copy the whole line
" " p " (lowercase) paste below
" " P " (capital) paste above
" " C " (capital) change rest of line
" " gc " comment line or block out --> preservim/nerdcommenter
" " ysiw " add surroundings --> tpope/vim-surround
" " S " add surroundings to selection in visual mode --> tpope/vim-surround
" " dst " delete surrounding tag --> tpope/vim-surround
" " cst " change surrounding tag --> tpope/vim-surround
" " <leader><f " format php file (psr-2) --> stephpy/vim-php-cs-fixer
" " crs " convert to snake_case --> tpope/vim-abolish
" " crc " convert to camelCase --> tpope/vim-abolish
" " vipga= or gaip= " aligns a paragraph by the = symbol --> junegunn/vim-easy-align
" " cit " change in tag
" " cat " like ciw but takes the tag also
" " :%retab " fixes wrong indent type. FA tabs to spaces
" " <leader><space> " removes trailing spaces --> ntpeters/vim-better-whitespace
"
" find and replace in multiple files: --> junegunn/fzf.vim
" 1. " :Ag foo " then enter
" 2. " <alt-a> " to select items (needs to be escaped in iTerm2 config)
" 3. " <enter> " to populate quickfix list with selected items
" 4. " :cfdo %s/foo/bar/g | :w " run a file substitute command then save every file in the quickfix
" ┗━━ or " :cdo normal @q | :w " run a macro on each matching quickfix item and then save it
" 5. " :ccl " close the quickfix list
"
"
"   AUTOCOMPLETE / SNIPPETS / SYNTAX
"
" " <C-y><leader> " (ctrl+y ,) render emmet-string to html--> mattn/emmet-vim
" " <C-y>n " (ctrl+y n) go to next edit point --> mattn/emmet-vim
" " <C-o> or <C-i> " snippet - navigate between edit points
" " <C-w> E " toggle syntastic mode {passive|active} default => passive --> vim-syntastic/syntastic
" " <leader>n " Automatically adds the corresponding use statement for the name under the cursor --> arnaud-lb/vim-php-namespace
" " <C-n> " Autocomplete string --> native
"
"
"   VISUALS
"
" " <leader>l " toggles the invisible chars
" " <leader>ig " toggles the indent guides --> nathanaelkane/vim-indent-guides
" " zo " open fold
" " zc " close fold
" " zr " open one more level
" " zm " close one more level
" " zM " close all levels
" " zf<Motion> " zfa} -> folds all incl. parent curly brackets - only in manual mode " :setlocal foldmethod=manual "
"
"
"   RECOMMENDATIONS
"
" " map capslock to <CMD> in your OS settings "
" " map <CMD>s in Iterm as Escape Sequence to `[24;2~` "
"
"
" " ┏━╸┏━┓┏┓╻┏━╸╻┏━╸ " "
" " ┃  ┃ ┃┃┗┫┣╸ ┃┃╺┓ " "
" " ┗━╸┗━┛╹ ╹╹  ╹┗━┛ " "
"
" run:
" nvim +PlugInstall

" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

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

    " let g:python_host_prog = 'python2'
    " let g:python3_host_prog = 'python3'

    if has('nvim')
        " show results of substition as they're happening
        " but don't open a split
        set inccommand=nosplit
    endif

    set backspace=indent,eol,start " make backspace behave in a sane manner
    set clipboard^=unnamed,unnamedplus " copy to system clipboard

    let b:match_debug=1 " fixes the - not jumping to other bracket with % - issue

    if has('mouse')
        set mouse=a
        " set ttymouse=xterm2
    endif

    " Searching
    set ignorecase " case insensitive searching
    set smartcase " case-sensitive if expresson contains a capital letter
    set hlsearch " highlight search results
    set incsearch " set incremental search, like modern browsers
    set nolazyredraw " don't redraw while executing macros

    set magic " Set magic on, for regex

    " error bells
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500

    set switchbuf=usetab,newtab " switch to the existing tab if the buffer is open, or creating a new one if not

    " unset search highlight on pres esc
    nnoremap <esc> :noh<return><esc>

    " " go through tabs
    " nnoremap <C-Left> :tabprevious<CR>
    " nnoremap <C-Right> :tabnext<CR>
    " nnoremap <C-t> :tabnew<cr>

    " More natural split opening
    set splitbelow
    set splitright

    " remap <CR> to indent html
    inoremap <leader><CR> <CR><C-o>==<C-o>O

    " expand previous indent on new line
    inoremap <expr> <CR> functions#Expander()

    " BufOnly.vim  -  Delete all the buffers except the current/named buffer.
    " Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
    " Distributed under the terms of the Vim license.  See ":help license".
    "
    " Usage:
    "
    " :Bonly / :BOnly / :Bufonly / :BufOnly [buffer]
    "
    " Without any arguments the current buffer is kept.  With an argument the
    " buffer name/number supplied is kept.

    command! -nargs=? -complete=buffer -bang Bonly
    \ :call functions#BufOnly('<args>', '<bang>')
    command! -nargs=? -complete=buffer -bang BOnly
    \ :call functions#BufOnly('<args>', '<bang>')
    command! -nargs=? -complete=buffer -bang Bufonly
    \ :call functions#BufOnly('<args>', '<bang>')
    command! -nargs=? -complete=buffer -bang BufOnly
    \ :call functions#BufOnly('<args>', '<bang>')
    command! Bcleanup
    \ :call functions#DeleteEmptyBuffers()

    " " command BD bp\|bd \#
    " nnoremap <C-c> :bp\|bd #<CR>

    " jump to the previous function
    nnoremap <silent> [f :call
    \ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "bw")<CR>
    " jump to the next function
    nnoremap <silent> ]f :call
    \ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "w")<CR>
" }}}

" Appearance {{{
    set number " show line numbers
    set relativenumber " show relative line numbers
    set wrap " turn on line wrapping
    set wrapmargin=8 " wrap lines when coming within n characters from side
    set linebreak " set soft wrapping
    set autoindent " automatically set indent of new line
    set smartindent " automatically set indent of new line - syntax specific
    set ttyfast " faster redrawing
    set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
    set laststatus=2 " show the status line all the time
    set so=7 " set 7 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    set wildmode=list:longest " complete files like a shell
    set shell=$SHELL
    set cmdheight=1 " command bar height
    set title " set terminal title
    set showmatch " show matching braces
    set mat=2 " how many tenths of a second to blink
    set updatetime=300
    set signcolumn=yes
    set shortmess+=A " don't give the "ATTENTION" message when an existing swap file set
    set scrolloff=3 " lines of text around cursor
    set cursorline " highlight cursor line


    " Tab control
    set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=4 " the visible width of tabs
    set softtabstop=4 " edit as if the tabs are 4 characters wide
    set shiftwidth=4 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'
    set expandtab " expand tabs to spaces
    " set noexpandtab " insert tabs rather than spaces for <Tab>
    " set completeopt+=longest

    " code folding settings
    set foldmethod=syntax " fold based on indent
    set foldlevelstart=99
    set foldnestmax=10 " deepest fold is 10 levels
    set nofoldenable " don't fold by default
    set foldlevel=1

    " toggle invisible characters
    " set list
    " set invlist
    set nolist
    set listchars=tab:⏤ ,space:·,eol:¬,trail:-,extends:❯,precedes:❮ " ⚬ ● • ¤ » ø Θ 0 O ⟶  ⟼  ⏤ ⤚
    set showbreak=↪ " ↩︎  …

    set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
    " switch cursor to line when in insert mode, and block when not
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

    if &term =~ '256color'
        " disable background color erase
        set t_ut=
    endif

    " enable 24 bit color support if supported
    if (has("termguicolors"))
        if (!(has("nvim")))
            let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
            let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        endif
        set termguicolors
    endif

    " highlight conflicts
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

    " Load colorschemes
    "
    " " one colorscheme pack to rule them all! - does not work properly - no syntax for php
    " Plug 'flazz/vim-colorschemes'
    " Plug 'chriskempson/base16-vim'
    Plug 'joshdick/onedark.vim'
    " Plug 'morhetz/gruvbox'
    " Plug 'nightsense/carbonized'
    " Plug 'romainl/flattened'
    " Plug 'ayu-theme/ayu-vim'
    " Plug 'keith/parsec.vim'
    " Plug 'arcticicestudio/nord-vim'
    " Plug 'lifepillar/vim-solarized8'
    " Plug 'AlessandroYorba/Alduin'
    " Plug 'ajmwagar/vim-deus'
    " Plug 'tlhr/anderson.vim'
    " Plug 'challenger-deep-theme/vim'
    " Plug 'NLKNguyen/papercolor-theme'
    " Plug 'nanotech/jellybeans.vim'
    " Plug 'dikiaap/minimalist'
    " Plug 'mhartington/oceanic-next'
    " Plug 'junegunn/seoul256.vim'
    " Plug 'jacoborus/tender.vim'
    " Plug 'hzchirs/vim-material'
    " Plug 'altercation/vim-colors-solarized'
    " Plug 'rickharris/vim-monokai'

    " LightLine {{{
        Plug 'itchyny/lightline.vim'
        " Plug 'nicknisi/vim-base16-lightline'
        let g:lightline = {
            \   'colorscheme': 'onedark',
            \   'active': {
            \       'left': [
            \           [ 'mode', 'paste' ],
            \           [ 'gitbranch' ],
            \           [ 'readonly', 'filetype', 'filename' ]
            \       ],
            \       'right': [
            \           [ 'percent' ],
            \           [ 'lineinfo' ],
            \           [ 'fileformat', 'fileencoding', 'whitespace' ],
            \           [ 'gitblame', 'currentfunction',  'cocstatus', 'linter_errors', 'linter_warnings' ]
            \       ]
            \   },
            \   'component_expand': {
            \   },
            \   'component_type': {
            \       'readonly': 'error',
            \       'linter_warnings': 'warning',
            \       'linter_errors': 'error'
            \   },
            \   'component_function': {
            \       'fileencoding': 'helpers#lightline#fileEncoding',
            \       'filename': 'helpers#lightline#fileName',
            \       'fileformat': 'helpers#lightline#fileFormat',
            \       'filetype': 'helpers#lightline#fileType',
            \       'whitespace': 'helpers#lightline#whitespace',
            \       'gitbranch': 'helpers#lightline#gitBranch',
            \       'cocstatus': 'coc#status',
            \       'currentfunction': 'helpers#lightline#currentFunction',
            \       'gitblame': 'helpers#lightline#gitBlame'
            \   },
            \   'tabline': {
            \       'left': [ [ 'tabs' ] ],
            \       'right': [ [ 'close' ] ]
            \   },
            \   'tab': {
            \       'active': [ 'filename', 'modified' ],
            \       'inactive': [ 'filename', 'modified' ],
            \   },
            \   'separator': { 'left': '', 'right': '' },
            \   'subseparator': { 'left': '', 'right': '' }
        \ }
    " }}}

    " " AirLine {{{
    "     Plug 'vim-airline/vim-airline'
    "     Plug 'vim-airline/vim-airline-themes'


    "     " let g:airline_section_z = airline#section#create(['%{&tabstop}:%{&shiftwidth}', ' %3p%% ',g:airline_symbols.linenr,'%3l:%c'])

    "     let g:airline_powerline_fonts=1

    "     let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
    "     let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
    "     let g:airline#extensions#tabline#fnamemod = ':t' " show only the filename, not the full path
    "     let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
    "     let g:airline#extensions#tabline#show_splits = 0

    "     if !exists('g:airline_symbols')
    "         let g:airline_symbols = {}
    "     endif

    "     " unicode symbols
    "     let g:airline_symbols.crypt = ""
    "     " let g:airline_symbols.linenr = '☰'
    "     " let g:airline_symbols.linenr = '␊'
    "     " let g:airline_symbols.linenr = '␤'
    "     " let g:airline_symbols.linenr = '¶'
    "     " let g:airline_symbols.maxlinenr = ''
    "     " let g:airline_symbols.maxlinenr = '㏑'
    "     " let g:airline_symbols.branch = '⎇'
    "     " let g:airline_symbols.paste = 'ρ'
    "     " let g:airline_symbols.paste = 'Þ'
    "     let g:airline_symbols.paste = '∥'
    "     let g:airline_symbols.spell = 'Ꞩ'
    "     let g:airline_symbols.notexists = '∄'
    "     let g:airline_symbols.whitespace = 'Ξ'

    "     " powerline symbols
    "     let g:airline_left_sep = ''
    "     let g:airline_left_alt_sep = ''
    "     let g:airline_right_sep = ''
    "     let g:airline_right_alt_sep = ''
    "     let g:airline_symbols.branch = '' "       
    "     let g:airline_symbols.dirty = ""
    "     let g:airline_symbols.readonly = ''
    "     let g:airline_symbols.linenr = " \uf922" "       濫
    "     let g:airline_symbols.maxlinenr = '' "    

    "     " let g:airline_theme = 'solarized'
    "     " let g:airline_theme = 'material'
    "     let g:airline_theme = 'onedark'
    "     " let g:airline_theme = 'gruvbox'
    "     " let g:airline_theme = 'base16'
    "     " let g:airline_theme = 'badwolf'
    "     " let g:airline_theme = 'wombat'
    "     " let g:airline_theme = 'molokai'

    "     " Show just the filename
    "     " let g:airline#extensions#tabline#fnamemod = ':t'

    "     " don't hide quotes in json files
    "     let g:vim_json_syntax_conceal = 0

    "     " show errors or warnings in my statusline
    "     let g:airline#extensions#ale#enabled = 1
    " " }}}
" }}}

" General Mappings {{{
    " set a map leader for more key combos
    let mapleader = ','
    let g:mapleader = ','

    " remap esc
    inoremap jk <esc>

    " shortcut to save
    " nmap <leader>w :w<cr>
    nmap <leader>, :w<cr>

    " set paste toggle
    set pastetoggle=<leader>v

    " edit ~/.config/nvim/init.vim
    map <leader>ev :e! ~/.config/nvim/init.vim<cr>
    " edit gitconfig
    map <leader>eg :e! ~/.gitconfig<cr>

    " clear highlighted search
    noremap <space> :set hlsearch! hlsearch?<cr>

    " activate spell-checking alternatives
    nmap ;s :set invspell spelllang=en<cr>

    " markdown to html
    nmap <leader>md :%!markdown --html4tags <cr>

    " remove extra whitespace
    " nmap <leader><space> :%s/\s\+$<cr>
    " nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

    " inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
    " inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

    " show hidden chars
    nmap <leader>l :set list!<cr>

    " keep visual selection when indenting/outdenting
    vmap < <gv
    vmap > >gv
    nmap < <<
    nmap > >>

    " switch between current and last buffer
    nmap <leader>. <c-^>

    " enable . command in visual mode
    vnoremap . :normal .<cr>

    " map <silent> <C-h> <Plug>WinMoveLeft
    " map <silent> <C-j> <Plug>WinMoveDown
    " map <silent> <C-k> <Plug>WinMoveUp
    " map <silent> <C-l> <Plug>WinMoveRight

    " zoom current pane
    nmap <leader>z <Plug>Zoom

    " quit current buffer
    map <leader>wc :wincmd q<cr>

    " move line mappings
    " ∆ is <A-j> on macOS
    " ˚ is <A-k> on macOS
    nnoremap ∆ :m .+1<cr>==
    nnoremap ˚ :m .-2<cr>==
    inoremap ∆ <Esc>:m .+1<cr>==gi
    inoremap ˚ <Esc>:m .-2<cr>==gi
    vnoremap ∆ :m '>+1<cr>gv=gv
    vnoremap ˚ :m '<-2<cr>gv=gv

    vnoremap $( <esc>`>a)<esc>`<i(<esc>
    vnoremap $[ <esc>`>a]<esc>`<i[<esc>
    vnoremap ${ <esc>`>a}<esc>`<i{<esc>
    vnoremap $" <esc>`>a"<esc>`<i"<esc>
    vnoremap $' <esc>`>a'<esc>`<i'<esc>
    vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
    vnoremap $< <esc>`>a><esc>`<i<<esc>

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

    " helpers for dealing with other people's code
    nmap \t :set ts=4 sts=4 sw=4 noet<cr>
    nmap \s :set ts=4 sts=4 sw=4 et<cr>

    nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

    command! Rm call functions#Delete()
    command! RM call functions#Delete() <Bar> q!

    " Custom text objects

    " inner-line
    xnoremap <silent> il :<c-u>normal! g_v^<cr>
    onoremap <silent> il :<c-u>normal! g_v^<cr>

    " around line
    vnoremap <silent> al :<c-u>normal! $v0<cr>
    onoremap <silent> al :<c-u>normal! $v0<cr>

    " Interesting word mappings
    nmap <leader>0 <Plug>ClearInterestingWord
    nmap <leader>1 <Plug>HiInterestingWord1
    nmap <leader>2 <Plug>HiInterestingWord2
    nmap <leader>3 <Plug>HiInterestingWord3
    nmap <leader>4 <Plug>HiInterestingWord4
    nmap <leader>5 <Plug>HiInterestingWord5
    nmap <leader>6 <Plug>HiInterestingWord6

    " shortcut to save
    " map <cmd>s as Escape Sequence to "[24;2~"
    " map <F24> :w<cr>
    " imap <F24> <esc>:w<cr> a
" }}}

" AutoGroups {{{
    " file type specific settings
    augroup configgroup
        autocmd!

        " automatically resize panes on resize
        autocmd VimResized * exe 'normal! \<c-w>='
        " autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
        " autocmd BufWritePost .vimrc.local source %
        " save all files on focus lost, ignoring warnings about untitled buffers
        " autocmd FocusLost * silent! wa

        " make quickfix windows take all the lower section of the screen
        " when there are multiple windows open
        autocmd FileType qf wincmd J
        autocmd FileType qf nmap <buffer> q :q<cr>

        autocmd FileType php UltiSnipsAddFiletypes php-laravel
        autocmd FileType php UltiSnipsAddFiletypes php-extbase
        autocmd FileType phtml UltiSnipsAddFiletypes php
        autocmd FileType blade UltiSnipsAddFiletypes html

        " autocmd FileType nerdtree setlocal relativenumber nolist
        " autocmd FileType gitcommit,gitrebase let g:gutentags_enabled=0

        " autocmd FileType php,cpp,javascript.jsx,vue setlocal commentstring=//\ %s
        autocmd FileType ss.html setlocal commentstring=<%--%s--%>

        " autocmd BufNewFile,BufRead *.vue set ft=vue
        " autocmd BufEnter *.vue :syntax sync fromstart

        " autocmd BufRead,BufNewFile *.conf set filetype=dosini | set filetype=nginx
    augroup END
" }}}

" General Functionality {{{
    " better terminal integration
    " substitute, search, and abbreviate multiple variants of a word
    Plug 'tpope/vim-abolish'

    " mappings which are simply short normal mode aliases for commonly used ex commands
    " Plug 'tpope/vim-unimpaired'

    " endings for html, xml, etc. - ehances surround
    " Plug 'tpope/vim-ragtag'

    " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
    Plug 'tpope/vim-surround'

    " tmux integration for vim
    Plug 'benmills/vimux'

    " enables repeating other supported plugins with the . command
    Plug 'tpope/vim-repeat'

    " .editorconfig support
    Plug 'editorconfig/editorconfig-vim'

    " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
    " Plug 'AndrewRadev/splitjoin.vim'

    " add end, endif, etc. automatically
    Plug 'tpope/vim-endwise'

    " context-aware pasting
    " Plug 'sickill/vim-pasta'

    " detect indent style (tabs vs. spaces)
    Plug 'tpope/vim-sleuth'

    " Vim motion on speed
    Plug 'easymotion/vim-easymotion'

    " show search count
    Plug 'osyo-manga/vim-anzu'

    " devicons to be used by different other plugins
    Plug 'ryanoasis/vim-devicons'

    " Debugging {{{
        " Multi-language DBGP debugger client for Vim
        Plug 'vim-vdebug/vdebug', { 'for': ['php', 'python'] }

        " Keymap for Vdebug
        " let g:vdebug_keymap = {
        " \    "run" : "<Leader>/",
        " \    "run_to_cursor" : "<Down>",
        " \    "step_over" : "<Up>",
        " \    "step_into" : "<Right>",
        " \    "step_out" : "<Left>",
        " \    "close" : "q",
        " \    "detach" : "<F7>",
        " \    "set_breakpoint" : "<Leader>s",
        " \    "eval_visual" : "<Leader>e",
        " \    "eval_under_cursor" : "<Leader>c"
        " \}

        " Vdebug settings.
        let g:vdebug_options = {}
        let g:vdebug_options['break_on_open'] = 1
        let g:vdebug_options['max_children'] = 128
        let g:vdebug_options['watch_window_style'] = 'compact'
        let g:vdebug_options['ide_key'] = 'PHPSTORM'
    " }}}

    " Testing {{{
        " A Vim wrapper for running tests on different granularities
        Plug 'janko-m/vim-test'

        " make test commands execute using neovim
        let test#strategy = "neovim"

        nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
        nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
        nmap <silent> t<C-t> :TestSuite<CR>   " t Ctrl+s
        nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
        nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
    " }}}

    " Local Configuration {{{
        " Search local vimrc files (.lvimrc) in the tree (root dir up to current dir) and load them.
        Plug 'embear/vim-localvimrc'
        let g:localvimrc_name = [".lvimrc", ".local.vimrc"]
        let g:localvimrc_ask = 0
    " }}}

    " Alignment {{{
        " A Vim alignment plugin
        Plug 'junegunn/vim-easy-align'

        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)
        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
    " }}}

    " Better Folding {{{
        " Language agnostic vim plugin for folding and motion based on indentation.
        Plug 'pseewald/vim-anyfold'
        let g:AnyFoldActivate=1
        let g:anyfold_fold_comments=1
    " }}}

    " Better Whitespace {{{
        " Better whitespace highlighting for Vim
        Plug 'ntpeters/vim-better-whitespace'

        nmap <leader><space> :StripWhitespace<cr>
        let g:strip_whitespace_on_save = 0
        let g:better_whitespace_filetypes_blacklist = [
        \ 'help',
        \ 'pug',
        \ 'diff',
        \ 'gitcommit',
        \ 'unite',
        \ 'qf',
        \ 'help',
        \ 'markdown',
        \ 'coc-explorer',
        \ 'startify'
        \ ]
        let g:show_spaces_that_precede_tabs = 1
        let g:better_whitespace_skip_empty_lines = 0
    " }}}

    " Session Management {{{
        Plug 'tpope/vim-obsession'
        Plug 'dhruvasagar/vim-prosession'
        let g:prosession_on_startup = 0
        let g:prosession_tmux_title = 1
        let g:prosession_last_session_dir = '~/.vim/session'
    " }}}

    " Sync Files {{{
        " Automatic sync local and remote file in vim
        Plug 'eshion/vim-sync'
        nnoremap <C-U> <ESC>:call SyncUploadFile()<CR>
        nnoremap <C-D> <ESC>:call SyncDownloadFile()<CR>
    " }}}

    " Commenting Motions {{{
        " Plug 'tpope/vim-commentary'
        Plug 'preservim/nerdcommenter'

        vmap gc <Plug>NERDCommenterToggle
        nmap gcc <Plug>NERDCommenterToggle

        " Add spaces after comment delimiters by default
        let g:NERDSpaceDelims = 1

        " Use compact syntax for prettified multi-line comments
        let g:NERDCompactSexyComs = 1

        " Align line-wise comment delimiters flush left instead of following code indentation
        let g:NERDDefaultAlign = 'left'

        " Set a language to use its alternate delimiters by default
        let g:NERDAltDelims_java = 1

        " Add your own custom formats or override the defaults
        let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

        " Allow commenting and inverting empty lines (useful when commenting a region)
        let g:NERDCommentEmptyLines = 1

        " Enable trimming of trailing whitespace when uncommenting
        let g:NERDTrimTrailingWhitespace = 1

        " Enable NERDCommenterToggle to check all selected lines is commented or not
        let g:NERDToggleCheckAllLines = 1

        let g:ft = ''
        function! NERDCommenter_before()
            if &ft == 'vue'
                let g:ft = 'vue'
                let stack = synstack(line('.'), col('.'))
                if len(stack) > 0
                    let syn = synIDattr((stack)[0], 'name')
                    if len(syn) > 0
                        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
                    endif
                endif
            endif
            if &ft == 'php'
                let g:ft = 'php'
                let stack = synstack(line('.'), col('.'))
                if len(stack) > 0
                    "most nested item in the stack
                    let syn = synIDattr((stack)[-1], 'name')
                    if len(syn) > 0
                        let syn = substitute(syn, '[A-Z].*', '', '')
                        if len(syn) > 0
                            exe 'setf '.syn
                        endif
                    endif
                endif
            endif
        endfunction
        function! NERDCommenter_after()
            if g:ft == 'vue'
                setf vue
                let g:ft = ''
            endif
            if g:ft == 'php'
                setf php
                let g:ft = ''
            endif
        endfunction
    " }}}

    " " Vim Tagbar {{{
    "     " Vim plugin that displays tags in a window, ordered by scope
    "     Plug 'majutsushi/tagbar'

    "     nmap <F8> :TagbarToggle<CR>
    "     let g:tagbar_sort = 0
    "     let g:tagbar_show_linenumbers = -1
    "     let g:tagbar_autofocus = 0
    " " }}}

    " Startify: Fancy startup screen for vim {{{
        Plug 'mhinz/vim-startify'

        " Don't change to directory when selecting a file
        let g:startify_change_to_dir = 0
        let g:startify_files_number = 5
        let g:startify_custom_header = helpers#startify#header()
        let g:startify_relative_path = 1
        let g:startify_use_env = 1
        let g:startify_session_dir = '~/.vim/session'

        " \  { 'type': function('helpers#startify#listprosessions'), 'header': [ 'Location Related Sessions' ] },
        " \  { 'type': function('helpers#startify#listsessions'), 'header': [ 'Global Sessions' ] },
        let g:startify_lists = [
        \  { 'type': function('helpers#startify#listallsessions'), 'header': [ 'Sessions' ] },
        \  { 'type': function('helpers#startify#startsession'), 'header': [ 'New Session' ] },
        \  { 'type': 'dir', 'header': [ 'Files '. getcwd() ] },
        \  { 'type': function('helpers#startify#listcommits'), 'header': [ 'Recent Commits' ] },
        \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ] },
        \  { 'type': 'commands', 'header': [ 'Commands' ] },
        \ ]


        let g:startify_commands = [
        \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
        \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
        \ ]

        let g:startify_bookmarks = [
            \ { 'c': '~/.config/nvim/init.vim' },
            \ { 'g': '~/.gitconfig' },
            \ { 'z': '~/.zshrc' }
        \ ]

        autocmd User Startified setlocal cursorline
        nmap <leader>st :Startify<cr>
    " }}}

    " Splits {{{
        " Close buffers but keep splits
        Plug 'moll/vim-bbye'
        nmap <leader>b :Bdelete<cr>
    " }}}

    " " Writing in vim {{{{
    "     Plug 'junegunn/goyo.vim'

    "     autocmd! User GoyoEnter nested call helpers#goyo#enter()
    "     autocmd! User GoyoLeave nested call helpers#goyo#leave()
    " " }}}

    " Indent Lines {{{{
        Plug 'Yggdroot/indentLine' " A vim plugin to display the indention levels with thin vertical lines

        " let g:indentLine_char_list = ['|', '│']
        let g:indentLine_char = '│'
        let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'fzf', 'Tagbar', 'coc-explorer', 'startify']
        nmap <leader>ig :IndentLinesToggle<cr>
    " }}}

    " " NERDTree {{{
    "     Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    "     " Plug 'Xuyuanp/nerdtree-git-plugin'
    "     " Plug 'tsony-tsonev/nerdtree-git-plugin'
    "     Plug 'ryanoasis/vim-devicons'
    "     Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    "
    "     let g:WebDevIconsOS = 'Darwin'
    "     let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder/directory glyph flag (disabled by default with 0)
    "     let g:DevIconsEnableFoldersOpenClose = 1 " enable open and close folder/directory glyph flags
    "     let g:DevIconsEnableFolderExtensionPatternMatching = 1 " enable pattern matching glyphs on folder/directory
    "     let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
    "     " let NERDTreeDirArrowExpandable = '+'
    "     let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
    "     " let NERDTreeDirArrowCollapsible = '-'
    "     let NERDTreeNodeDelimiter = "\u263a" " smiley face
    "
    "     augroup nerdtree
    "         autocmd!
    "         autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
    "         autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
    "     augroup END
    "
    "     " Toggle NERDTree
    "     function! ToggleNerdTree()
    "         if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
    "             :NERDTreeFind
    "         else
    "             :NERDTreeToggle
    "         endif
    "     endfunction
    "     " toggle nerd tree
    "     " nmap <silent> <leader>n :call ToggleNerdTree()<cr>
    "     nmap <silent> <leader>k :call ToggleNerdTree()<cr>
    "     " find the current file in nerdtree without needing to reload the drawer
    "     nmap <silent> <leader>y :NERDTreeFind<cr>
    "
    "     " let NERDTreeDirArrowExpandable = '▷'
    "     " let NERDTreeDirArrowCollapsible = '▼'
    "     let g:NERDTreeIndicatorMapCustom = {
    "     \ "Modified"  : "",
    "     \ "Staged"    : "✚",
    "     \ "Untracked" : "✭",
    "     \ "Renamed"   : "➜",
    "     \ "Unmerged"  : "═",
    "     \ "Deleted"   : "✖",
    "     \ "Dirty"     : "✗",
    "     \ "Clean"     : "✔︎",
    "     \ 'Ignored'   : '☒',
    "     \ "Unknown"   : "?"
    "     \ }
    " " }}}

    " FZF {{{
        " Plug '/usr/local/opt/fzf' " fuzzy file finder and so much more
        Plug 'junegunn/fzf', { 'do': './install --bin' }
        Plug 'junegunn/fzf.vim'

        " let g:fzf_layout = { 'down': '~25%' }
        let g:fzf_layout = { 'up': '~35%' }

        " [Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R --exclude=node_modules --exclude=dist'

        " [Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1

        if isdirectory(".git")
            " if in a git project, use :GFiles
            " nmap <silent> <leader>p :GFiles --cached --others --exclude-standard<cr>
            nmap <silent> <leader>p :GitFiles --cached --others --exclude-standard<cr>
        else
            " otherwise, use :FZF
            nmap <silent> <leader>p :FZF<cr>
        endif


        nmap <silent> <leader>s :GFiles?<cr>
        nmap <silent> <leader>b :Buffers<cr>
        nmap <silent> <leader>e :FZF<cr>
        nmap <silent> <leader>r :BTags<cr>

        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)

        " Insert mode completion
        imap <c-x><c-k> <plug>(fzf-complete-word)
        imap <c-x><c-f> <plug>(fzf-complete-path)
        imap <c-x><c-j> <plug>(fzf-complete-file-ag)
        imap <c-x><c-l> <plug>(fzf-complete-line)

        nnoremap <silent> <Leader>C :call fzf#run({
        \   'source':
        \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
        \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
        \   'sink': 'color',
        \   'options': '+m',
        \   'left': 45
        \ })<CR>

        command! FZFMru call fzf#run({
        \   'source': v:oldfiles,
        \   'sink': 'e',
        \   'options': '-m -x +s',
        \   'down': '40%'
        \ })

        command! -bang -nargs=* Find call fzf#vim#grep(
            \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
            \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

        command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)

        command! -bang -nargs=? -complete=dir GitFiles
            \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)

        command! -bang BTags
            \ call fzf#vim#buffer_tags(<q-args>, {'top': '30%'}, <bang>0)
    " }}}

    " vim-fugitive {{{
        Plug 'tpope/vim-fugitive'
        nmap <silent> <leader>gs :Gstatus<cr>
        nmap <leader>ge :Gedit<cr>
        nmap <silent><leader>gr :Gread<cr>
        nmap <silent><leader>gb :Gblame<cr>
        " nmap <leader>m :MarkedOpen!<cr>
        " nmap <leader>mq :MarkedQuit<cr>
        " nmap <leader>* *<c-o>:%s///gn<cr>

        " Plug 'tpope/vim-rhubarb' " hub extension for fugitive
        Plug 'sodapopcan/vim-twiggy' " fugitive extension that loads, decorates and sorts git branches into an interactive buffer
    " }}}

    " UltiSnips {{{
        Plug 'SirVer/ultisnips' " Snippets plugin
        Plug 'honza/vim-snippets' " snippet manager
        let g:snips_author = "Artem Schander"
        " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
        let g:UltiSnipsExpandTrigger = '<C-Right>'
        let g:UltiSnipsJumpForwardTrigger = '<C-Right>'
        let g:UltiSnipsJumpBackwardTrigger = '<C-Left>'
        " let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', '~/.config/nvim/snippets', '~/.config/nvim/plugged/vim-snippets/UltiSnips', '~/.config/nvim/plugged/vim-snippets/snippets']

        " If you want :UltiSnipsEdit to split your window.
        " let g:UltiSnipsEditSplit="vertical"
    " }}}

    " coc {{{
        " an intellisense engine for Vim/Neovim.
        Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

        " ccls need to be installed separately. see https://github.com/MaskRay/ccls/wiki
        " vetur need to be installed separately. `yarn global add vue-language-server` see https://github.com/neoclide/coc-vetur
        let g:coc_global_extensions = [
        \ 'coc-ccls',
        \ 'coc-python',
        \ 'coc-phpls',
        \ 'coc-vetur',
        \ 'coc-css',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-git',
        \ 'coc-eslint',
        \ 'coc-tslint-plugin',
        \ 'coc-pairs',
        \ 'coc-sh',
        \ 'coc-vimlsp',
        \ 'coc-emmet',
        \ 'coc-highlight',
        \ 'coc-prettier',
        \ 'coc-ultisnips',
        \ 'coc-explorer'
        \ ]

        let g:coc_status_error_sign = 'X'
        let g:coc_status_warning_sign = 'X'

        autocmd CursorHold * silent call CocActionAsync('highlight')

        " coc-prettier
        command! -nargs=0 Prettier :CocCommand prettier.formatFile
        nmap <leader>f :CocCommand prettier.formatFile<cr>

        " coc-git
        nmap [g <Plug>(coc-git-prevchunk)
        nmap ]g <Plug>(coc-git-nextchunk)
        nmap gs <Plug>(coc-git-chunkinfo)
        nmap gu :CocCommand git.chunkUndo<cr>

        nmap <silent> <leader>k :CocCommand explorer<cr>

        "remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        nmap <silent> gh <Plug>(coc-doHover)

        " diagnostics navigation
        nmap <silent> [c <Plug>(coc-diagnostic-prev)
        nmap <silent> ]c <Plug>(coc-diagnostic-next)

        " rename
        nmap <silent> <leader>rn <Plug>(coc-rename)

        " Remap for format selected region
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        " organize imports
        command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
            else
                call CocAction('doHover')
            endif
        endfunction

        " tab completion
        inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
            let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " " bases
        " nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
        " " bases of up to 3 levels
        " nn <silent> xB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
        " " derived
        " nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
        " " derived of up to 3 levels
        " nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>
        "
        " " caller
        " nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
        " " callee
        " nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

        " $ccls/member
        " member variables / variables in a namespace
        nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
        " member functions / functions in a namespace
        nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
        " nested classes / types in a namespace
        nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

        nmap <silent> xt <Plug>(coc-type-definition)<cr>
        nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
        nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

        " nn <silent><buffer> <C-l> :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
        " nn <silent><buffer> <C-k> :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
        " nn <silent><buffer> <C-j> :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
        " nn <silent><buffer> <C-h> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>

        nn xx x
    " }}}
" }}}

" Language-Specific Configuration {{{
"
    " A solid language pack for Vim
    Plug 'sheerun/vim-polyglot'

    " html / templates {{{
        " emmet support for vim - easily create markdup wth CSS-like syntax
        Plug 'mattn/emmet-vim', { 'for': ['html', 'phtml', 'javascript.jsx', 'ss.html'] }
        let g:user_emmet_settings = {
        \  'javascript.jsx': {
        \      'extends': 'jsx',
        \  },
        \}
        " match tags in html, similar to paren support
        Plug 'gregsexton/MatchTag', { 'for': 'html' }

        " Auto close (X)HTML tags
        Plug 'alvan/vim-closetag', { 'for': ['html', 'phtml', 'xml'] }

        " html5 support
        " Plug 'othree/html5.vim', { 'for': 'html' }

        " mustache support
        " Plug 'mustache/vim-mustache-handlebars'

        " pug / jade support
        " Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug', 'vue'] }

        " nunjucks support
        " Plug 'niftylettuce/vim-jinja', { 'for': 'njk' }

        " SilverStripe
        Plug 'phalkunz/vim-ss', {'for': ['ss', 'ss.html']}
    " }}}

    " C++ {{{
        " Run Async Shell Commands
        Plug 'skywind3000/asyncrun.vim'

        " automatically open quickfix window when AsyncRun command is executed
        " set the quickfix window 6 lines height.
        let g:asyncrun_open = 6

        " ring the bell to notify you job finished
        let g:asyncrun_bell = 1

        " find the project root by on of these
        let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml', 'Makefile']

        " F9 single file compilation
        autocmd FileType cpp nnoremap <silent> <F9> :AsyncRun -mode=4 g++ -O3 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
        " F5 run binary
        " autocmd FileType cpp nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
        autocmd FileType cpp nnoremap <silent> <F5> :AsyncRun -mode=4 -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
        " F10 to toggle quickfix window
        " autocmd FileType cpp nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
    " }}}

    " Python {{{
        " linter
        " manualy install flake8 -> "python3 -m pip install flake8"
        " see -> http://flake8.pycqa.org/en/latest/index.html#quickstart
        Plug 'nvie/vim-flake8', {'for': ['python']}
    " }}}


    " JavaScript {{{
        " Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
        " Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
        " Plug 'moll/vim-node', { 'for': 'javascript' }
        " Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
        " Plug 'MaxMEllon/vim-jsx-pretty'
        " let g:vim_jsx_pretty_highlight_close_tag = 1

        " Plug 'posva/vim-vue', { 'for': 'vue' }
        " let g:vue_pre_processors = ['pug', 'scss', 'sass']
        " let g:vue_pre_processors = 'detect_on_enter'
    " }}}

    " TypeScript {{{
        " Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
        " Plug 'Shougo/vimproc.vim', { 'do': 'make' } TODO what still needs this?
    " }}}

    " PHP {{{
        " Plug 'StanAngeloff/php.vim', { 'for': 'php' } " Up-to-date PHP syntax file
        " Plug 'arnaud-lb/vim-php-namespace' " plugin for inserting 'use' statements automatically
        " Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' } " psr-2 formating
        " Plug 'captbaritone/better-indent-support-for-php-with-html' " This script allows you to indent HTML sections in PHP files
    " }}}

    " Styles {{{
        " Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
        " Plug 'groenewege/vim-less', { 'for': 'less' }
        " Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
        " Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
        " Plug 'stephenway/postcss.vim', { 'for': 'css' }
    " }}}

    " markdown {{{
        Plug 'tpope/vim-markdown', { 'for': 'markdown' }
        let g:markdown_fenced_languages = [ 'tsx=typescript.tsx' ]

        " Open markdown files in Marked.app - mapped to <leader>m
        Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' }
        nmap <leader>m :MarkedOpen!<cr>
        nmap <leader>mq :MarkedQuit<cr>
        nmap <leader>* *<c-o>:%s///gn<cr>
    " }}}

    " GraphQL {{{
        " Plug 'jparise/vim-graphql', { 'for': ['gql', 'graphql'] }
    " }}}

    " JSON {{{
        " Plug 'elzr/vim-json', { 'for': 'json' }
        " let g:vim_json_syntax_conceal = 0
    " }}}

    " Docker {{{
        " Plug 'ekalinin/Dockerfile.vim'
    " }}}
" }}}

call plug#end()

" Colorscheme and final setup {{{
    " This call must happen after the plug#end() call to ensure
    " that the colorschemes have been loaded

    " switch syntax highlighting on
    if !exists('g:encoding_set') || !has('nvim')
        set encoding=utf-8
        let g:encoding_set = 1
    endif
    scriptencoding utf-8
    setglobal fileencoding=utf-8

    set fillchars+=vert:┃

    if filereadable(expand("~/.vimrc_background"))
        let base16colorspace=256
        source ~/.vimrc_background
    else
        let g:onedark_termcolors=16
        let g:onedark_terminal_italics=1

        colorscheme onedark
        " colorscheme base16-railscasts
        " colorscheme solarized
        " colorscheme monokai
        " colorscheme vim-material
        " colorscheme gruvbox
    endif

    syntax on
    filetype plugin indent on

    set background=dark

    " make the highlighting of tabs and other non-text less annoying
    hi! SpecialKey ctermfg=19 guifg=#333333
    hi! NonText ctermfg=19 guifg=#333333

    " make comments and HTML attributes italic
    hi! Comment cterm=italic term=italic gui=italic
    hi! htmlArg cterm=italic term=italic gui=italic
    hi! xmlAttrib cterm=italic term=italic gui=italic
    " hi! Type cterm=italic term=italic gui=italic
    hi! Normal ctermbg=none
    hi! Normal guibg=none

    if (has("gui_running"))
        set ai
        set ruler
        set bs=2
        set guioptions=egmrt
        set linespace=2

        set macligatures
        set guifont=FuraCode\ Nerd\ Font:h13
    endif

    if (g:colors_name == 'onedark')
        " +---------------------------------------------+
        " |  Color Name  |         RGB        |   Hex   |
        " |--------------+--------------------+---------|
        " | Black        | rgb(40, 44, 52)    | #282c34 |
        " |--------------+--------------------+---------|
        " | White        | rgb(171, 178, 191) | #abb2bf |
        " |--------------+--------------------+---------|
        " | Light Red    | rgb(224, 108, 117) | #e06c75 |
        " |--------------+--------------------+---------|
        " | Dark Red     | rgb(190, 80, 70)   | #be5046 |
        " |--------------+--------------------+---------|
        " | Green        | rgb(152, 195, 121) | #98c379 |
        " |--------------+--------------------+---------|
        " | Light Yellow | rgb(229, 192, 123) | #e5c07b |
        " |--------------+--------------------+---------|
        " | Dark Yellow  | rgb(209, 154, 102) | #d19a66 |
        " |--------------+--------------------+---------|
        " | Blue         | rgb(97, 175, 239)  | #61afef |
        " |--------------+--------------------+---------|
        " | Magenta      | rgb(198, 120, 221) | #c678dd |
        " |--------------+--------------------+---------|
        " | Cyan         | rgb(86, 182, 194)  | #56b6c2 |
        " |--------------+--------------------+---------|
        " | Gutter Grey  | rgb(76, 82, 99)    | #4b5263 |
        " |--------------+--------------------+---------|
        " | Comment Grey | rgb(92, 99, 112)   | #5c6370 |
        " +---------------------------------------------+

        let one_dark_colors = onedark#GetColors()
        let g:indentLine_color_gui = one_dark_colors.cursor_grey.gui

        let g:better_whitespace_guicolor = one_dark_colors.red.gui

        " remove underline from pair highlighting "MatchPair" for the onedark theme
        " hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=one_dark_colors.blue.gui
        execute "hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=" one_dark_colors.blue.gui

        " change vdebug colors
        execute "hi! DbgBreakptLine term=reverse ctermfg=Black ctermbg=Green guifg=#000000 guibg=" one_dark_colors.green.gui
        execute "hi! DbgBreakptSign term=reverse ctermfg=Black ctermbg=Green guifg=#000000 guibg=" one_dark_colors.green.gui

        " change vdebug colors
        execute "hi! DbgCurrentLine term=reverse ctermfg=Black ctermbg=Green guifg=#000000 guibg=" one_dark_colors.blue.gui
        execute "hi! DbgCurrentSign term=reverse ctermfg=Black ctermbg=Green guifg=#000000 guibg=" one_dark_colors.blue.gui

        execute "hi! SpecialKey ctermfg=19 guifg=" one_dark_colors.gutter_fg_grey.gui
        execute "hi! NonText ctermfg=19 guifg=" one_dark_colors.gutter_fg_grey.gui

        execute "hi! CocErrorSign guifg=" one_dark_colors.red.gui
        execute "hi! CocInfoSign guifg=" one_dark_colors.cyan.gui
        execute "hi! CocWarningSign guifg=" one_dark_colors.dark_yellow.gui
        execute "hi! CocFloating guibg=" one_dark_colors.cursor_grey.gui " guifg=" one_dark_colors.comment_grey.gui
        execute "hi! CocHighlightText guibg=#131519"
        " execute "hi! CocHighlightText guibg=" one_dark_colors.special_grey.gui " guifg=" one_dark_colors.yellow.gui

        " execute "hi! StartifyBracket guifg=" one_dark_colors.white.gui
        " execute "hi! StartifyPath guifg=" one_dark_colors.red.gui
        " execute "hi! StartifySlash guifg=" one_dark_colors.dark_red.gui
        " execute "hi! StartifyFile guifg=" one_dark_colors.dark_yellow.gui
        execute "hi! StartifyHeader guifg=" one_dark_colors.comment_grey.gui
        execute "hi! StartifyFooter guifg=" one_dark_colors.white.gui
        " execute "hi! StartifyNumber guifg=" one_dark_colors.dark_yellow.gui
        execute "hi! StartifySection guifg=" one_dark_colors.dark_yellow.gui
        execute "hi! StartifySpecial guifg=" one_dark_colors.purple.gui

        " " add matching colors to "NREDTree" git color highlighting
        " let g:NERDTreeColorMapCustom = {
        "     \ "Modified"  : one_dark_colors.yellow.gui,
        "     \ "Staged"    : one_dark_colors.green.gui,
        "     \ "Untracked" : one_dark_colors.red.gui,
        "     \ "Dirty"     : one_dark_colors.dark_yellow.gui,
        "     \ "Clean"     : one_dark_colors.special_grey.gui,
        "     \ "Ignored"   : one_dark_colors.comment_grey.gui
        "     \ }

    endif

    " " after a re-source, fix syntax matching issues (concealing brackets):
    " " has to be triggered after `syntax on`
    " if exists('g:loaded_webdevicons')
    "     call webdevicons#refresh()
    " endif
" }}}

" vim:set foldmethod=marker foldlevel=0
