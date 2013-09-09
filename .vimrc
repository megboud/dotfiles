"  Load ~/.vim/bundle packages.
set runtimepath+=~/.vim
execute pathogen#infect()
filetype plugin indent on

" Set vim defaults
set encoding=utf8
set nocompatible
filetype plugin indent on
nnoremap j gj
nnoremap k gk
:set guioptions-=m  "remove menu bar from GVIM
:set guioptions-=T  "remove toolbar from GVIM

" Directory Settings and custom spell check dictionary
cd ~
set autochdir
set spellfile=~/.vim/spell/mySpellFile.en.utf-8.add
map <F3> :source ~/.vim/todo_and_research_session.vim <cr>

" Custom keyboard shortcuts
imap <Tab> <C-p>
nmap <F4> a<C-R>=strftime("%m/%d/%y %H:%M%p")<CR><Esc>
imap <F4> <C-R>=strftime("%m/%d/%y %H:%M%p")<CR>
" Use JK to go to normal mode
inoremap jk <esc>
cno jk <C-c>
vmap jk <C-c>
cmap jk <C-c>
" Control-backspace should delete word in normal mode
imap <C-BS> <c-w>
" Eclipse shortcut for comment, uses Vim-commentary
nmap <C-\> gcc
vmap <C-\> gcc

" No swap files and other basic settings
set backupdir=~/.vimfiles/tmp,.
set directory=~/.vimfiles/tmp,.
set nobackup
set noswapfile

set clipboard=unnamed " Share the clipboard with windows
set spell
set scrolloff=3
set autoindent
set complete-=i
set smarttab
set showmode
set nrformats-=octal
set showcmd
set shiftround
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start " backspace through everything in insert mode
set laststatus=2
set expandtab " Use spaces, not tabs
set tabstop=2 shiftwidth=2
set number " Numbered lines.
set modelines=0 " Prevent security exploits having to do with modelines
set mouse=n " Mouse usage enabled in normal mode.
set so=14 " Keep cursor away from edges of screen.
set display+=lastline

set ttimeout
set ttimeoutlen=50

" Change buffers using CtrlP with the ; key
:nmap <Leader>b :CtrlPBuffer<CR>
:nmap <Leader>f :CtrlP<CR>

" open Nerd Tree in folder of file in active buffer
noremap <Leader>t :NERDTreeFind<cr>
noremap <Leader>tt :NERDTreeClose<cr>

" Colorscheme settings.
syntax enable
set t_Co=256
colorscheme tomorrow

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 13
  elseif has("gui_win32")
    set guifont=Consolas:h13:cANSI
  endif
endif

if &listchars ==# 'eol:$'
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

" Highlight cursor line.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Tame searching / moving
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
" Use <C-L> to clear the highlighting of :set hlsearch.
set hlsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

