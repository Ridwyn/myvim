"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""" VIM CONFIGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

so ~/.vim/plugin-config.vim
so ~/.vim/remaps.vim

set viminfo+=n~/.vim/.viminfo
set undodir=~/.vim/undodir
set undofile
set directory = "~/.vim/tmp//"
set grepprg =rg\ --vimgrep\ --smart-case


set cursorline
set history=200
set number
set relativenumber
set scrolloff=13
set path+=**
set wildmenu
set ts=4 sw=4

set ignorecase
set incsearch
set hlsearch
set smartcase
set mouse=a
set clipboard+=unnamed,unnamedplus

colorscheme habamax

" different color depending on focus
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
highlight NormalNC ctermbg=243
augroup winbg autocmd!
    au WinEnter * setl wincolor=
    au WinLeave * setl wincolor=NormalNC
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"FZF commands
" Default: Use quickfix list
"let g:fzf_vim.listproc = { list -> fzf#vim#listproc#quickfix(list) }
command! -bang -bar -nargs=? -complete=dir FZFCd
	\ call fzf#run(fzf#wrap(
	\ {'source': 'find '..( empty("<args>") ? ( <bang>0 ? "~" : "." ) : "<args>" ) ..
	\ ' -type d -maxdepth 1', 'sink': 'cd'}))

"FZF MRU search and open buffers
command! FZFMru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

"FZF search through args
command! -bang Args call fzf#run(fzf#wrap('args',
    \ {'source': map([argidx()]+(argidx()==0?[]:range(argc())[0:argidx()-1])+range(argc())[argidx()+1:], 'argv(v:val)')}, <bang>0))
