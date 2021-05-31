-- vim.g.onedark_style = 'darker'
vim.cmd('colorscheme ' .. globals.colorscheme)

-- TODO change php dollar sign color

-- colorscheme fixes
vim.cmd('highlight SignColumn guibg=' .. globals.colors.bg)
vim.cmd('highlight Normal guibg=' .. globals.colors.bg)
vim.cmd('highlight EndOfBuffer guibg=' .. globals.colors.bg)
vim.cmd('highlight SignColumn guibg=' .. globals.colors.bg)
vim.cmd('highlight NormalFloat guibg=' .. globals.colors.bg0)
vim.cmd('highlight FloatBorder guifg=' .. globals.colors.bg0 .. ' guibg=' .. globals.colors.bg0)
vim.cmd('highlight CursorLine guibg=' .. globals.colors.bg0)
vim.cmd('highlight MatchParen gui=NONE,bold guifg=' .. globals.colors.blue .. ' guibg=NONE')

-- treesitter
-- vim.cmd('highlight TSKeywordOperator guifg=#ABB2BF')

-- lsp
vim.cmd('highlight LspDiagnosticsDefaultError guifg=' .. globals.colors.dark_red)
vim.cmd('highlight LspDiagnosticsDefaultWarning guifg=' .. globals.colors.dark_yellow)
vim.cmd('highlight LspDiagnosticsDefaultInformation guifg=' .. globals.colors.fg)
vim.cmd('highlight LspDiagnosticsDefaultHint guifg=' .. globals.colors.comment_gray)

-- vim.cmd('highlight LspDiagnosticsVirtualTextError guifg=' .. globals.colors.red)
-- vim.cmd('highlight LspDiagnosticsVirtualTextWarning guifg=' .. globals.colors.orange)
-- vim.cmd('highlight LspDiagnosticsVirtualTextInformation guifg=' .. globals.colors.fg)
-- vim.cmd('highlight LspDiagnosticsVirtualTextHint guifg=' .. globals.colors.comment_gray)

-- vim.cmd('highlight LspDiagnosticsUnderlineError guifg=' .. globals.colors.red)
-- vim.cmd('highlight LspDiagnosticsUnderlineWarning guifg=' .. globals.colors.orange)
-- vim.cmd('highlight LspDiagnosticsUnderlineInformation guifg=' .. globals.colors.fg)
-- vim.cmd('highlight LspDiagnosticsUnderlineHint guifg=' .. globals.colors.comment_gray)

-- vim.cmd('highlight LspDiagnosticsSignError guifg=' .. globals.colors.red)
-- vim.cmd('highlight LspDiagnosticsSignWarning guifg=' .. globals.colors.orange)
-- vim.cmd('highlight LspDiagnosticsSignInformation guifg=' .. globals.colors.fg)
-- vim.cmd('highlight LspDiagnosticsSignHint guifg=' .. globals.colors.comment_gray)

-- not working
-- vim.cmd('highlight LspReferenceText guibg=' .. globals.colors.dark)
-- vim.cmd('highlight LspReferenceRead guibg=' .. globals.colors.dark)
-- vim.cmd('highlight LspReferenceWrite guibg=' .. globals.colors.dark)

-- barbar
vim.cmd('highlight BufferTabpageFill guifg=' .. globals.colors.bg0 .. ' guibg=NONE')
vim.cmd('highlight BufferOffset guibg=NONE')
vim.cmd('highlight BufferCurrent guifg=' .. globals.colors.white .. ' guibg=NONE')
vim.cmd('highlight BufferCurrentMod guifg=' .. globals.colors.yellow .. ' guibg=NONE')

vim.cmd('highlight BufferCurrentSign guifg=' .. globals.colors.blue .. ' guibg=NONE')
vim.cmd('highlight BufferInactive guibg=NONE')
vim.cmd('highlight BufferInactiveMod guifg=' .. globals.colors.orange .. ' guibg=NONE')

vim.cmd('highlight BufferInactiveSign guifg=#282c3')
-- vim.cmd('highlight BufferInactive guifg=' .. globals.colors.comment_gray .. ' guibg=NONE')
vim.cmd('highlight BufferInactiveSign guifg=' .. globals.colors.bg0 .. ' guibg=NONE')

