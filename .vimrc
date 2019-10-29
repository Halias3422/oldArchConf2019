if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/my_plugins')

 Plug 'itchyny/lightline.vim'
 Plug 'scrooloose/nerdtree'
 Plug 'scrooloose/syntastic'
 Plug 'othree/vim-autocomplpop'
 Plug 'ervandew/supertab'

call plug#end()

syntax on
colorscheme molokai
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:molokai_original = 1
set number
autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
silent !stty -ixon > /dev/null 2>/dev/null
:nmap <C-Q> :q<CR>
:imap <C-Q> <Esc>:q<CR>
:nmap <C-S> :w<CR>
:imap <C-S> <Esc>:w<CR>
:set mouse=a
set list
set listchars=tab:>·,trail:·,extends:>,precedes:<
:set cc=80
let g:SuperTabMappingBackward ='<C-R>'
let g:acp_enableAtStartup = 1
set nobackup
