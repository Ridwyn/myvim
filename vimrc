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
set scrolloff=13

set ignorecase
set incsearch
set hlsearch
set smartcase
set mouse=a
set clipboard+=unnamed,unnamedplus

colorscheme slate

" different color depending on focus
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
highlight NormalNC ctermbg=233
augroup winbg autocmd!
    au WinEnter * setl wincolor=NormalNC
    au WinLeave * setl wincolor=
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
command! -bang -bar -nargs=? -complete=dir FZFCd
	\ call fzf#run(fzf#wrap(
	\ {'source': 'find '..( empty("<args>") ? ( <bang>0 ? "~" : "." ) : "<args>" ) ..
	\ ' -type d -maxdepth 1', 'sink': 'cd'}))
