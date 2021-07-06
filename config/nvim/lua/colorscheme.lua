-- vim.g.onedark_style = 'darker'
-- vim.cmd('colorscheme ' .. Globals.colorscheme)

-- TODO move fixes to custom theme

-- colorscheme fixes
vim.cmd('highlight SignColumn guibg=' .. Globals.colors.bg)
vim.cmd('highlight Normal guibg=' .. Globals.colors.bg)
vim.cmd('highlight EndOfBuffer guibg=' .. Globals.colors.bg)
vim.cmd('highlight SignColumn guibg=' .. Globals.colors.bg)
vim.cmd('highlight NormalFloat guibg=' .. Globals.colors.bg0)
vim.cmd('highlight FloatBorder guifg=' .. Globals.colors.bg0 .. ' guibg=' .. Globals.colors.bg0)
vim.cmd('highlight CursorLine guibg=' .. Globals.colors.bg0)
vim.cmd('highlight MatchParen gui=NONE,bold guifg=' .. Globals.colors.blue .. ' guibg=NONE')

-- treesitter
-- vim.cmd('highlight TSKeywordOperator guifg=#ABB2BF')

-- -- lsp
-- vim.cmd('highlight LspDiagnosticsDefaultError guifg=' .. Globals.colors.dark_red)
-- vim.cmd('highlight LspDiagnosticsDefaultWarning guifg=' .. Globals.colors.dark_yellow)
-- vim.cmd('highlight LspDiagnosticsDefaultInformation guifg=' .. Globals.colors.fg)
-- vim.cmd('highlight LspDiagnosticsDefaultHint guifg=' .. Globals.colors.comment_gray)

-- vim.cmd('highlight LspDiagnosticsVirtualTextError guifg=' .. Globals.colors.red)
-- vim.cmd('highlight LspDiagnosticsVirtualTextWarning guifg=' .. Globals.colors.orange)
-- vim.cmd('highlight LspDiagnosticsVirtualTextInformation guifg=' .. Globals.colors.fg)
-- vim.cmd('highlight LspDiagnosticsVirtualTextHint guifg=' .. Globals.colors.comment_gray)

-- vim.cmd('highlight LspDiagnosticsUnderlineError guifg=' .. Globals.colors.red)
-- vim.cmd('highlight LspDiagnosticsUnderlineWarning guifg=' .. Globals.colors.orange)
-- vim.cmd('highlight LspDiagnosticsUnderlineInformation guifg=' .. Globals.colors.fg)
-- vim.cmd('highlight LspDiagnosticsUnderlineHint guifg=' .. Globals.colors.comment_gray)

-- vim.cmd('highlight LspDiagnosticsSignError guifg=' .. Globals.colors.red)
-- vim.cmd('highlight LspDiagnosticsSignWarning guifg=' .. Globals.colors.orange)
-- vim.cmd('highlight LspDiagnosticsSignInformation guifg=' .. Globals.colors.fg)
-- vim.cmd('highlight LspDiagnosticsSignHint guifg=' .. Globals.colors.comment_gray)

-- vim.cmd('highlight LspReferenceText guibg=' .. Globals.colors.black)
-- vim.cmd('highlight LspReferenceRead guibg=' .. Globals.colors.black)
-- vim.cmd('highlight LspReferenceWrite guibg=' .. Globals.colors.black)

-- barbar
vim.cmd('highlight BufferTabpageFill guifg=' .. Globals.colors.bg0 .. ' guibg=NONE')
vim.cmd('highlight BufferOffset guibg=NONE')
vim.cmd('highlight BufferCurrent guifg=' .. Globals.colors.white .. ' guibg=NONE')
vim.cmd('highlight BufferCurrentMod guifg=' .. Globals.colors.yellow .. ' guibg=NONE')

vim.cmd('highlight BufferCurrentSign guifg=' .. Globals.colors.blue .. ' guibg=NONE')
vim.cmd('highlight BufferInactive guibg=NONE')
vim.cmd('highlight BufferInactiveMod guifg=' .. Globals.colors.orange .. ' guibg=NONE')

vim.cmd('highlight BufferInactiveSign guifg=#282c3')
-- vim.cmd('highlight BufferInactive guifg=' .. Globals.colors.comment_gray .. ' guibg=NONE')
vim.cmd('highlight BufferInactiveSign guifg=' .. Globals.colors.bg0 .. ' guibg=NONE')

