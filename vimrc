"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""" VIM CONFIGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

so ~/.vim/plugin-config.vim
so ~/.vim/remaps.vim

set viminfo+=n~/.vim/.viminfo
set undodir=~/.vim/undodir
set directory = "~/.vim/tmp//"

set cursorline
set history=200
set number
set relativenumber
set scrolloff=8

set ignorecase
set incsearch
set hlsearch
set smartcase
set mouse=a
set clipboard+=unnamed,unnamedplus

colorscheme evening

" different color depending on focus
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
highlight NormalNC ctermbg=246
augroup winbg autocmd!
    au WinEnter * setl wincolor=
    au WinLeave * setl wincolor=NormalNC
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


