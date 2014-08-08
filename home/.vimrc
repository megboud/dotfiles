set runtimepath+=~/.vim
execute pathogen#infect()

" Color scheme settings.
syntax on
set t_Co=256
colorscheme Tomorrow-Night

" Set vim defaults
set encoding=utf8
set nocompatible
filetype plugin indent on
nnoremap j gj
nnoremap k gk

"Remove Menu and Toolbars from GVIM
set guioptions-=m
set guioptions-=T

" Toggle - comment, uses Vim-commentary
nmap <C-\> gcc<ESC>
vmap <C-\> gcc<ESC>

" No swap files and other basic settings
set nobackup
set noswapfile
set autochdir


" Spell check settings
" set spell
set spellfile=~/.vim/spell/mySpellFile.en.utf-8.add
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Make airline status bar gem show full path
let g:airline_section_c = '%F'

set clipboard=unnamed " Share the clipboard with OS
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

" Font setting
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 16
  elseif has("gui_win32")
    set guifont=Consolas:h16:cANSI
  else
    set guifont=Consolas:h16
  endif
endif

" Autocomplete with Ctrl space
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
  if has("unix")
    inoremap <Nul> <C-n>
  else
  " I have no idea of the name of Ctrl-Space elsewhere
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
set colorcolumn=120

" ******************** Rename current file, via Gary Bernhardt
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

map <Leader>, :call RenameFile()<cr>

" ******************** Execute file if we know how
function! ExecuteFile(filename)
  :w
  :silent !clear
  if match(a:filename, 'test\.rb$') != -1
    exec ":Rake"
  elseif match(a:filename, '\.rb$') != -1
    exec ":!ruby " . a:filename
  elseif match(a:filename, '\.js$') != -1
    exec ":!node " . a:filename
  elseif match(a:filename, '\.sh$') != -1
    exec ":!bash " . a:filename
  elseif match(a:filename, '\.tex$') != -1
    exec ":!make "
  elseif match(a:filename, 'makefile$') != -1
    exec ":!make "
  else
    exec ":!echo \"Don't know how to execute: \"" . a:filename
  end
endfunction

map <leader>e :call ExecuteFile(expand("%"))<cr>

