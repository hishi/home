"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" エンコード
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding cp932
set nocompatible
set encoding=cp932
set fileencoding=cp932
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
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
set colorcolumn=80
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
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap + <C-a>
nnoremap - <C-x>
vmap <C-C> "*y
imap <C-V> <ESC>"*pa
vmap <C-V> d"*P
vmap <C-X> "*d<ESC>

" inoremap <C-\;> <C-R>=strftime('%Y-%m-%d')<CR>
" inoremap <C-\:> <C-R>=strftime('%H:%M:%S')<CR>
" inoremap ,todo <C-R>=strftime('%Y-%m-%d %a')<CR>
" inoremap ,date <C-R>=strftime('%Y-%m-%d')<CR>
" inoremap ,time <C-R>=strftime('%H:%M:%S')<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim
call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'airblade/vim-gitgutter'
Plug 'aserebryakov/vim-todo-lists'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'glidenote/memolist.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'rking/ag.vim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-fugitive'
Plug 'tyru/caw.vim'
Plug 'mhinz/vim-startify'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown, previm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *.md の場合は filetype=markdownとする
let g:vim_markdown_folding_disabled = 1
au BufRead,BufNewFile *.md set filetype=markdown

" p でPrevimOpen を補完
nnoremap :p :PrevimOpen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickrun
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
let g:quickrun_oracle_conn = 'system/welcome1@10.1.0.11/orcl'
let g:quickrun_config = {}
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config['sql'] = {
\ 'exec': '%c %o \@%s',
\ 'command': 'sqlplus',
\ 'cmdopt': '-S %{get(g:, "quickrun_oracle_conn", "/nolog")}',
\ 'hook/output_encode/encoding': 'sjis',
\ 'hook/eval/enable': 1,
\ 'hook/eval/template':
\   'set colsep "|"' . "\r" .
\   'set tab off' . "\r" .
\   'set feedback off' . "\r" .
\   'set linesize 200' . "\r" .
\   '%s' . "\r" .
\   'exit',
\}

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

" let g:ctrlp_use_caching=0
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_enable_ignore_case=1
let g:unite_enable_smart_case=1

" grep 検索
nnoremap <silent> ,g  :<C-u>Unite grep:  -buffer-name=search-buffer<CR>
" カーソル位置の単語を grep 検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R>

" grep 検索結果の再呼出
nnoremap <silent> ,r :<C-u>UniteResume search-buffer<CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--vimgrep --nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" memolist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_suffix = "txt"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
"let g:memolist_memo_date = "epoch"
"let g:memolist_memo_date = "%D %T"
"let g:memolist_prompt_tags = 1
"let g:memolist_prompt_categories = 1
"let g:memolist_qfixgrep = 1
"let g:memolist_vimfiler = 1
let g:memolist_template_dir_path = "~/.vim/template/memolist"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" caw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" redmine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:metarw_redmine_server = 'http://localhost/redmine/'
"let g:metarw_redmine_apikey = '4034a6d689a2e9083493e08a1ffe6dcb38fa3d9e'

" let g:unite_yarm_server_url = 'http://localhost/redmine/'
" let g:unite_yarm_access_key = '4034a6d689a2e9083493e08a1ffe6dcb38fa3d9e'
" " 取得するチケットの数
" let g:unite_yarm_limit = 25
" " バックアップ先ディレクトリ。定義されていない場合はバックアップしない
" let g:unite_yarm_backup_dir = '~/.vim/tmp'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-todo-lists
" https://github.com/aserebryakov/vim-todo-lists
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO完了時にソートしない
let g:VimTodoListsMoveItems = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_bookmarks = [
  \ '~/_vimrc',
  \ '~/memo/my.todo',
  \ ]

let g:startify_list_order = [
   \ ['Bookmarks:'],
   \ 'bookmarks',
   \ ['Recently used files:'],
   \ 'files',
   \ ['   My most recently used files in the current directory:'],
   \ 'dir',
   \ ['   These are my sessions:'],
   \ 'sessions',
   \ ['   These are my commands:'],
   \ 'commands',
   \ ]

