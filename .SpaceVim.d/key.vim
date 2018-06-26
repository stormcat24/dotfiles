"基本設定
"" 行頭、行末にジャンプ
nnoremap 1 ^
nnoremap 0 $

"" 十字キーを禁止
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

""セミコロンでコマンドモードへ
noremap ; :

"insertモード
"" insertモードを抜ける
inoremap <silent> jj <ESC>

" 移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"" 削除系
" TODO

"<space>j, <space>kで画面送り
noremap <Space>j <C-f>
noremap <Space>k <C-b>

"ESC2回で検索ハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"フレームサイズを怠惰に変更する
map <kPlus> <C-W>+
map <kMinus> <C-W>-
"unite.vim
nmap <Leader>f [unite]

"tagbar用
nmap <F8> :TagbarToggle<CR>

"Quickfixを開く
nmap <F5> :copen<CR>

"Gitv!
nmap <F6> :Gitv!<CR>

"VimShell
noremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>

function! s:goback_insert(key)
  return "gi" . a:key . neocomplcache#cancel_popup()
endfunction

nnoremap <expr> OA <SID>goback_insert("\<Up>")
nnoremap <expr> OB <SID>goback_insert("\<Down>")
nnoremap <expr> OC <SID>goback_insert("\<Right>")
nnoremap <expr> OD <SID>goback_insert("\<Left>")
nnoremap <expr> OF <SID>goback_insert("\<End>")
nnoremap <expr> OH <SID>goback_insert("\<Home>")
nnoremap <expr> [3~ <SID>goback_insert("\<Del>")
nnoremap <expr> [5~ <SID>goback_insert("\<PageUp>")
nnoremap <expr> [6~ <SID>goback_insert("\<PageDown>")

"TweetVim
"TweetVimSay
nnoremap <silent> ss :TweetVimSay<CR>

"yankaround
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 50
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
" }}}

"neoterm
let g:neoterm_automap_keys = ',tt'

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

" Git commands
command! -nargs=+ Tg :T git <args>
