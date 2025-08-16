
let mapleader = " "
inoremap jj <ESC>
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"Search for highlited text in file
vnoremap / y/<C-R>"<CR>

"Replacing highlighted text
vnoremap  <leader>r <C-R>ay:substitue/<C-R>ap 
vnoremap  r "ay:substitute/<C-R>a/

"Yank and paste in visual and insert mode
vnoremap <C-c> "+y
inoremap <C-v> <Esc> "+p 

"Insert empty line
nmap oo o<Esc>k
nmap OO O<Esc>j

"Commentary
noremap <leader>/ :Commentary<cr>


"Open terminal
nnoremap <leader>t :term<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"FZF command completions finding and word searches thorugh whole project
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :RG<CR>
vnoremap <leader>fs y:RG <C-R>"<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Commands<CR>
nnoremap <leader>fa :Args<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>fcc :History:<CR>
nnoremap <leader>fbb :History<CR>
nnoremap <leader>fss :History/<CR>

"Return to explore
" noremap <leader><leader> :Rex<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"QuicKFix List Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
" :Grep - search and then open the window
command! -nargs=+ Grep execute 'silent cexpr system("rg --vimgrep --smart-case <args>")' | copen
command! -nargs=+ Fd execute 'silent cexpr system("fd <args> --format {}:1:1:{/} ")' | copen

" Go to the previous location and stay in the quickfix window
nnoremap <C-p> :cprev<CR>

" Go to the next location and stay in the quickfix window
nnoremap <C-n> :cnext<CR>

" Show the quickfix window
nnoremap <Leader>co :copen<CR>

" Hide the quickfix window
nnoremap <Leader>cc :cclose<CR>

function! QuickfixMapping()

	  " Make the quickfix list modifiable
	  nnoremap <buffer> <leader>u :set modifiable<CR>

	  " Save the changes in the quickfix window
	  nnoremap <buffer> <leader>w :cgetbuffer<CR>:cclose<CR>:copen<CR>

	  " Begin the search and replace
	  nnoremap <buffer> <leader>r :cdo s/// \| update<C-Left><C-Left><Left><Left><Left>
endfunction

augroup quickfix_group
  autocmd!

  "Remove fix height
  autocmd filetype qf setlocal nowinfixheight 
  
  " Use custom keybindings
  autocmd filetype qf call QuickfixMapping()
  
  " Add the errorformat to be able to update the quickfix list
  autocmd filetype qf setlocal errorformat+=%f\|%l\ col\ %c\|%m
augroup END




