---  HELPERS  ---

local cmd = vim.cmd
local opt = vim.opt

---  VIM ONLY COMMANDS  ---

cmd "filetype plugin on"
cmd('let &titleold="' .. TERMINAL .. '"')
cmd "set inccommand=split"
-- cmd "set iskeyword+=-"
cmd "set iskeyword+=$"
cmd "set whichwrap+=<,>,[,],h,l"
cmd 'set incsearch' -- set incremental search, like modern browsers
cmd 'set magic' -- Set magic on, for regex

cmd 'set nolist' -- hide invisible chars
cmd 'set listchars=tab:> ,space:·,eol:¬,trail:-,extends:❯,precedes:❮' -- ⚬ ● • ¤ » ø Θ 0 O ⟶  ⟼  ⏤ ⤚
cmd 'set showbreak=↪' -- ↩︎  …

if Globals.transparent_window then
  cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
  cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
end

--- COLORSCHEME ---

vim.g.colors_name = Globals.colorscheme

---  SETTINGS  ---

opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.o.cmdheight = 1 -- Prompt line and space for displaying messages
vim.o.scrolloff = 3 -- lines of text around cursor
opt.colorcolumn = "99999" -- fix indentline for now
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.guifont = "FiraCode Nerd Font:h17" -- the font used in graphical neovim applications
opt.hidden = Globals.hidden_files -- required to keep multiple buffers and open multiple buffers
opt.hlsearch = Globals.hl_search -- highlight all matches on previous search pattern
opt.ignorecase = Globals.ignore_case -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- always show tabs
opt.smartcase = Globals.smart_case -- smart case
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = Globals.timeoutlen -- time to wait for a mapped sequence to complete (in milliseconds)
opt.title = true -- set the title of window to the value of the titlestring
opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
opt.undodir = CACHE_PATH .. "/undo" -- set an undo directory
opt.undofile = true -- enable persisten undo
opt.updatetime = 300 -- faster completion
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
opt.shortmess:append "c"
opt.tabstop = 4 -- insert 4 spaces for a tab
opt.cursorline = Globals.cursorline -- highlight the current line
opt.number = Globals.number -- set numbered lines
opt.relativenumber = Globals.relative_number -- set relative numbered lines
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = Globals.wrap_lines -- display lines as one long line


-- these two must be set bedore `packadd ...`
vim.g.nvim_tree_disable_netrw = 0 -- "1 by default, disables netrw
vim.g.nvim_tree_hijack_netrw = 0 --"1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)



-- -- vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
-- vim.cmd('set iskeyword+=$') -- treat dollar sign in words as a word text object"
-- vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
-- vim.cmd('set inccommand=split') -- Make substitution work in realtime
-- vim.o.hidden = Globals.hidden_files -- Required to keep multiple buffers open multiple buffers
-- vim.o.title = true
-- TERMINAL = vim.fn.expand('$TERMINAL')
-- vim.cmd('let &titleold="'..TERMINAL..'"')
-- vim.o.titlestring="%<%F%=%l/%L - nvim"
-- vim.wo.wrap = Globals.wrap_lines -- Display long lines as just one line
-- vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
-- vim.cmd('syntax on') -- syntax highlighting
-- vim.o.pumheight = 10 -- Makes popup menu smaller
-- vim.o.fileencoding = "utf-8" -- The encoding written to file
-- vim.o.cmdheight = 1 -- Prompt line and space for displaying messages
-- vim.cmd('set colorcolumn=99999') -- fix indentline for now
-- vim.o.mouse = "a" -- Enable your mouse
-- vim.o.splitbelow = true -- Horizontal splits will automatically be below
-- vim.o.termguicolors = true -- set term gui colors most terminals support this
-- vim.o.splitright = true -- Vertical splits will automatically be to the right
-- -- vim.o.t_Co = "256" -- Support 256 colors -- NOTE: Breaks NeoVim
-- vim.o.conceallevel = 0 -- So that I can see `` in markdown files
-- vim.cmd('set ts=4') -- Insert 4 spaces for a tab
-- vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
-- vim.cmd('set expandtab') -- Converts tabs to spaces
-- vim.bo.smartindent = true -- Makes indenting smart
-- vim.wo.number = Globals.number -- set numbered lines
-- vim.wo.relativenumber = Globals.relative_number -- set relative number
-- vim.wo.cursorline = true -- Enable highlighting of the current line
-- vim.o.showtabline = 2 -- Always show tabs
-- vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
-- vim.o.scrolloff = 3 -- lines of text around cursor
-- vim.o.backup = false -- This is recommended by coc
-- vim.o.writebackup = false -- This is recommended by coc
-- vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
-- vim.o.updatetime = 300 -- Faster completion
-- vim.o.timeoutlen = Globals.timeoutlen -- By default timeoutlen is 1000 ms
-- vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
-- vim.o.guifont = "FiraCode Nerd Font:h17"

-- -- these two must be set bedore `packadd ...`
-- vim.g.nvim_tree_disable_netrw = 0 -- "1 by default, disables netrw
-- vim.g.nvim_tree_hijack_netrw = 0 --"1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)

-- vim.cmd('set ignorecase') -- case insensitive searching
-- vim.cmd('set smartcase') -- case-sensitive if expresson contains a capital letter
-- vim.cmd('set hlsearch') -- highlight search results
-- vim.cmd('set incsearch') -- set incremental search, like modern browsers
-- vim.cmd('set magic') -- Set magic on, for regex

-- vim.cmd('set nolist') -- hide invisible chars
-- vim.cmd('set listchars=tab:> ,space:·,eol:¬,trail:-,extends:❯,precedes:❮') -- ⚬ ● • ¤ » ø Θ 0 O ⟶  ⟼  ⏤ ⤚
-- vim.cmd('set showbreak=↪') -- ↩︎  …
