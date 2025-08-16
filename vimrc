"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
"""""""" VIM CONFIGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

so ~/.vim/plugin-config.vim
so ~/.vim/remaps.vim
so ~/.vim/commands.vim

" set viminfo+=n~/.vim/.viminfo
" Disable global viminfo by setting an empty viminfo file initially
set viminfofile=NONE

augroup viminfo
	autocmd!
	autocmd VimEnter * call s:SetLocalViminfo()
	function! s:SetLocalViminfo()
		if argc() > 0 && isdirectory(expand(argv(0))) 
			" Change  Working Directory
			execute 'cd' fnameescape(argv(0)) 
			" Set local viminfo
			let l:viminfo_path = getcwd() . '/.viminfo'
			let &viminfofile = l:viminfo_path
			set viminfo+=!                  " Save command history
			set viminfo+=n                  " Save marks in the current buffer
			set viminfo+=s                  " Save search history
			set viminfo+=f                  " Save file marks
			" set viminfo+=r                  " Save registers
			" set viminfo+=a                  " Save all registers (including unnamed)
			set viminfo+=m                  " Save last used marks
			set viminfo+=p                  " Save last used search pattern
			set viminfo+=t                  " Save last used tags
			set viminfo+=x                  " Save last used command-line completion
			" set viminfo+=y                  " Save last used yank and delete registers
			" Read viminfo into vim session 
			execute 'rviminfo'
			echom "Using local viminfo: " . l:viminfo_path
		else
			" Fallback to a default or no viminfo for non-directory buffers
			let l:viminfofile = $HOME . '/.vim/.viminfo'
			let &viminfofile = l:viminfofile
			echom "Not a directory, viminfofile set to " . l:viminfofile		
		endif
	endfunction

	" Write viminfo into vim session 
	autocmd VimLeave * wviminfo
augroup END


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
set clipboard=unnamedplus

colorscheme habamax

"Remove quickfix fix 
autocmd! BufWinEnter *Quickfix* setlocal nowinfixheight 

" different color depending on focus
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
highlight NormalNC ctermbg=243
augroup winbg autocmd!
    au WinEnter * setl wincolor=
    au WinLeave * setl wincolor=NormalNC
augroup END

"to enable resizing of quickfix list by Ctrl+w =
autocmd! BufWinEnter *Quickfix* setlocal nowinfixheight 

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
