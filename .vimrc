
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

set number relativenumber
"autocmd InsertEnter * :set relativenumber
"autocmd InsertLeave * :set norelativenumber

" Disables automatic commenting on newline

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open on the right

set splitbelow splitright

silent !stty -ixon > /dev/null 2>/dev/null

" Remaps

nmap <C-Q> :q<CR>
imap <C-Q> <Esc>:q<CR>
nmap <C-S> :w<CR>
imap <C-s> <Esc>:w<CR>

" Shortcuts for splits navigation

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open Netrw on v-split pane

map <C-n> :Vex<CR>

" Set highlight for search and disable it with space

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set mouse=a
set ttymouse=xterm2

" Set page display

set list
set listchars=tab:>·,trail:·,extends:>,precedes:<
set cc=80
set tabstop=4
set showcmd
" Keep cursor in the middle of page
"set scrolloff=999
set scrolloff=10

set nobackup
set noswapfile

filetype plugin on
set t_Co=256
highlight Normal ctermbg=black
set laststatus=2
set updatetime=100

" Automatically update vim
autocmd BufWritePost .vimrc source %

" Fix indentation
set cinoptions+=+1

" Remove trailing whitspaces
autocmd FileType c,h autocmd BufWritePre <buffer> %s/\s\+$//e

" CSCOPE SETUP

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

		" add any cscope database in current directory
		set nocscopeverbose
		if filereadable("cscope.out")
			cs add /home/halias/Documents/101_Code/42sh_gitlab/cscope.out
				" else add the database pointed to by environment variable
		elseif $CSCOPE_DB != ""
				cs add $CSCOPE_DB
		endif

		" show msg when any other cscope db added
		set cscopeverbose

		"Store cscope results into quickfix
		if has('quickfix')
				set cscopequickfix=s-,c-,d-,i-,t-,e-
		endif

		""""""""""""" My cscope/vim key mappings
		"
		" The following maps all invoke one of the following cscope search types:
		"
		"   's'   symbol: find all references to the token under cursor
		"   'g'   global: find global definition(s) of the token under cursor
		"   'c'   calls:  find all calls to the function name under cursor
		"   't'   text:   find all instances of the text under cursor
		"   'e'   egrep:  egrep search for the word under cursor
		"   'f'   file:   open the filename under cursor
		"   'i'   includes: find files that include the filename under cursor
		"   'd'   called: find functions that function under cursor calls
		"
		" Below are three sets of the maps: one set that just jumps to your
		" search result, one that splits the existing vim window horizontally and
		" diplays your search result in the new window, and one that does the same
		" thing, but does a vertical split instead (vim 6 only).
		"
		" I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
		" unlikely that you need their default mappings (CTRL-\'s default use is
		" as part of CTRL-\ CTRL-N typemap, which basically just does the same
		" thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
		" If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
		" of these maps to use other keys.  One likely candidate is 'CTRL-_'
		" (which also maps to CTRL-/, which is easier to type).  By default it is
		" used to switch between Hebrew and English keyboard mode.
		"
		" All of the maps involving the <cfile> macro use '^<cfile>$': this is so
		" that searches over '#include <time.h>" return only references to
		" 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
		" files that contain 'time.h' as part of their name).


		" To do the first type of search, hit 'CTRL-\', followed by one of the
		" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
		" search will be displayed in the current window.  You can use CTRL-T to
		" go back to where you were before the search.
		"

		nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
		nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
		nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
		nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
		nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
		nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
		nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
		nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


		" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
		" makes the vim window split horizontally, with search result displayed in
		" the new window.
		"
		" (Note: earlier versions of vim may not have the :scs command, but it
		" can be simulated roughly via:
		"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

		nmap <C-@><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
		nmap <C-@><C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
		nmap <C-@><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


		" Hitting CTRL-space *twice* before the search type does a vertical
		" split instead of a horizontal one (vim 6 and up only)
		"
		" (Note: you may wish to put a 'set splitright' in your .vimrc
		" if you prefer the new window on the right instead of the left

		nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
		nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
		nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


		""""""""""""" key map timeouts
		"
		" By default Vim will only wait 1 second for each keystroke in a mapping.
		" You may find that too short with the above typemaps.  If so, you should
		" either turn off mapping timeouts via 'notimeout'.
		"
		"set notimeout
		"
		" Or, you can keep timeouts, by uncommenting the timeoutlen line below,
		" with your own personal favorite value (in milliseconds):
		"
		"set timeoutlen=4000
		"
		" Either way, since mapping timeout settings by default also set the
		" timeouts for multicharacter 'keys codes' (like <F1>), you should also
		" set ttimeout and ttimeoutlen: otherwise, you will experience strange
		" delays as vim waits for a keystroke after you hit ESC (it will be
		" waiting to see if the ESC is actually part of a key code like <F1>).
		"
		"set ttimeout
		"
		" personally, I find a tenth of a second to work well for key code
		" timeouts. If you experience problems and have a slow terminal or network
		" connection, set it higher.  If you don't set ttimeoutlen, the value for
		" timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
		"
		"set ttimeoutlen=100


" TOTALLY NECESSARY MAPPING
map <F2> :r ~/Divers/coffee.txt <ESC> 25j zz <CR>
endif
