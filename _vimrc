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

" inoremap <expr> ,df strftime('%Y-%m-%d %H:%M')
inoremap <expr> <C-^> strftime('%Y-%m-%d %H:%M')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set confirm
set hidden
set backupdir=~/.vim/tmp
set undodir=~/.vim/undo
set noswapfile
set backspace=indent,eol,start
set shellslash

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dein
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deinパス設定
let s:dein_dir = fnamemodify('~/.vim/dein/', ':p')
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

" dein.vim本体の存在チェックとインストール
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
endif

" dein.vim本体をランタイムパスに追加
if &runtimepath !~# '/dein.vim'
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" プラグインのインストール
if dein#check_install()
  call dein#install()
endif



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
set wildignore+=~/media/*,~/_old/*,~/Log/*/*,*.so,*.swp,*.zip,*.jpg,*.png,*.tgz,*.iso
" 検索対象外ディレクトリ
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|vagrant|vagrant.d)$',
  \ 'file': '\v\.(exe|so|dll|iso|tgz|zip)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'ag.lnk -i --nocolor --nogroup --hidden -g ""%s'
let g:ctrlp_use_caching=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ag_prg="/w/_tool/ag/ag.exe"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mattn/jvgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set grepprg=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_enable_ignore_case=1
let g:unite_enable_smart_case=1

" grep 検索
nnoremap <silent> ,g :<C-u>Unite grep -buffer-name=search-buffer<CR>

" カーソル位置の単語を grep 検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R>

" grep 検索結果の再呼出
nnoremap <silent> ,r :<C-u>UniteResume search-buffer<CR>

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
let g:memolist_memo_date = "%Y/%m/%d %H:%M"
"let g:memolist_memo_date = "epoch"
"let g:memolist_memo_date = "%D %T"
"let g:memolist_prompt_tags = 1
"let g:memolist_prompt_categories = 1
"let g:memolist_qfixgrep = 1
"let g:memolist_vimfiler = 1
let g:memolist_template_dir_path = "~/memo"

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

