" タブ設定
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲

" pythonの場合はタブ幅を2に変更。タブはスペースに変換。
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END


"検索時に検索語をハイライト
set hlsearch

"ESC２回でハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>

" バックアップファイルを作らない
set nobackup

" スワップファイルを作らない
set noswapfile

" syntax on
syntax on

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

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4    " ファイラからファイルを開く際のオプション（4は常に同じバッファを使用）
let g:netrw_altv = 1
let g:netrw_winsize = -25       " ファイラのサイズ指定（負の数を指定することで割合ではなく絶対値）
nnoremap :t :Vexplore
"augroup ProjectDrawer
"  " autocmd!                    " autocmdを無効化する(source ~/.vimrc で再読込した際に2重処理されてしまうことを避ける?)
"  " vim起動時にVexploreを起動する
"  autocmd VimEnter * :Vexplore
"augroup END

" ビープ音を無効化する
set visualbell t_vb=
set noerrorbells

"""" memo
"" window幅の変更。幅は省略可能
"" <C-w> [幅]-
"" <C-w> [幅]-+
"" <C-w> [幅]-<
"" <C-w> [幅]->


