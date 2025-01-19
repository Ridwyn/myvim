
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
"""""""" List your plugins here
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf.vim'
Plug '907th/vim-auto-save'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

let g:coc_global_extensions = [
			      \ 'coc-snippets',
            \ 'coc-json',
						\ 'coc-html',
						\ 'coc-sh',
						\ 'coc-python',
						\ 'coc-tsserver',
            \ 'coc-clangd',
            \ 'coc-go',
            \ 'coc-zig',
            \ 'coc-git',
            \ ]
let g:auto_save = 0 "disable vim-auto-save

":Coc<tab>
":Plug<tab>
":AutoSave<tab>
