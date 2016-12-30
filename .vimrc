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

