" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized' " solorized colors must be active in terminal settings
" https://github.com/mbadolato/iTerm2-Color-Schemes
Plug 'rickharris/vim-monokai' " monokai has to be downloaded and installed for the terminal

" Plug 'vim-syntastic/syntastic' " syntax checking for vim

" utilities
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
" Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder, mapped to <leader>p
Plug 'tpope/vim-obsession' " obsession.vim: continuously updated session files
Plug 'dhruvasagar/vim-prosession' " A VIM plugin to handle sessions like a pro
" Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'rking/ag.vim' " a replacement for the Perl module / CLI script 'ack' (the_silver_searcher)
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
" Plug 'scrooloose/nerdcommenter' " comment stuff out
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
" Plug 'tpope/vim-endwise' " automatically add end in ruby
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'benmills/vimux' " tmux integration for vim
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'w0rp/ale' " Asynchonous linting engine
Plug 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the gutter
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
" Plug 'garbas/vim-snipmate' " snippet manager
Plug 'SirVer/ultisnips' " snippet engine
Plug 'honza/vim-snippets' " snippet manager
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
" Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
" Plug 'tomtom/tlib_vim' " utility functions for vim
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-vinegar' " netrw helper
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
" Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'ciaranm/detectindent' " automatically detecting indent settings
Plug 'nathanaelkane/vim-indent-guides' " visually displaying indent levels in code
" Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'easymotion/vim-easymotion' " Vim motion on speed
" Plug 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim
Plug 'Chiel92/vim-autoformat' " Format code with one button press. <F3>


" " html / templates
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx'] } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'mustache/vim-mustache-handlebars' " mustach support
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] } " pug / jade support


" styles
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support


" markdown
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support


" JavaScript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'posva/vim-vue', { 'for': 'javascript' } " Syntax Highlight for Vue.js components


" PHP
Plug 'StanAngeloff/php.vim', { 'for': 'php' } " Up-to-date PHP syntax file
Plug 'arnaud-lb/vim-php-namespace' " plugin for inserting 'use' statements automatically
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' } " psr-2 formating


" language-specific plugins
Plug 'sheerun/vim-polyglot', " A solid language pack for Vim
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'fatih/vim-go', { 'for': 'go' } " go support
Plug 'timcharper/textile.vim', { 'for': 'textile' } " textile support

call plug#end()
