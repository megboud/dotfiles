" Use vim defaults 
set encoding=utf8
set nocompatible
filetype plugin indent on

"  Load ~/.vim/bundle packages.
set runtimepath+=~/.vim
execute pathogen#infect()
filetype plugin indent on

cd ~/Dropbox
set spellfile=$HOME/Dropbox/Misc/spell/mySpellFile.en.utf-8.add

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar

imap <Tab> <C-P>
map <F3> :source ~/.vim/todo_and_logs_sessions.vim <cr>
:nnoremap <F4> "=strftime("%m/%d/%y %H:%M%p")<CR>
:inoremap <F4> <C-R>=strftime("%m/%d/%y %H:%M%p")<CR>

" No swap files and other basic settings
set backupdir=~/.vimfiles/tmp,.
set directory=~/.vimfiles/tmp,.
set nobackup
set noswapfile
set spell
set scrolloff=3
set autoindent
set complete-=1
set smarttab
set showmode
set showcmd
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
set ttymouse=xterm2c " Set xterm2 mouse mode to allow resizing of splits with mouse inside Tmux.
set so=14 " Keep cursor away from edges of screen.

" Change buffers using CtrlP with the ; key
:nmap <Leader>b :CtrlPBuffer<CR>
:nmap <Leader>f :CtrlP<CR>

" open Nerd Tree in folder of file in active buffer
noremap <Leader>t :NERDTreeFind<cr>
noremap <Leader>tt :NERDTreeClose<cr>

" Colorscheme settings.
syntax enable
set t_Co=256
set background=dark
colorscheme base16-tomorrow

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 13
  elseif has("gui_win32")
    set guifont=Consolas:h13:cANSI
  endif
endif

" Make trailing whitespace annoyingly highlighted.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Highlight cursor line.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Tame searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" Handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" No Arrows!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
