
call plug#begin('~/.vim/plugged')

	" Fuzzy Finder
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	" Errors manager
	Plug 'dense-analysis/ale'
	" Display git modifications
	Plug 'airblade/vim-gitgutter'
	" Status bar Custom
	Plug 'itchyny/lightline.vim'

call plug#end()

" Set colors

syntax on
colorscheme molokai
let g:molokai_original = 1

" Set numbers

set number
autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber

silent !stty -ixon > /dev/null 2>/dev/null

" Remaps

nmap <C-Q> :q<CR>
imap <C-Q> <Esc>:q<CR>
nmap <C-S> :w<CR>
imap <C-s> <Esc>:w<CR>

" Open Netrw on v-split pane

map <C-n> :Vex<CR>

" Set highlight for search and disable it with space

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set mouse=a

" Allow mouse for split resize in vim on tmux
"set ttymouse=xterm2

" Set page display

set list
set listchars=tab:>·,trail:·,extends:>,precedes:<
set cc=80
set tabstop=4
set showcmd

set nobackup
set noswapfile

filetype plugin on
set t_Co=256
highlight Normal ctermbg=black
set laststatus=2
set updatetime=100

" Automatically update vim
autocmd BufWritePost .vimrc source %

" Let FZF display hidden files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
