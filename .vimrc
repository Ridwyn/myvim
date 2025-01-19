"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""" VIM CONFIGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set viminfo+=n~/.vim/.viminfo
set undodir=~/.vim/undodir
set directory = "~/.vim/tmp//"

set cursorline
set number
set relativenumber
set scrolloff=8

set ignorecase
set incsearch
set hlsearch
set smartcase
set mouse=a

" different color depending on focus
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
highlight NormalNC ctermbg=236
augroup winbg
    autocmd!
    au WinEnter * setl wincolor=
    au WinLeave * setl wincolor=NormalNC
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

so ~/.vim/plugin-config.vim
so ~/.vim/remaps.vim