vim.cmd('highlight BufferVisible guifg=' .. Globals.colors.fg .. ' guibg=NONE')
vim.cmd('highlight BufferVisibleIndex guibg=NONE')
vim.cmd('highlight BufferVisibleMod guibg=NONE')
vim.cmd('highlight BufferVisibleSign guifg=' .. Globals.colors.gray .. ' guibg=NONE')
vim.cmd('highlight BufferVisibleTarget guibg=NONE')

-- git gutter
vim.cmd('highlight GitSignsAdd guifg=' .. Globals.colors.green .. ' guibg=NONE')
vim.cmd('highlight GitSignsChange guifg=' .. Globals.colors.yellow .. ' guibg=NONE')
vim.cmd('highlight GitSignsDelete guifg=' .. Globals.colors.red .. ' guibg=NONE')
vim.cmd('highlight GitSignsCurrentLineBlame guifg=' .. Globals.colors.diff_blue)

-- vim.cmd('highlight DiffAdd guifg=' .. Globals.colors.bg .. ' ctermfg=234 guibg=' .. Globals.colors.green .. ' ctermbg=114 gui=NONE cterm=NONE')
-- vim.cmd('highlight DiffDelete guifg=' .. Globals.colors.bg .. ' ctermfg=234 guibg=' .. Globals.colors.red .. ' ctermbg=168 gui=NONE cterm=NONE')
-- vim.cmd('highlight DiffChange guifg=' .. Globals.colors.bg .. ' ctermfg=234 guibg=' .. Globals.colors.yellow .. ' ctermbg=180 gui=NONE cterm=NONE')

-- indent lines
vim.cmd('highlight IndentBlanklineChar guifg=' .. Globals.colors.bg0 .. ' guibg=NONE')
vim.cmd('highlight IndentBlanklineContextChar guifg=' .. Globals.colors.bg3 .. ' guibg=NONE')

-- file tree
vim.cmd('highlight NvimTreeIndentMarker guifg=' .. Globals.colors.bg0 .. ' guibg=NONE')
vim.cmd('highlight NvimTreeGitNew guifg=' .. Globals.colors.green .. ' guibg=NONE')
vim.cmd('highlight NvimTreeFileNew guifg=' .. Globals.colors.green .. ' guibg=NONE')
vim.cmd('highlight NvimTreeGitDirty guifg=' .. Globals.colors.yellow .. ' guibg=NONE')
vim.cmd('highlight NvimTreeFileDirty guifg=' .. Globals.colors.yellow .. ' guibg=NONE')
vim.cmd('highlight NvimTreeNormal guibg=' .. Globals.colors.bg)
vim.cmd('highlight NvimTreeEndOfBuffer guibg=' .. Globals.colors.bg)

-- telescope
vim.cmd('highlight TelescopeBorder guifg=' .. Globals.colors.comment_gray)
vim.cmd('highlight TelescopeSelectionCaret guifg=' .. Globals.colors.green .. ' guibg=NONE')
vim.cmd('highlight TelescopeSelection guifg=' .. Globals.colors.green .. ' guibg=NONE')

-- easymotion
vim.cmd('highlight EasyMotionTarget ctermbg=none ctermfg=green guifg=' .. Globals.colors.yellow)
vim.cmd('highlight EasyMotionShade ctermbg=none ctermfg=blue guifg=' .. Globals.colors.comment_gray)
vim.cmd('highlight EasyMotionTarget2First ctermbg=none ctermfg=red guifg=' .. Globals.colors.yellow)
vim.cmd('highlight EasyMotionTarget2Second ctermbg=none ctermfg=lightred guifg=' .. Globals.colors.orange)
-- hi EasyMotionMoveHL ctermbg=green ctermfg=black
-- hi EasyMotionIncSearch ctermbg=green ctermfg=black

-- startify
vim.cmd('highlight StartifyHeader guifg=' .. Globals.colors.comment_gray)
vim.cmd('highlight StartifyFooter guifg=' .. Globals.colors.white)
vim.cmd('highlight StartifySection guifg=' .. Globals.colors.orange)
vim.cmd('highlight StartifySpecial guifg=' .. Globals.colors.magenta)
vim.cmd('highlight SignatureMarkText guifg=' .. Globals.colors.white)

-- whitespace
vim.cmd('highlight ExtraWhitespace guibg=' .. Globals.colors.red)
-- vim.cmd('highlight MatchPare guifg=' .. Globals.colors.blue)


-- which key
vim.cmd('highlight WhichKeyGroup guifg=' .. Globals.colors.magenta)
-- TODO: remove black border from which key floating window
