"Allow project specific .vimrc execution
set exrc

"no backup files
set nobackup

"only in case you don't want a backup file while editing
set nowritebackup

"no swap files
set noswapfile

" No wrapping
set nowrap

" Highlight search results when using /
set hlsearch

imap jk <ESC>
map ; :

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=500

" all utf-8
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" enable backspace...
set bs=2

"show line numbers
set number relativenumber

" don't beep
set belloff=all

" Show white spaces a
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
set list

" 4 spaces indentation
set tabstop=4 softtabstop=0 expandtab shiftwidth=4

" Deal with unwanted white spaces (show them in red)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"Let's setup the plugins
call plug#begin()

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mhinz/vim-signify'
Plug 'nickspoons/vim-sharpenup'
Plug 'arzg/vim-colors-xcode'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'vim-scripts/dbext.vim'
Plug 'dyng/ctrlsf.vim'

call plug#end()

" ========= airline settings start ======================

" to see the full path of the editing file
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_powerline_fonts = 1

" show branch information
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='badwolf'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

let g:airline#extensions#tabline#enabled = 1
" ========= airline settings end ========================

" =================NERDTree settings start===============
" For more docos check out https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt
" Open new NERDTree instance bt typing nto
nmap nt :NERDTree<cr>
" Open existing NERDTree buffer (if any) at current tab
nmap ntm :NERDTreeMirror<cr>
" If you are using vim-plug, you'll also need to add these lines to avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
let g:plug_window = 'noautocmd vertical topleft new'
" =================NERDTree settings end=================

" =================vim Sharpenup settings start==========
" note that using CTRL isn't feasible so we will use z instead, I chose z because it's the closest key to left ctrl
let g:sharpenup_map_prefix = '.'
" =================vim Sharpenup settings end============

" ================ dyng/ctrlsf.vim settings start ==============
" Ctrl + f, f
nmap <C-F>f <Plug>CtrlSFPrompt
" ================ dyng/ctrlsf.vim settings end ================

" Bookmarks:
" It's best to use vim's native bookmarks:
" https://www.thegeekstuff.com/2009/02/how-to-add-bookmarks-inside-vi-and-vim-editor/
" I personally use numbers because they are easier to remember and are global

" fix colors
set t_Co=256

" use awesome Xcode dark color scheme (for some reason this only works if I specify it at the end of the file)
colorscheme xcodedark
syntax on

"Disable unsafe commands since we are allowing project specific .vimrc file execution
set secure
