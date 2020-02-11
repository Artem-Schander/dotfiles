let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/.dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +700 config/nvim/init.vim
badd +1 config/nvim/UltiSnips/php-laravel.snippets
badd +5 resources/xterm-256color-italic.terminfo
badd +60 config/alacritty/alacritty.yml.symlink
badd +287 zsh/zshrc.symlink
badd +32 tmux/tmux.conf.symlink
badd +46 tmux/tmux.conf.local.symlink
badd +75 zsh/settings/aliases.zsh
badd +309 config/i3/config.symlink
badd +1 install/tmux.sh
badd +175 install.sh
badd +80 config/nvim/plugins.vim
badd +1 install/pacman.sh
badd +526 config/kitty/kitty.conf
badd +35 ~/.config/kitty/kitty.conf
badd +70 install/brew.sh
badd +1 install/omz.sh
badd +1 install/kitty.sh
badd +51 install/emacs.sh
badd +26 install/link.sh
badd +1 install/setup_native_nfs_docker_osx.sh
badd +1 install/rofi.sh
badd +1 install/polybar.sh
badd +1 install/osx.sh
badd +1 install/nvm.sh
badd +14 install/nvim.sh
badd +1 emacs/doom/config.el.symlink
badd +1 emacs/doom/packages.el.symlink
badd +1 emacs/doom/init.el.symlink
badd +26 config/htop/htoprc
badd +1 README.md
badd +19 config/nvim/UltiSnips/php.snippets
badd +1 install/backup.sh
badd +13 applescripts/tunes.js
badd +1 config/ack/ackrc.symlink
badd +1 applescripts/mail.scpt
badd +1 applescripts/tunes.scpt
badd +1 bin/battery
badd +1 bin/colortest
badd +22 bin/24-bit-color
badd +1 bin/battery_indicator
badd +5 bin/confirm
badd +23 bin/extract
badd +3 bin/fh
badd +8 bin/fromhex
badd +1 bin/git-clc
badd +13 bin/git-kill
badd +3 bin/git-modified
badd +1 bin/isdir
badd +1 bin
badd +3 bin/isfile
badd +10 bin/login-shell
badd +1 bin/reload-browser
badd +1 bin/tm
badd +10 bin/yg
badd +1 config/kitty/sessions/dotfiles
badd +1 config/nvim/coc-settings.json
badd +1 config/nvim/UltiSnips/all.snippets
badd +1 config/nvim/UltiSnips/css.snippets
badd +1 config/nvim/UltiSnips/html.snippets
badd +1 config/nvim/UltiSnips/javascript.snippets
badd +1 config/nvim/UltiSnips/markdown.snippets
badd +1 config/nvim/UltiSnips/typescript.snippets
badd +78 config/nvim/autoload/functions.vim
badd +1 config/nvim/autoload/helpers/goyo.vim
badd +36 config/nvim/autoload/helpers/lightline.vim
badd +1 config/nvim/autoload/helpers/startify.vim
badd +1 config/nvim/ftdetect/html.vim
badd +1 config/nvim/ftdetect/javascript.vim
badd +1 config/nvim/ftdetect/json.vim
badd +1 config/nvim/ftdetect/markdown.vim
badd +1 config/nvim/ftdetect/ruby.vim
badd +1 config/nvim/ftdetect/docker.vim
badd +1 config/nvim/ftdetect/blade.vim
badd +1 config/nvim/ftdetect/phtml.vim
badd +1 config/nvim/ftdetect/php.vim
badd +1 config/nvim/ftdetect/conf.vim
badd +1 config/nvim/ftdetect/typescript.vim
badd +1 config/nvim/ftdetect/xml.vim
badd +1 config/nvim/ftplugin/git.vim
badd +1 config/nvim/ftplugin/help.vim
badd +1 config/nvim/ftplugin/html.vim
badd +1 config/nvim/ftplugin/javascript.vim
badd +1 config/nvim/ftplugin/markdown.vim
badd +1 config/nvim/ftplugin/ruby.vim
badd +1 config/nvim/ftplugin/typescript.vim
badd +1 config/nvim/ftplugin/vim.vim
badd +1 config/nvim/plugin/applylocalsettings.vim
badd +10 config/nvim/plugin/hiinterestingword.vim
badd +51 config/nvim/plugin/numbers.vim
badd +1 config/nvim/plugin/winmove.vim
badd +1 config/nvim/plugin/zoom.vim
badd +1 config/nvim/syntax/markdown.vim
badd +1 config/nvim/snippets/gitcommit.snippets
badd +1 config/nvim/snippets/html.snippets
badd +1 config/nvim/.netrwhist
badd +1 config/nvim/_plugins.vim
badd +1 config/nvim/new-init.vim
argglobal
%argdel
edit config/nvim/init.vim
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 723 - ((58 * winheight(0) + 40) / 81)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
723
normal! 0
lcd ~/.dotfiles
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOAIc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
