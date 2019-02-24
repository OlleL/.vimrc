if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Color
Plug 'tomasr/molokai'

" Edit
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

set modelines=0

"------------------------------------------------------------------------
"  Plugins
"------------------------------------------------------------------------

" fzf - fuzzy search
set rtp+=/usr/local/opt/fzf

"-------------------------------------------------------------------------
"  Mappningar
"-------------------------------------------------------------------------
" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Tar bort sökhighlightning..
nmap <silent> ,/ :nohlsearch<CR>

" fzf
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

"-------------------------------------------------------------------------
"  Basic settings
"-------------------------------------------------------------------------
colorscheme molokai
set timeoutlen=1000 ttimeoutlen=0

" Enables work with hidden unsaved buffers
set hidden
"set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autowrite    " 
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number relativenumber " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" Ignores while autocomp.
set wildignore=*.swp,*.svn
set title                " change the terminal's title

" Set working dirictory
set autochdir

set scrolloff=4
set wildmenu
" set cursorline
set vb t_vb=

" faster update time for status line
set updatetime=100

" faster switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Searching.. 
nnoremap / /\v
vnoremap / /\v
set gdefault

" Browsing quickfix window
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" vim-go
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1

function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
