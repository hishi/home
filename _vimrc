"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" エンコード
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding cp932
set nocompatible
set encoding=cp932
set fileencoding=cp932
set fileencodings=utf-8,cp932,sjis,euc-jp,iso-2022-jp
set fileformat=dos
set fileformats=dos,unix,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" タブ設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set list
set listchars=tab:^-,trail:-,nbsp:%

" 改行文字とタブ文字の色設定（NonTextが改行、SpecialKeyがタブ）
"hi NonText guibg=NONE guifg=DarkGreen
"hi SpecialKey guibg=NONE guifg=Gray40

" pythonの場合はタブ幅を2に変更。タブはスペースに変換。
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.py  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
"set colorcolumn=80
set hlsearch
set showmatch
set matchtime=1
set number
language C
set nowrap

if has('unix') 
	" Unix 用設定
	"colorscheme molokai
	"colorscheme koehler
	"colorscheme evening
	"colorscheme morning
endif
if has('win64')
	" Windows 用設定
endif

" 全角スペースの表示
" function! ZenkakuSpace()
"     highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
" endfunction
" 
" if has('syntax')
"     augroup ZenkakuSpace
"         autocmd!
"         autocmd ColorScheme * call ZenkakuSpace()
"         autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
"     augroup END
"     call ZenkakuSpace()
" endif
""""""""""""""""""""""""""""""

"" カレント行のハイライトON
set cursorline
" アンダーラインを引く(color terminal)
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" アンダーラインを引く(gui)
highlight CursorLine gui=underline ctermfg=NONE ctermbg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <ESC><ESC> :nohlsearch<CR>
" nnoremap + <C-a>
" nnoremap - <C-x>
vmap <C-C> "*y
imap <C-V> <ESC>"*Pa
vmap <C-V> d"*P
vmap <C-X> "*d<ESC>
nnoremap <C-a> ggVG

" inoremap <C-\;> <C-R>=strftime('%Y-%m-%d')<CR>
" inoremap <C-\:> <C-R>=strftime('%H:%M:%S')<CR>
" inoremap ,todo <C-R>=strftime('%Y-%m-%d %a')<CR>
" inoremap ,date <C-R>=strftime('%Y-%m-%d')<CR>
" inoremap ,time <C-R>=strftime('%H:%M:%S')<CR>

" :b<space>時、:bd<space>時に、ls結果を表示する
cnoreabb <expr>b  getcmdtype()==':' && getcmdline()=='b'  ? 'ls<CR>:b'  : 'b'
cnoreabb <expr>bd getcmdtype()==':' && getcmdline()=='bd' ? 'ls<CR>:bd' : 'bd'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" messagesファイルは自動Syntax有効
autocmd BufNewFile,BufReadPost *messages* :set filetype=messages

" Oracleアラートログ用
autocmd BufNewFile,BufReadPost alert*.log :set filetype=log

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows標準のfindstrではなく、MSYS2 64bitのgrepを使う
" grep時に自動でquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set confirm
set hidden
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set noswapfile
set backspace=indent,eol,start
set shellslash

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" mdファイル新規作成時にテンプレートを読み込む
autocmd BufNewFile *.md 0r $HOME/.vim/template/md.txt

" 保存時に折りたたみも自動保存。起動時に折りたたみを自動起動
autocmd BufWinLeave *.md silent mkview
autocmd BufWinEnter *.md silent loadview

" insert mode時にIMEをOFF
autocmd insertEnter * set iminsert=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim
call plug#begin('~/.vim/plugged')

"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimproc.vim'
"Plug 'airblade/vim-gitgutter'
"Plug 'aserebryakov/vim-todo-lists'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'glidenote/memolist.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
"Plug 'rking/ag.vim'
"Plug 'thinca/vim-quickrun'
"Plug 'tpope/vim-fugitive'
Plug 'tyru/caw.vim'
Plug 'mhinz/vim-startify'
Plug 'reireias/vim-cheatsheet'
Plug 'osyo-manga/vim-over'
Plug 'vim-scripts/vtreeexplorer'

Plug 'fuenor/qfixgrep'

Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'thinca/vim-fontzoom'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 検索対象外設定
set wildignore+=bin,Excel,GNS3,Heroku,media,Oracle,VirtualBoxVMs
" 検索対象外ディレクトリ
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|ssh|vim|svn|vagrant|vagrant.d)$',
  \ 'file': '\v\.(exe|so|dll|iso|tgz|zip|jpg|iso|lnk)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" vim終了時にキャッシュを削除しない
let g:ctrlp_clear_cache_on_exit = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" caw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-over
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabb <silent><expr>s getcmdtype()==':' && getcmdline()=~'^s' ? 'OverCommandLine<CR><C-u>%s/<C-r>=get([], getchar(0), '')<CR>' : 's'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vtreeexplorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 縦分割
let g:treeExplVertical=1

" 分割したウィンドウサイズ
let g:treeExplWinSize=35

" 常に起動する
" autocmd VimEnter * execute 'VST'

" NERDTreeだけ残る場合はウィンドウを閉じる
autocmd bufenter * if (winnr("$") == 1 && buflisted("TreeExplorer") == 1) | q | endif

function! MyFunc()
	if buflisted("TreeExplorer") == 0
		execute 'VST'
	else
		let tmp = win_gotoid(bufwinid("TreeExplorer"))
		q
	endif
endfunction

" C-nでNERDTreeの表示／非表示を切り替え
map <silent> <C-n> :call MyFunc()<CR>

" 起動時にフォーカスをファイルに向ける
autocmd VimEnter * wincmd p


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *mkd :set filetype=markdown
autocmd BufRead,BufNewFile *md  :set filetype=markdown

let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime=1

