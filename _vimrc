"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �G���R�[�h
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding cp932
set nocompatible
set encoding=cp932
set fileencoding=cp932
set fileencodings=utf-8,cp932,sjis,euc-jp,iso-2022-jp
set fileformat=dos
set fileformats=dos,unix,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �^�u�ݒ�
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set list
set listchars=tab:^-,trail:-,nbsp:%

" ���s�����ƃ^�u�����̐F�ݒ�iNonText�����s�ASpecialKey���^�u�j
"hi NonText guibg=NONE guifg=DarkGreen
"hi SpecialKey guibg=NONE guifg=Gray40

" python�̏ꍇ�̓^�u����2�ɕύX�B�^�u�̓X�y�[�X�ɕϊ��B
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
	" Unix �p�ݒ�
	"colorscheme molokai
	"colorscheme koehler
	"colorscheme evening
	"colorscheme morning
endif
if has('win64')
	" Windows �p�ݒ�
endif

" �S�p�X�y�[�X�̕\��
" function! ZenkakuSpace()
"     highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
" endfunction
" 
" if has('syntax')
"     augroup ZenkakuSpace
"         autocmd!
"         autocmd ColorScheme * call ZenkakuSpace()
"         autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '�@')
"     augroup END
"     call ZenkakuSpace()
" endif
""""""""""""""""""""""""""""""

"" �J�����g�s�̃n�C���C�gON
set cursorline
" �A���_�[���C��������(color terminal)
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" �A���_�[���C��������(gui)
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

" :b<space>���A:bd<space>���ɁAls���ʂ�\������
cnoreabb <expr>b  getcmdtype()==':' && getcmdline()=='b'  ? 'ls<CR>:b'  : 'b'
cnoreabb <expr>bd getcmdtype()==':' && getcmdline()=='bd' ? 'ls<CR>:bd' : 'bd'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" messages�t�@�C���͎���Syntax�L��
autocmd BufNewFile,BufReadPost *messages* :set filetype=messages

" Oracle�A���[�g���O�p
autocmd BufNewFile,BufReadPost alert*.log :set filetype=log

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows�W����findstr�ł͂Ȃ��AMSYS2 64bit��grep���g��
" grep���Ɏ�����quickfix-window���J��
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

" �O��I�������J�[�\���s�Ɉړ�
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" md�t�@�C���V�K�쐬���Ƀe���v���[�g��ǂݍ���
autocmd BufNewFile *.md 0r $HOME/.vim/template/md.txt

" �ۑ����ɐ܂肽���݂������ۑ��B�N�����ɐ܂肽���݂������N��
autocmd BufWinLeave *.md silent mkview
autocmd BufWinEnter *.md silent loadview

" insert mode����IME��OFF
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
" �����ΏۊO�ݒ�
set wildignore+=bin,Excel,GNS3,Heroku,media,Oracle,VirtualBoxVMs
" �����ΏۊO�f�B���N�g��
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|ssh|vim|svn|vagrant|vagrant.d)$',
  \ 'file': '\v\.(exe|so|dll|iso|tgz|zip|jpg|iso|lnk)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" vim�I�����ɃL���b�V�����폜���Ȃ�
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
" �c����
let g:treeExplVertical=1

" ���������E�B���h�E�T�C�Y
let g:treeExplWinSize=35

" ��ɋN������
" autocmd VimEnter * execute 'VST'

" NERDTree�����c��ꍇ�̓E�B���h�E�����
autocmd bufenter * if (winnr("$") == 1 && buflisted("TreeExplorer") == 1) | q | endif

function! MyFunc()
	if buflisted("TreeExplorer") == 0
		execute 'VST'
	else
		let tmp = win_gotoid(bufwinid("TreeExplorer"))
		q
	endif
endfunction

" C-n��NERDTree�̕\���^��\����؂�ւ�
map <silent> <C-n> :call MyFunc()<CR>

" �N�����Ƀt�H�[�J�X���t�@�C���Ɍ�����
autocmd VimEnter * wincmd p


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *mkd :set filetype=markdown
autocmd BufRead,BufNewFile *md  :set filetype=markdown

let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime=1

