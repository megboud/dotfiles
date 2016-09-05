set runtimepath+=~/.vim
execute pathogen#infect()

set encoding=utf8
filetype plugin indent on
set nobackup
set nowritebackup
set noswapfile
set visualbell
set ruler                  " Show cursor position at all times
set showcmd                " Display incomplete commands
set laststatus=2           " Always display the status line
set autowrite              " Automatically write before running commands
set clipboard=unnamed      " Share the clipboard with OS
set autoindent             " Copy indent from current line
set wildmenu               " Enhanced completion in command-line
set wildmode=list:longest  " When more than one match, list all matches and complete till longest common string
set backspace=2            " Backspace deletes like most programs in insert mode
set nojoinspaces           " Use one space, not two, after punctuation.
set showmatch              " When a bracket is inserted, briefly jump to matching one
set textwidth=80           " Break long strings into multiple lines

" Softtabs tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·


" Tame searching / moving
set ignorecase
set smartcase
set incsearch
set hlsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Color scheme settings.
syntax on
colorscheme base16-tomorrow
set background=dark

" Toggle - comment, uses Vim-commentary
nmap <C-\> gcc<ESC>
vmap <C-\> gcc<ESC>

ca t tabnew

let g:turbux_command_prefix = 'bundle exec'

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

"""""""""" Airline Config
let g:airline_left_sep  = ''
let g:airline_right_sep = ''

"""""""""" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""" File Navigation
nmap <leader>f :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>

" %% gives you the current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Set default style of explorer
let g:netrw_liststyle=3

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

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    exec ':bd ' . old_name
    redraw!
  endif
endfunction

map <leader>, :call RenameFile()<cr>

" Run file if we know how
function! RunFile(filename)
  :w
  :silent !clear
  if match(a:filename, 'test\.rb$') != -1
    exec ":!ruby " . a:filename
  elseif match(a:filename, '\.rb$') != -1
    exec ":!ruby " . a:filename
  elseif match(a:filename, '\.py$') != -1
    exec ":!python " . a:filename
  elseif match(a:filename, '\.go$') != -1
    exec ":!go run " . a:filename
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

map <leader>e :call RunFile(expand("%"))<cr>

" Rails debug helper
nnoremap <leader>d oputs "#" * 90<c-m>Rails.logger.debug("DEBUG:")<c-m>puts "#" * 90<esc>

" Faster search
" https://robots.thoughtbot.com/faster-grepping-in-vim
" https://github.com/ggreer/the_silver_searcher

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind Leader g to grep word under cursor
  nnoremap <leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap <leader>G :Ag<SPACE>
  endif
endif
