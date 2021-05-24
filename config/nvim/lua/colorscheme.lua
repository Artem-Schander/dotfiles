vim.cmd('colorscheme ' .. globals.colorscheme)

local colors = {
    black = '#1e2127',
    dark_gray = '#282c34',
    gutter_gray = '#4b5263',
    comment_gray = '#5c6370',
    light_gray = '#abb2bf',
    white = '#c3ccdc',
    red = '#e06c75',
    dark_red = '#be5046',
    green = '#98c379',
    blue = '#61afef',
    magenta = '#c678dd',
    cyan = '#56b6c2',
    yellow = '#e5c07b',
    dark_yellow = '#d19a66',
}

-- TODO change php dollar sign color

-- treesitter
-- vim.cmd('highlight TSKeywordOperator guifg=#ABB2BF')

-- lsp
vim.cmd('highlight LspDiagnosticsDefaultError guifg=' .. colors.red)
vim.cmd('highlight LspDiagnosticsDefaultWarning guifg=' .. colors.dark_yellow)
vim.cmd('highlight LspDiagnosticsDefaultInformation guifg=' .. colors.light_gray)
vim.cmd('highlight LspDiagnosticsDefaultHint guifg=' .. colors.comment_gray)

-- vim.cmd('highlight LspDiagnosticsVirtualTextError guifg=' .. colors.red)
-- vim.cmd('highlight LspDiagnosticsVirtualTextWarning guifg=' .. colors.dark_yellow)
-- vim.cmd('highlight LspDiagnosticsVirtualTextInformation guifg=' .. colors.light_gray)
-- vim.cmd('highlight LspDiagnosticsVirtualTextHint guifg=' .. colors.comment_gray)

-- vim.cmd('highlight LspDiagnosticsUnderlineError guifg=' .. colors.red)
-- vim.cmd('highlight LspDiagnosticsUnderlineWarning guifg=' .. colors.dark_yellow)
-- vim.cmd('highlight LspDiagnosticsUnderlineInformation guifg=' .. colors.light_gray)
-- vim.cmd('highlight LspDiagnosticsUnderlineHint guifg=' .. colors.comment_gray)

-- vim.cmd('highlight LspDiagnosticsSignError guifg=' .. colors.red)
-- vim.cmd('highlight LspDiagnosticsSignWarning guifg=' .. colors.dark_yellow)
-- vim.cmd('highlight LspDiagnosticsSignInformation guifg=' .. colors.light_gray)
-- vim.cmd('highlight LspDiagnosticsSignHint guifg=' .. colors.comment_gray)

-- git gutter
vim.cmd('highlight DiffAdd guifg=' .. colors.black .. ' ctermfg=234 guibg=' .. colors.green .. ' ctermbg=114 gui=NONE cterm=NONE')
vim.cmd('highlight DiffDelete guifg=' .. colors.black .. ' ctermfg=234 guibg=' .. colors.red .. ' ctermbg=168 gui=NONE cterm=NONE')
vim.cmd('highlight DiffChange guifg=' .. colors.black .. ' ctermfg=234 guibg=' .. colors.dark_yellow .. ' ctermbg=180 gui=NONE cterm=NONE')

-- indent lines
vim.cmd('hi! IndentBlanklineChar guifg=' .. colors.dark_gray .. ' guibg=NONE')

-- file tree
vim.cmd('hi! NvimTreeIndentMarker guifg=' .. colors.dark_gray .. ' guibg=NONE')
vim.cmd('hi! NvimTreeGitNew guifg=' .. colors.green .. ' guibg=NONE')
vim.cmd('hi! NvimTreeFileNew guifg=' .. colors.green .. ' guibg=NONE')
vim.cmd('hi! NvimTreeGitDirty guifg=' .. colors.dark_yellow .. ' guibg=NONE')
vim.cmd('hi! NvimTreeFileDirty guifg=' .. colors.dark_yellow .. ' guibg=NONE')

-- telescope
vim.cmd('highlight TelescopeBorder guifg=' .. colors.comment_gray)
vim.cmd('highlight TelescopeSelectionCaret guifg=' .. colors.green)
vim.cmd('highlight TelescopeSelection guifg=' .. colors.green)

-- which key
vim.cmd('highlight WhichKeyGroup guifg=' .. colors.magenta)
-- TODO: remove black border from which key floating window
