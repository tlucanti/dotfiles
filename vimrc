filetype plugin indent on
" Включает определение типа файла, загрузку
" соответствующих ему плагинов и файлов отступов

set encoding=utf-8          " set encoding to utf-8
set nocompatible            " turns of compatibility with Vi
syntax enable               " turns on syntax highlightning
set tabstop=8               " size of tab in characters
"set expandtab               " replace tabs with spaces
set noexpandtab            " dont repace tabs with spaces
set smarttab                " auto set tabs at the begining of line
set softtabstop=8           " size of tab when deleting
set shiftwidth=8            " size of tab in spaces
"set number                  " set absolute line numbering
set relativenumber          " set realative line numbering
"set foldcolumn=2           " extra space indent in the left
set mouse=a                 " enable full mouse support
set ignorecase              " ignoring case in search
set smartcase               " smart case in search
set hlsearch                " highlight in search
set incsearch               " show first accurance while searching
set whichwrap+=h,l,<,>,[,]  " move cursor to the next line
"set clipboard=unnamedplus  " copy to system buffer instead of vim`s internal
map <C-c> y                 " extra key binding to copy
set laststatus=2            " always show statusline
"set t_Co=256               " use 256 colors
autocmd BufWritePre * :%s/\s\+$//e
							" remove trailing spaces for all files when saving
" autocmd BufWritePre * :RetabIndents
" command! RetabIndents call RetabIndents()

"func! RetabIndents()
"	let saved_view = winsaveview()
"	execute '%s@^\(\ \{'.&ts.'\}\)\+@\=repeat("\t", len(submatch(0))/'.&ts.')@e'
"	call winrestview(saved_view)
"endfunc						"change spaces to tabs at the begining of the line

set colorcolumn=81          " set ruler after 80 characters

"nnoremap <Tab> <Esc>
"vnoremap <Tab> <Esc>gV
"onoremap <Tab> <Esc>
"inoremap <Tab> <Esc>`^
"inoremap <S-Tab> <Tab>
							" remapping <Tab> to <Esc> and v.v.

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	" Если vim-plug не стоит
	" Создать директорию
	" И скачать его оттуда
	" А после прогнать команду PlugInstall
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
	" Начать искать плагины в этой директории
	" Тут будут описаны наши плагины

	Plug 'ErichDonGubler/vim-sublime-monokai'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'preservim/nerdtree'
    " Plug 'frazrepo/vim-rainbow'
    Plug 'luochen1990/rainbow'
	Plug 'Yggdroot/indentLine'
	" Plug 'lukas-reineke/virt-column.nvim'
	Plug 'raimondi/delimitmate'
	Plug 'vim-python/python-syntax'
	Plug 'joshdick/onedark.vim'
	Plug 'haishanh/night-owl.vim'
call plug#end()
" Перестать это делать

" vim rainbow settings
" let g:rainbow_active = 1
" au FileType c,cpp,py,sh,vimrc,zshrc call rainbow#load()
" let g:rainbow_ctermfgs = ['lightblue', 'red', 'lightgreen', 'yellow', 'magenta']

" vim rainbow parentheses improved settings
 let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,\|<\|>\|+\|-\|*\|=\|!\|?\|:\|;\|&\||\|@\|%\|\^\|\.\|\~_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody',
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'css': 0,
\		'nerdtree': 0,
\	}
\}

" IndentLinw settings
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['│', '╎', '┆', '┊']
" let g:indentLine_color_term = 'lightgrey'

" delimitmate settings
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_balance_matchpairs = 1

" python-highlight settings
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

" c++ hightlight settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" NERDtree settings
let NERDTreeMapOpenInTab='<ENTER>'

" colorscheme settings
set termguicolors
colorscheme night-owl
"hi Normal guibg=NONE ctermbg=NONE
hi Normal guibg=#081535
"disabling colorscheme bg color (to transparent)
set cursorline
set cursorcolumn
hi CursorLine guibg=#203050
hi CursorColumn guibg=#202540
hi ColorColumn guibg=#203050

set path+=/usr/local/include
set path+=~/git/hm-gear
set path+=~/git/hm-gear/include
set path+=~/git/hm-gear/ibr
set path+=~/git/hm-gear/benchmark/slist
set path+=~/git/hm-gear/lib/container/include
set path+=~/git/hm-gear/benchmark
set path+=~/git/hm-gear/buildsystem
set path+=~/git/hm-gear/lib
set path+=~/git/hm-gear/lib/benchmark_container/include
set path+=~/git/hm-libvsync/sync/include/vsync

tab all
