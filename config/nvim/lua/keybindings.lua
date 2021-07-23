-- vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- Set leader
if Globals.leader_key == " " or Globals.leader_key == "space" then
    vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
    vim.g.mapleader = " "
else
    vim.api.nvim_set_keymap("n", Globals.leader_key, "<NOP>", { noremap = true, silent = true })
    vim.g.mapleader = Globals.leader_key
end

-- switch between current and last buffer
vim.api.nvim_set_keymap('n', '<Leader>.', '<c-^>', {noremap = true, silent = true})

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>a', ':Telescope find_files find_command=rg,--smart-case,--files,--follow,--no-ignore,--hidden<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>bf', ':Telescope buffers<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope git_files<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<Leader>p', ':Telescope find_files hidden=true<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<Leader>r', ':Telescope lsp_document_symbols<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>r', ':Telescope lsp_document_symbols<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>w', ':Telescope live_grep<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>g', ':Telescope grep_string<CR>', {noremap = true, silent = true})

-- dashboard
vim.api.nvim_set_keymap('n', '<Leader>;', ':Dashboard<CR>', {noremap = true, silent = true})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

-- close buffer
vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>", {noremap = true, silent = true})

-- relative line numbers
local modes = {'n', 'x', 'o'}
for i,mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, "<leader>;", ":ToggleRelativeLineNumbers<CR>", {noremap = true, silent = true})
end

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- TODO fix this
-- resize with arrows
vim.cmd([[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Left>  :vertical resize +2<CR>
  nnoremap <silent> <C-Right> :vertical resize -2<CR>
]])

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<', '<<', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '>', '>>', {noremap = true, silent = true})

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Scroll faster
vim.api.nvim_set_keymap('n', '<C-e>', '3<C-e>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-y>', '3<C-y>', {noremap = true, silent = true})

-- Toggle hidden chars
vim.api.nvim_set_keymap('n', '<Leader>l', ':set list!<cr>:IndentBlanklineToggle<cr>', {noremap = true, silent = true})

-- Deal with other peoples code
vim.api.nvim_set_keymap('n', '\\t', ':set ts=4 sts=4 sw=4 noet<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\\s', ':set ts=4 sts=4 sw=4 et<cr>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Move current line / block with Alt-j/k ala vscode.
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", { noremap = true, silent = true })

-- QuickFix
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>", { noremap = true, silent = true })

-- Better nav for omnicomplete
vim.cmd 'inoremap <expr> <c-j> ("\\<C-n>")'
vim.cmd 'inoremap <expr> <c-k> ("\\<C-p>")'

-- vim.cmd 'vnoremap p "0p'
-- vim.cmd 'vnoremap P "0P'

-- vim.api.nvim_set_keymap('v', 'p', '"0p', {silent = true})
-- vim.api.nvim_set_keymap('v', 'P', '"0P', {silent = true})

-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- vim.api.nvim_set_keymap('i', '<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- vim.cmd([[
-- map p <Plug>(miniyank-autoput)
-- map P <Plug>(miniyank-autoPut)
-- map <leader>n <Plug>(miniyank-cycle)
-- map <leader>N <Plug>(miniyank-cycleback)
-- ]])

-- Toggle the QuickFix window
vim.api.nvim_set_keymap("", "<C-q>", ":call QuickFixToggle()<CR>", { noremap = true, silent = true })

