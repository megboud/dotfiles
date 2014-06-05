let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <Plug>OrgDemoteOnHeadingInsert :silent! py ORGMODE.plugins[u"EditStructure"].demote_heading(including_children=False, on_heading=True, insert_mode=True)
inoremap <Plug>OrgPromoteOnHeadingInsert :silent! py ORGMODE.plugins[u"EditStructure"].promote_heading(including_children=False, on_heading=True, insert_mode=True)
inoremap <Plug>OrgNewHeadingBelowAfterChildrenInsert :silent! py ORGMODE.plugins[u"EditStructure"].new_heading(insert_mode=True, end_of_last_child=True)
inoremap <Plug>OrgNewHeadingBelowInsert :silent! py ORGMODE.plugins[u"EditStructure"].new_heading(insert_mode=True)
inoremap <Plug>OrgNewHeadingAboveInsert :silent! py ORGMODE.plugins[u"EditStructure"].new_heading(below=False, insert_mode=True)
imap <C-BS> 
imap <F4> =strftime("%m/%d/%y %H:%M%p")
xmap  <Plug>SpeedDatingUp
nmap  <Plug>SpeedDatingUp
nnoremap <silent>  :nohlsearch
nnoremap <silent>  :CtrlP
xmap  <Plug>SpeedDatingDown
nmap  <Plug>SpeedDatingDown
vmap  gcc
nmap  gcc
xmap S <Plug>VSurround
nmap \\u <Plug>CommentaryUndo
nmap \\\ <Plug>CommentaryLine
nmap \\ <Plug>Commentary
xmap \\ <Plug>Commentary
noremap \tt :NERDTreeClose
noremap \t :NERDTreeFind
nmap \f :CtrlP
nmap \b :CtrlPBuffer
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap d <Plug>SpeedDatingNowLocal
nmap d <Plug>SpeedDatingNowUTC
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
nmap gcu <Plug>CommentaryUndo
nmap gcc <Plug>CommentaryLine
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
nnoremap j gj
nnoremap k gk
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <Plug>OrgExportToHTML :OrgExportToHTML
nnoremap <Plug>OrgExportToLaTeX :OrgExportToLaTeX
nnoremap <Plug>OrgExportToPDF :OrgExportToPDF
onoremap <Plug>OrgOuterTreeOperator :py ORGMODE.plugins[u"Misc"].i_heading(mode=u"operator", selection=u"outer", skip_children=True)
onoremap <Plug>OrgInnerTreeOperator :py ORGMODE.plugins[u"Misc"].i_heading(mode=u"operator")
vnoremap <Plug>OrgAOuterTreeVisual :py ORGMODE.plugins[u"Misc"].a_heading(selection=u"outer", skip_children=True)
vnoremap <Plug>OrgOuterTreeVisual <:py ORGMODE.plugins[u"Misc"].i_heading(selection=u"outer", skip_children=True)
vnoremap <Plug>OrgAInnerTreeVisual :py ORGMODE.plugins[u"Misc"].a_heading(skip_children=True)
vnoremap <Plug>OrgInnerTreeVisual :py ORGMODE.plugins[u"Misc"].i_heading(skip_children=True)
onoremap <Plug>OrgOuterHeadingOperator :py ORGMODE.plugins[u"Misc"].i_heading(mode=u"operator", selection=u"outer")
onoremap <Plug>OrgInnerHeadingOperator :py ORGMODE.plugins[u"Misc"].i_heading(mode=u"operator")
vnoremap <Plug>OrgAOuterHeadingVisual :py ORGMODE.plugins[u"Misc"].a_heading(selection=u"outer")
vnoremap <Plug>OrgOuterHeadingVisual :py ORGMODE.plugins[u"Misc"].i_heading(selection=u"outer")
vnoremap <Plug>OrgAInnerHeadingVisual :py ORGMODE.plugins[u"Misc"].a_heading()
vnoremap <Plug>OrgInnerHeadingVisual :py ORGMODE.plugins[u"Misc"].i_heading()
nnoremap <Plug>OrgEditAtFirstCharacter :py ORGMODE.plugins[u"Misc"].edit_at_first_character()
nnoremap <Plug>OrgJumpToFirstCharacter :py ORGMODE.plugins[u"Misc"].jump_to_first_character()
nnoremap <Plug>OrgAgendaTimeline :py ORGMODE.plugins[u"Agenda"].list_timeline()
nnoremap <Plug>OrgAgendaWeek :py ORGMODE.plugins[u"Agenda"].list_next_week()
nnoremap <Plug>OrgAgendaTodo :py ORGMODE.plugins[u"Agenda"].list_all_todos()
nnoremap <Plug>OrgDateInsertTimestampInactiveWithCalendar :py ORGMODE.plugins[u"Date"].insert_timestamp_with_calendar(False)
nnoremap <Plug>OrgDateInsertTimestampActiveWithCalendar :py ORGMODE.plugins[u"Date"].insert_timestamp_with_calendar()
nnoremap <Plug>OrgDateInsertTimestampInactiveCmdLine :py ORGMODE.plugins[u"Date"].insert_timestamp(False)
nnoremap <Plug>OrgDateInsertTimestampActiveCmdLine :py ORGMODE.plugins[u"Date"].insert_timestamp()
nnoremap <Plug>OrgFindTags :py ORGMODE.plugins[u"TagsProperties"].find_tags()
nnoremap <Plug>OrgSetTags :py ORGMODE.plugins[u"TagsProperties"].set_tags()
nnoremap <Plug>OrgTodoSetBackward :py ORGMODE.plugins[u"Todo"].toggle_todo_state(direction=2, next_set=True)
nnoremap <Plug>OrgTodoSetForward :py ORGMODE.plugins[u"Todo"].toggle_todo_state(next_set=True)
nnoremap <Plug>OrgTodoBackward :py ORGMODE.plugins[u"Todo"].toggle_todo_state(direction=2)
nnoremap <Plug>OrgTodoForward :py ORGMODE.plugins[u"Todo"].toggle_todo_state()
nnoremap <Plug>OrgTodoToggleInteractive :py ORGMODE.plugins[u"Todo"].toggle_todo_state(interactive=True)
nnoremap <Plug>OrgTodoToggleNonInteractive :py ORGMODE.plugins[u"Todo"].toggle_todo_state(interactive=False)
nnoremap <Plug>OrgHyperlinkPreviousLink :OrgHyperlinkPreviousLink
nnoremap <Plug>OrgHyperlinkNextLink :OrgHyperlinkNextLink
nnoremap <Plug>OrgHyperlinkInsert :OrgHyperlinkInsert
nnoremap <Plug>OrgHyperlinkCopy :OrgHyperlinkCopy
nnoremap <Plug>OrgHyperlinkFollow :OrgHyperlinkFollow
nnoremap <Plug>OrgDemoteSubtreeNormal :silent! py ORGMODE.plugins[u"EditStructure"].demote_heading()
nnoremap <Plug>OrgDemoteOnHeadingNormal :silent! py ORGMODE.plugins[u"EditStructure"].demote_heading(including_children=False, on_heading=True)
nnoremap <Plug>OrgDemoteHeadingNormal :silent! py ORGMODE.plugins[u"EditStructure"].demote_heading(including_children=False)
nnoremap <Plug>OrgPromoteSubtreeNormal :silent! py ORGMODE.plugins[u"EditStructure"].promote_heading()
nnoremap <Plug>OrgPromoteOnHeadingNormal :silent! py ORGMODE.plugins[u"EditStructure"].promote_heading(including_children=False, on_heading=True)
nnoremap <Plug>OrgPromoteHeadingNormal :silent! py ORGMODE.plugins[u"EditStructure"].promote_heading(including_children=False)
nnoremap <Plug>OrgMoveSubtreeDownward :py ORGMODE.plugins[u"EditStructure"].move_heading_downward()
nnoremap <Plug>OrgMoveHeadingDownward :py ORGMODE.plugins[u"EditStructure"].move_heading_downward(including_children=False)
nnoremap <Plug>OrgMoveSubtreeUpward :py ORGMODE.plugins[u"EditStructure"].move_heading_upward()
nnoremap <Plug>OrgMoveHeadingUpward :py ORGMODE.plugins[u"EditStructure"].move_heading_upward(including_children=False)
nnoremap <Plug>OrgNewHeadingBelowAfterChildrenNormal :silent! py ORGMODE.plugins[u"EditStructure"].new_heading(below=True, end_of_last_child=True)
nnoremap <Plug>OrgNewHeadingBelowNormal :silent! py ORGMODE.plugins[u"EditStructure"].new_heading(below=True)
nnoremap <Plug>OrgNewHeadingAboveNormal :silent! py ORGMODE.plugins[u"EditStructure"].new_heading(below=False)
onoremap <Plug>OrgJumpToNextSkipChildrenOperator :py ORGMODE.plugins[u"Navigator"].next(mode=u"operator", skip_children=True)
onoremap <Plug>OrgJumpToPreviousSkipChildrenOperator :py ORGMODE.plugins[u"Navigator"].previous(mode=u"operator", skip_children=True)
vnoremap <Plug>OrgJumpToNextSkipChildrenVisual :py ORGMODE.plugins[u"Navigator"].next(mode=u"visual", skip_children=True)
vnoremap <Plug>OrgJumpToPreviousSkipChildrenVisual :py ORGMODE.plugins[u"Navigator"].previous(mode=u"visual", skip_children=True)
nnoremap <Plug>OrgJumpToNextSkipChildrenNormal :py ORGMODE.plugins[u"Navigator"].next(mode=u"normal", skip_children=True)
nnoremap <Plug>OrgJumpToPreviousSkipChildrenNormal :py ORGMODE.plugins[u"Navigator"].previous(mode=u"normal", skip_children=True)
onoremap <Plug>OrgJumpToNextOperator :py ORGMODE.plugins[u"Navigator"].next(mode=u"operator")
onoremap <Plug>OrgJumpToPreviousOperator :py ORGMODE.plugins[u"Navigator"].previous(mode=u"operator")
onoremap <Plug>OrgJumpToParentsSiblingOperator :py ORGMODE.plugins[u"Navigator"].parent_next_sibling(mode=u"operator")
onoremap <Plug>OrgJumpToParentOperator :py ORGMODE.plugins[u"Navigator"].parent(mode=u"operator")
vnoremap <Plug>OrgJumpToNextVisual :py ORGMODE.plugins[u"Navigator"].next(mode=u"visual")
vnoremap <Plug>OrgJumpToPreviousVisual :py ORGMODE.plugins[u"Navigator"].previous(mode=u"visual")
vnoremap <Plug>OrgJumpToParentsSiblingVisual :py ORGMODE.plugins[u"Navigator"].parent_next_sibling(mode=u"visual")
vnoremap <Plug>OrgJumpToParentVisual :py ORGMODE.plugins[u"Navigator"].parent(mode=u"visual")
nnoremap <Plug>OrgJumpToNextNormal :py ORGMODE.plugins[u"Navigator"].next(mode=u"normal")
nnoremap <Plug>OrgJumpToPreviousNormal :py ORGMODE.plugins[u"Navigator"].previous(mode=u"normal")
nnoremap <Plug>OrgJumpToParentsSiblingNormal :py ORGMODE.plugins[u"Navigator"].parent_next_sibling(mode=u"normal")
nnoremap <Plug>OrgJumpToParentNormal :py ORGMODE.plugins[u"Navigator"].parent(mode=u"normal")
nnoremap <Plug>OrgGlobalToggleFoldingReverse :py ORGMODE.plugins[u"ShowHide"].global_toggle_folding(reverse=True)
nnoremap <Plug>OrgGlobalToggleFoldingNormal :py ORGMODE.plugins[u"ShowHide"].global_toggle_folding()
nnoremap <Plug>OrgToggleFoldingReverse :py ORGMODE.plugins[u"ShowHide"].toggle_folding(reverse=True)
nnoremap <Plug>OrgToggleFoldingNormal :py ORGMODE.plugins[u"ShowHide"].toggle_folding()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <silent> <Plug>SpeedDatingNowUTC :call speeddating#timestamp(1,v:count)
nnoremap <silent> <Plug>SpeedDatingNowLocal :call speeddating#timestamp(0,v:count)
vnoremap <silent> <Plug>SpeedDatingDown :call speeddating#incrementvisual(-v:count1)
vnoremap <silent> <Plug>SpeedDatingUp :call speeddating#incrementvisual(v:count1)
nnoremap <silent> <Plug>SpeedDatingDown :call speeddating#increment(-v:count1)
nnoremap <silent> <Plug>SpeedDatingUp :call speeddating#increment(v:count1)
nmap <F4> a=strftime("%m/%d/%y %H:%M%p")
map <F3> :source ~/.vim/todo_and_research_session.vim 
imap S <Plug>ISurround
imap s <Plug>Isurround
imap 	 
imap  <Plug>Isurround
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set backspace=indent,eol,start
set backupdir=~/.vimfiles/tmp,.
set complete=.,w,b,u,t
set directory=~/.vimfiles/tmp,.
set display=lastline
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fillchars=vert:|,fold:\ 
set formatoptions=qrn1
set gdefault
set helplang=en
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:⇥\ ,trail:␣,extends:⇉,precedes:⇇,nbsp:·
set modelines=0
set mouse=n
set nrformats=hex
set ruler
set runtimepath=~/.vim,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/nerdtree,~/.vim/bundle/tomorrow-theme,~/.vim/bundle/vim-airline,~/.vim/bundle/vim-bundler,~/.vim/bundle/vim-commentary,~/.vim/bundle/vim-fugitive,~/.vim/bundle/vim-orgmode,~/.vim/bundle/vim-rails,~/.vim/bundle/vim-speeddating,~/.vim/bundle/vim-surround,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,~/.vim/after
set scrolloff=14
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set smarttab
set spellfile=~/.vim/spell/mySpellFile.en.utf-8.add
set noswapfile
set tabstop=2
set textwidth=79
set ttimeout
set ttimeoutlen=50
set visualbell
set wildmenu
set wildmode=list:longest
set window=0
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Dropbox/Misc
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/Dropbox/Misc/todo.org
badd +1 ~/Dropbox/Misc/research_log.org
badd +1 ~/Dropbox/Misc/log.org
silent! argdel *
edit ~/Dropbox/Misc/todo.org
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <silent> <C-CR> <Plug>OrgNewHeadingBelowAfterChildrenInsert
imap <buffer> <silent> <S-CR> <Plug>OrgNewHeadingBelowInsert
imap <buffer> <silent> <C-S-CR> <Plug>OrgNewHeadingAboveInsert
nmap <buffer> <silent> 	 <Plug>OrgToggleFoldingNormal
nmap <buffer> <silent> <ir <Plug>OrgPromoteSubtreeNormal
nmap <buffer> <silent> <[[ <Plug>OrgPromoteSubtreeNormal
nmap <buffer> <silent> <ar <Plug>OrgPromoteSubtreeNormal
nmap <buffer> <silent> <ih <Plug>OrgPromoteHeadingNormal
nmap <buffer> <silent> <{ <Plug>OrgPromoteHeadingNormal
nmap <buffer> <silent> << <Plug>OrgPromoteOnHeadingNormal
nmap <buffer> <silent> <ah <Plug>OrgPromoteHeadingNormal
nmap <buffer> <silent> >ir <Plug>OrgDemoteSubtreeNormal
nmap <buffer> <silent> >]] <Plug>OrgDemoteSubtreeNormal
nmap <buffer> <silent> >ar <Plug>OrgDemoteSubtreeNormal
nmap <buffer> <silent> >ih <Plug>OrgDemoteHeadingNormal
nmap <buffer> <silent> >} <Plug>OrgDemoteHeadingNormal
nmap <buffer> <silent> >> <Plug>OrgDemoteOnHeadingNormal
nmap <buffer> <silent> >ah <Plug>OrgDemoteHeadingNormal
nmap <buffer> <silent> I <Plug>OrgEditAtFirstCharacter
omap <buffer> <silent> OR :normal VOR
omap <buffer> <silent> Or <Plug>OrgOuterTreeOperator
vmap <buffer> <silent> OR <Plug>OrgAOuterTreeVisual
vmap <buffer> <silent> Or <Plug>OrgOuterTreeVisual
omap <buffer> <silent> OH :normal VOH
omap <buffer> <silent> Oh <Plug>OrgOuterHeadingOperator
vmap <buffer> <silent> OH <Plug>OrgAOuterHeadingVisual
vmap <buffer> <silent> Oh <Plug>OrgOuterHeadingVisual
omap <buffer> <silent> [[ <Plug>OrgJumpToPreviousSkipChildrenOperator
vmap <buffer> <silent> [[ <Plug>OrgJumpToPreviousSkipChildrenVisual
nmap <buffer> <silent> [[ <Plug>OrgJumpToPreviousSkipChildrenNormal
nmap <buffer> <silent> \eh <Plug>OrgExportToHTML
nmap <buffer> <silent> \el <Plug>OrgExportToLaTeX
nmap <buffer> <silent> \ep <Plug>OrgExportToPDF
nmap <buffer> <silent> \caL <Plug>OrgAgendaTimeline
nmap <buffer> <silent> \caa <Plug>OrgAgendaWeek
nmap <buffer> <silent> \cat <Plug>OrgAgendaTodo
nmap <buffer> <silent> \pi <Plug>OrgDateInsertTimestampInactiveWithCalendar
nmap <buffer> <silent> \pa <Plug>OrgDateInsertTimestampActiveWithCalendar
nmap <buffer> <silent> \si <Plug>OrgDateInsertTimestampInactiveCmdLine
nmap <buffer> <silent> \sa <Plug>OrgDateInsertTimestampActiveCmdLine
nmap <buffer> <silent> \ft <Plug>OrgFindTags
nmap <buffer> <silent> \st <Plug>OrgSetTags
nmap <buffer> <silent> \d <Plug>OrgTodoToggleInteractive
nmap <buffer> <silent> \ct <Plug>OrgTodoToggleNonInteractive
nmap <buffer> <silent> \9 zM:set fdl=9
nmap <buffer> <silent> \8 zM:set fdl=8
nmap <buffer> <silent> \7 zM:set fdl=7
nmap <buffer> <silent> \6 zM:set fdl=6
nmap <buffer> <silent> \5 zM:set fdl=5
nmap <buffer> <silent> \4 zM:set fdl=4
nmap <buffer> <silent> \3 zM:set fdl=3
nmap <buffer> <silent> \2 zM:set fdl=2
nmap <buffer> <silent> \1 zM:set fdl=1
nmap <buffer> <silent> \0 zM:set fdl=0
nmap <buffer> <silent> \, <Plug>OrgGlobalToggleFoldingReverse
nmap <buffer> <silent> \. <Plug>OrgGlobalToggleFoldingNormal
omap <buffer> <silent> ]] <Plug>OrgJumpToNextSkipChildrenOperator
vmap <buffer> <silent> ]] <Plug>OrgJumpToNextSkipChildrenVisual
nmap <buffer> <silent> ]] <Plug>OrgJumpToNextSkipChildrenNormal
nmap <buffer> <silent> ^ <Plug>OrgJumpToFirstCharacter
omap <buffer> <silent> ar :normal Var
vmap <buffer> <silent> ar <Plug>OrgAInnerTreeVisual
omap <buffer> <silent> ah :normal Vah
vmap <buffer> <silent> ah <Plug>OrgAInnerHeadingVisual
nmap <buffer> <silent> go <Plug>OrgHyperlinkPreviousLink
nmap <buffer> <silent> gn <Plug>OrgHyperlinkNextLink
nmap <buffer> <silent> gil <Plug>OrgHyperlinkInsert
nmap <buffer> <silent> gyl <Plug>OrgHyperlinkCopy
nmap <buffer> <silent> gl <Plug>OrgHyperlinkFollow
omap <buffer> <silent> g} <Plug>OrgJumpToParentsSiblingOperator
omap <buffer> <silent> g{ <Plug>OrgJumpToParentOperator
vmap <buffer> <silent> g} <Plug>OrgJumpToParentsSiblingVisual
vmap <buffer> <silent> g{ <Plug>OrgJumpToParentVisual
nmap <buffer> <silent> g} <Plug>OrgJumpToParentsSiblingNormal
nmap <buffer> <silent> g{ <Plug>OrgJumpToParentNormal
omap <buffer> <silent> ir <Plug>OrgInnerTreeOperator
vmap <buffer> <silent> ir <Plug>OrgInnerTreeVisual
omap <buffer> <silent> ih <Plug>OrgInnerHeadingOperator
vmap <buffer> <silent> ih <Plug>OrgInnerHeadingVisual
nmap <buffer> <silent> m]] <Plug>OrgMoveSubtreeDownward
nmap <buffer> <silent> m} <Plug>OrgMoveHeadingDownward
nmap <buffer> <silent> m[[ <Plug>OrgMoveSubtreeUpward
nmap <buffer> <silent> m{ <Plug>OrgMoveHeadingUpward
omap <buffer> <silent> { <Plug>OrgJumpToPreviousOperator
vmap <buffer> <silent> { <Plug>OrgJumpToPreviousVisual
nmap <buffer> <silent> { <Plug>OrgJumpToPreviousNormal
omap <buffer> <silent> } <Plug>OrgJumpToNextOperator
vmap <buffer> <silent> } <Plug>OrgJumpToNextVisual
nmap <buffer> <silent> } <Plug>OrgJumpToNextNormal
nmap <buffer> <silent> <C-S-Left> <Plug>OrgTodoSetBackward
nmap <buffer> <silent> <C-S-Right> <Plug>OrgTodoSetForward
nmap <buffer> <silent> <S-Left> <Plug>OrgTodoBackward
nmap <buffer> <silent> <S-Right> <Plug>OrgTodoForward
nmap <buffer> <silent> <C-CR> <Plug>OrgNewHeadingBelowAfterChildrenNormal
nmap <buffer> <silent> <S-CR> <Plug>OrgNewHeadingBelowNormal
nmap <buffer> <silent> <C-S-CR> <Plug>OrgNewHeadingAboveNormal
nmap <buffer> <silent> <S-Tab> <Plug>OrgToggleFoldingReverse
imap <buffer> <silent>  <Plug>OrgPromoteOnHeadingInsert
imap <buffer> <silent>  <Plug>OrgDemoteOnHeadingInsert
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal autoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=85
setlocal colorcolumn=85
setlocal comments=://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'org'
setlocal filetype=org
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=GetOrgFolding()
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=expr
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=GetOrgFoldtext()
setlocal formatexpr=
setlocal formatoptions=qrn1
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetOrgIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=~/.vim/spell/mySpellFile.en.utf-8.add
setlocal spelllang=en
setlocal statusline=%{airline#check_mode()}%#airline_a#%(\ %{get(w:,\ \"airline_current_mode\",\ \"\")}%{airline#extensions#paste#get_mark()}\ %)%#airline_a_to_airline_b#>%#airline_b#%(\ %{airline#extensions#branch#get_head()}\ %)%#airline_b_to_airline_c#>%#airline_c#%<%(\ %f%m\ %)%#airline_c#\ %#airline_file#%{airline#extensions#readonly#get_mark()}\ %=%#airline_c_to_airline_x#<%#airline_x#%(\ %{strlen(&filetype)>0?&filetype:''}\ %)%#airline_x_to_airline_y#<%#airline_y#%(\ %{strlen(&fenc)>0?&fenc:''}%{strlen(&ff)>0?'['.&ff.']':''}\ %)%#airline_y_to_airline_z#<%#airline_z#%(\ %3p%%\ :%3l:%3c\ %)%(%#airline_z_to_airline_warningmsg#<%#airline_warningmsg#\ %{airline#extensions#whitespace#check()}%)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'org'
setlocal syntax=org
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=79
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 1 - ((0 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
