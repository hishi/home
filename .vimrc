"タブはスペース２つに変換
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

"検索時に検索語をハイライト
set hlsearch

"ESC２回でハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>

" バックアップファイルを作らない
set nobackup

" スワップファイルを作らない
set noswapfile

" カラースキーム
colorscheme molokai
"colorscheme koehler
"colorscheme evening
"colorscheme morning

" 括弧入力時に対応する括弧を強調
set showmatch
set matchtime=1

" 数字のインクリメントを+と-に変更
nnoremap + <C-a>
nnoremap - <C-x>

" vim内部で使用する文字コードをUTF8に設定
set encoding=utf-8
" ファイルを開いた際に指定する文字コードを以下に指定する（カンマ区切りで設定し、左から順に試して最初に成功した文字コードで読み込む）
set fileencodings=utf-8,sjis,iso-2022-jp

" netrwは常にtree view
let g:netrw_liststyle = 3
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1
" 'v'や'o'で開かれる新しいウィンドウのサイズを指定する
let g:netrw_winsize = 80

" ESCでIMEを確実にOFF
inoremap <ESC> <ESC>:set iminsert=0<CR>
