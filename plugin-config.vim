
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
"""""""" List your plugins here
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'mikelue/vim-maven-plugin'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'


call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline Statusline 
""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove trailing whitespace indicator
let g:airline#extensions#whitespace#enabled = 0
" Remove mixed indentation indicator
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_mixed_indent = 0


highlight CocFloating ctermbg=240
 let g:coc_global_extensions = [
 						\ 'coc-marketplace',
 			      \ 'coc-snippets',
 						\ 'coc-git',
             \ 'coc-json',
 						\ 'coc-html',
 						\ 'coc-sh',
 						\ 'coc-python',
 						\ 'coc-tsserver',
             \ 'coc-clangd',
             \ 'coc-go',
             \ 'coc-zig',
             \ 'coc-java',
             \ ]
""""""""""""""""""""""""""""""""""""""""""""""""""
"Coc.vim Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""
" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" :Coc<tab>
" :Plug<tab>
" :AutoSave<tab>