vim.cmd('highlight BufferVisible guifg=' .. globals.colors.fg .. ' guibg=NONE')
vim.cmd('highlight BufferVisibleIndex guibg=NONE')
vim.cmd('highlight BufferVisibleMod guibg=NONE')
vim.cmd('highlight BufferVisibleSign guifg=' .. globals.colors.gray .. ' guibg=NONE')
vim.cmd('highlight BufferVisibleTarget guibg=NONE')

-- git gutter
vim.cmd('highlight GitSignsAdd guifg=' .. globals.colors.green .. ' guibg=NONE')
vim.cmd('highlight GitSignsChange guifg=' .. globals.colors.yellow .. ' guibg=NONE')
vim.cmd('highlight GitSignsDelete guifg=' .. globals.colors.red .. ' guibg=NONE')
vim.cmd('highlight GitSignsCurrentLineBlame guifg=' .. globals.colors.diff_blue)

-- vim.cmd('highlight DiffAdd guifg=' .. globals.colors.bg .. ' ctermfg=234 guibg=' .. globals.colors.green .. ' ctermbg=114 gui=NONE cterm=NONE')
-- vim.cmd('highlight DiffDelete guifg=' .. globals.colors.bg .. ' ctermfg=234 guibg=' .. globals.colors.red .. ' ctermbg=168 gui=NONE cterm=NONE')
-- vim.cmd('highlight DiffChange guifg=' .. globals.colors.bg .. ' ctermfg=234 guibg=' .. globals.colors.yellow .. ' ctermbg=180 gui=NONE cterm=NONE')

-- indent lines
vim.cmd('highlight IndentBlanklineChar guifg=' .. globals.colors.bg0 .. ' guibg=NONE')

-- file tree
vim.cmd('highlight NvimTreeIndentMarker guifg=' .. globals.colors.bg0 .. ' guibg=NONE')
vim.cmd('highlight NvimTreeGitNew guifg=' .. globals.colors.green .. ' guibg=NONE')
vim.cmd('highlight NvimTreeFileNew guifg=' .. globals.colors.green .. ' guibg=NONE')
vim.cmd('highlight NvimTreeGitDirty guifg=' .. globals.colors.yellow .. ' guibg=NONE')
vim.cmd('highlight NvimTreeFileDirty guifg=' .. globals.colors.yellow .. ' guibg=NONE')
vim.cmd('highlight NvimTreeNormal guibg=' .. globals.colors.bg)
vim.cmd('highlight NvimTreeEndOfBuffer guibg=' .. globals.colors.bg)

-- telescope
vim.cmd('highlight TelescopeBorder guifg=' .. globals.colors.comment_gray)
vim.cmd('highlight TelescopeSelectionCaret guifg=' .. globals.colors.green .. ' guibg=NONE')
vim.cmd('highlight TelescopeSelection guifg=' .. globals.colors.green .. ' guibg=NONE')

-- easymotion
vim.cmd('highlight EasyMotionTarget ctermbg=none ctermfg=green guifg=' .. globals.colors.yellow)
vim.cmd('highlight EasyMotionShade ctermbg=none ctermfg=blue guifg=' .. globals.colors.comment_gray)
vim.cmd('highlight EasyMotionTarget2First ctermbg=none ctermfg=red guifg=' .. globals.colors.yellow)
vim.cmd('highlight EasyMotionTarget2Second ctermbg=none ctermfg=lightred guifg=' .. globals.colors.orange)
-- hi EasyMotionMoveHL ctermbg=green ctermfg=black
-- hi EasyMotionIncSearch ctermbg=green ctermfg=black

-- startify
vim.cmd('highlight StartifyHeader guifg=' .. globals.colors.comment_gray)
vim.cmd('highlight StartifyFooter guifg=' .. globals.colors.white)
vim.cmd('highlight StartifySection guifg=' .. globals.colors.orange)
vim.cmd('highlight StartifySpecial guifg=' .. globals.colors.magenta)
vim.cmd('highlight SignatureMarkText guifg=' .. globals.colors.white)

-- whitespace
vim.cmd('highlight ExtraWhitespace guibg=' .. globals.colors.red)
-- vim.cmd('highlight MatchPare guifg=' .. globals.colors.blue)


-- which key
vim.cmd('highlight WhichKeyGroup guifg=' .. globals.colors.magenta)
-- TODO: remove black border from which key floating window
