" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['syntastic', 'delimitMate', 'nerdtree']
execute pathogen#infect()

syntax on
filetype plugin indent on

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

set linebreak

colorscheme mayansmoke

" Move down 1 displayed line instead of actual line in wrapped text
nnoremap j gj
nnoremap k gk

" Save, Quit
nnoremap <C-f> :w<CR>
nnoremap <C-s> :wa<CR>
nnoremap <C-b> :wq<CR>
nnoremap <C-x> :q!<CR>

" Backspace; Arrow
set whichwrap+=<,>,[,]
set backspace=indent,eol,start

" Add New Line in Normal Mode
nnoremap <S-Enter> O<Esc>j
nnoremap <CR> o<Esc>k

" Split Windows Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab Pages Navigations
nnoremap <S-h> gT
nnoremap <S-l> gt

" Toggle Absolute and Relative Number!
set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc
nnoremap <silent> <F7> :call NumberToggle()<cr>
function! Num()
  set norelativenumber
    set number
endfunc
function! RlNum()
  set nonumber
  set relativenumber
endf
au FocusLost * :call Num()
au FocusGained * :call RlNum()
autocmd InsertEnter * :call Num()
autocmd InsertLeave * :call RlNum()

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_aggregate_errors=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=6

" NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
"autocmd vimenter * NERDTree

" TagList
nnoremap <silent> <F8> :TlistToggle<CR> 

" OmniComplete!
set omnifunc=syntaxcomplete#Complete
"prevent preview
set completeopt-=preview
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Latex-suite
"
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'open -a Skim'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
