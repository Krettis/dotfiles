" Use the Solarized Dark theme
set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_termtrans=1
set guifont=Menlo:h14

set nocompatible                " Make Vim more useful
set clipboard=unnamed           " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu                    " Enhance command-line completion
set esckeys                     " Allow cursor keys in insert mode
set backspace=indent,eol,start  " Allow backspace in insert mode
set ttyfast                     " Optimize for fast terminal connections
set gdefault                    " Add the g flag to search/replace by default
set encoding=utf-8 nobomb       " Use UTF-8 without BOM
let mapleader=","               " Change mapleader
set binary                      " don’t add empty newlines at the end of files
set noeol                       " don’t add empty newlines at the end of files

set modeline                    " respect modeline in files
set modelines=4
" enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

set tabstop=2                     " make tabs as wide as two spaces
set shiftwidth=2                  " number of space characters inserted for indentation
set expandtab                     " insert space characters whenever the tab key is pressed

syntax on                         " enable syntax highlighting
set cursorline                    " highlight current line
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_  " show “invisible” characters
set list                          " highlight whitespaces
set hlsearch                      " highlight searches

set ignorecase                    " ignore case of searches
set incsearch                     " highlight dynamically as pattern is typed
set laststatus=2                  " always show status line
set mouse=a                       " Enable mouse in all modes
set noerrorbells                  " Disable error bells

set number                        " enable line numbers
set nostartofline                 " Don’t reset cursor to start of line when moving around.
set ruler                         " Show the cursor position
set shortmess=atI                 " Don’t show the intro message when starting Vim

set showmode                      " Show the current mode
set title                         " Show the filename in the window titlebar
set showcmd                       " Show the (partial) command as it’s being typed
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*


" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>


" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  " Treat .bats files as bash
  autocmd BufRead,BufNewFile *.bats        set filetype=sh

  autocmd BufNewFile,BufRead *.toml set filetype=toml
  " Rust uses Cargo.toml and Cargo.lock (both are toml files).
  autocmd BufNewFile,BufRead Cargo.lock set filetype=toml

  " Easier way of handling commit message from git
  autocmd Filetype gitcommit setlocal spell textwidth=72

endif

" Bundles, plugins
execute pathogen#infect()

" ____________________________________________________________

" Quick navigation
nmap <leader>nv :e ~/.vimrc<cr>
nmap <leader>ngi :e ~/.gitignore<cr>
nmap <leader>ngc :e ~/.gitconfig<cr>
nmap <leader>t :NERDTree<cr>

" Fast saves
nmap <leader>w :w!<cr>
"Easy escaping to normal model
imap jj <esc>


" Test commands
nmap <leader>twm :! mocha -R nyan<cr>
nmap <leader>p A <C-r>"<esc>

map <leader>ww <Plug>CamelCaseMotion_w
map <leader>bb <Plug>CamelCaseMotion_b

