-- vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set iskeyword+=$') -- treat dollar sign in words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
vim.o.hidden = globals.hidden_files -- Required to keep multiple buffers open multiple buffers
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.wo.wrap = globals.wrap_lines -- Display long lines as just one line
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('syntax on') -- syntax highlighting
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 1 -- Prompt line and space for displaying messages
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
-- vim.o.t_Co = "256" -- Support 256 colors -- NOTE: Breaks NeoVim
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.cmd('set ts=4') -- Insert 4 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = globals.number -- set numbered lines
vim.wo.relativenumber = globals.relative_number -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.scrolloff = 3 -- lines of text around cursor
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = globals.timeoutlen -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.guifont = "FiraCode Nerd Font:h17"

-- these two must be set bedore `packadd ...`
vim.g.nvim_tree_disable_netrw = 0 -- "1 by default, disables netrw
vim.g.nvim_tree_hijack_netrw = 0 --"1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)

vim.cmd('set ignorecase') -- case insensitive searching
vim.cmd('set smartcase') -- case-sensitive if expresson contains a capital letter
vim.cmd('set hlsearch') -- highlight search results
vim.cmd('set incsearch') -- set incremental search, like modern browsers
vim.cmd('set magic') -- Set magic on, for regex

vim.cmd('set nolist') -- hide invisible chars
vim.cmd('set listchars=tab:> ,space:·,eol:¬,trail:-,extends:❯,precedes:❮') -- ⚬ ● • ¤ » ø Θ 0 O ⟶  ⟼  ⏤ ⤚
vim.cmd('set showbreak=↪') -- ↩︎  …
