
" Plug 'vim-syntastic/syntastic' " syntax checking for vim

" utilities
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-dadbod' " Modern database interface for Vim
Plug 'w0rp/ale' " Asynchonous linting engine
Plug 'osyo-manga/vim-anzu' " show search count
Plug 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the gutter
" " Plug 'mhinz/vim-signify' " Show a diff using Vim its sign column.
" Plug 'dkprice/vim-easygrep' " Fast and Easy Find and Replace Across Multiple Files
" " Plug 'garbas/vim-snipmate' " snippet manager
" " Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
" " Plug 'tomtom/tlib_vim' " utility functions for vim
" Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'ajh17/VimCompletesMe' " tab-completion plugin for Vim
" " Plug 'Valloric/YouCompleteMe' " A code-completion engine for Vim
" Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
" Plug 'tpope/vim-vinegar' " netrw helper
" Plug 'vim-scripts/matchit.zip' " extended % matching
" Plug 'nathanaelkane/vim-indent-guides' " visually displaying indent levels in code
Plug 'easymotion/vim-easymotion' " Vim motion on speed
" " Plug 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim
" Plug 'Chiel92/vim-autoformat' " Format code with one button press. <F3>
Plug 'ludovicchabant/vim-gutentags' " A Vim plugin that manages your tag files
Plug 'janko-m/vim-test' " A Vim wrapper for running tests on different granularities
Plug 'embear/vim-localvimrc' " Search local vimrc files (.lvimrc) in the tree (root dir up to current dir) and load them.
Plug 'vim-vdebug/vdebug', { 'for': ['php', 'python'] } " Multi-language DBGP debugger client for Vim
Plug 'gioele/vim-autoswap' " Please Vim, stop with these swap file messages. Just switch to the correct window!
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin
Plug 'skywind3000/asyncrun.vim' " Run Async Shell Commands
" Plug 'terryma/vim-smooth-scroll' " Make scrolling in Vim more pleasant
Plug 'pseewald/vim-anyfold' " Language agnostic vim plugin for folding and motion based on indentation.

" " html / templates
Plug 'alvan/vim-closetag', { 'for': ['html', 'phtml', 'xml'] } " Auto close (X)HTML tags
Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'phtml', 'xml'] } " always highlights the enclosing html/xml tags
Plug 'phalkunz/vim-ss', {'for': ['ss', 'ss.html']} " SilverStripe


" styles
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color


" markdown


" JavaScript
" Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
" Plug 'storyn26383/vim-vue', { 'for': 'vue' } " Vim syntax highlighting for Vue components.




" language-specific plugins
Plug 'sheerun/vim-polyglot' " A solid language pack for Vim
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'jparise/vim-graphql', { 'for': ['gql', 'graphql'] } " GraphQL file detection, syntax highlighting, and indentation
" Plug 'fatih/vim-go', { 'for': 'go' } " go support
" Plug 'timcharper/textile.vim', { 'for': 'textile' } " textile support

call plug#end()
