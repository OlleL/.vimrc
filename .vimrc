" This must be first, because it changes other options as side effect
set nocompatible

filetyp off
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set modelines=0

filetype plugin indent on
colorscheme molokai
"set list
"set listchars=extends:#

" Så jag lär mig
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"------------------------------------------------------------------------
"  Plugins
"------------------------------------------------------------------------

"-------------------------------------------------------------------------
"  Mappningar
"-------------------------------------------------------------------------
" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Snabbt ändra i perl-snippet
nmap <silent> <leader>ep :e ~/.vim/bundle/snipMate/snippets/perl.snippets<CR>


" Tar bort sökhighlightning..
nmap <silent> ,/ :nohlsearch<CR>
" Öppnar en ny vsp och fokuserar på den
nnoremap <leader>w <C-w>v<C-w>l
" tar en snabb tillbaka till normalmode
inoremap jj <ESC>
" Rörselser
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


"-------------------------------------------------------------------------
"  Basic settings
"-------------------------------------------------------------------------
" Enables work with hidden unsaved buffers
set hidden
"set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
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
set cursorline

" Searching.. 
nnoremap / /\v
vnoremap / /\v
set gdefault


" Sparar vid växling till annat program
" au FocusLost * :wa

" Tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_autoclose = 0


" SYNTAX KOLL (cs = checkSyntax)
nmap <silent> <leader>cs :call SyntaxCheck()<CR>

function! SyntaxCheck()
        let filename = expand("%")
        let ftype = &filetype
        if ftype == '' 
                return
        elseif ftype == "perl"
                let cmd = "!clear; echo \"\"; echo \"\"; perl -c " . filename
                execute cmd
        else
                echo "Cant syntax check file type : " . ftype
                return
        endif
endfunction

