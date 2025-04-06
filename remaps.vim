" Move lines up and down
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


let mapleader = " "
inoremap jj <ESC>
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprev<CR>

"Commentary
noremap <leader>/ :Commentary<cr>



"Open terminal
nnoremap <leader>t :term<CR>

"Fuzzy finding and word searches thorugh whole project
nnoremap <leader>f :Files<CR> 
nnoremap <leader>s :RG<CR>

"Highlighted text fuzzy search and through file
vnoremap <leader>s y:RG <C-R>"<CR>
vnoremap g/ y/<C-R>"<CR>

"Replacing highlighted text
"vnoremap  <leader>r <C-R>ay:substitue/<C-R>ap 
vnoremap  r "ay:substitute/<C-R>a/

"Yank and paste in visual and insert mode
vnoremap <C-c> "+y
inoremap <C-v> <Esc> "+p 


"Insert empty line
nmap oo o<Esc>k
nmap OO O<Esc>j

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

noremap <leader><leader> :Rex<CR>
