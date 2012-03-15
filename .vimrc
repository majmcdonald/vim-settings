"
" MAIN CUSTOMIZATION FILE
"

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on
"
" so we can undo after switching buffers
set hidden

" Turn syntax highlighting on
syntax on


" Turn line numbers on
set nu 

"
" GLOBAL SETTINGS
"

"set underscore as a word seperator
":set iskeyword-=_
"set dash as a word seperator
:set iskeyword-=-

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
" set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100


" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
"set matchtime=2

" Don't highlight results of a search
set nohlsearch

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" Show line, column number, and relative position within a file in the status line
set ruler
:set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Special python indenting
"let g:pyindent_open_paren = '&sw'
"let g:pyindent_nested_paren = '&sw'
"let g:pyindent_continue = '&sw'


" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set noshowmatch
"
" use spaces instead of tabs
set expandtab

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Write swap file to disk after every 50 characters
set updatecount=50

" Ignore certain types of files on completion
set wildignore+=*.o,*.obj,*.pyc,.git,.svn

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
 set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Avoid loading MatchParen plugin
"let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

" case-insensitive search
:set ignorecase
:set smartcase

" Enable incremental search
set incsearch

" turn off JSLint highlighting 
let g:JSLintHighlightErrorLine = 0

" turn off JSLint automatic checking, it really screws up input mode
let b:jslint_disabled = 1

"
" MAPPINGS
"

" use CTRL-F for omni completion
imap <C-F> 
" map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> a<esc>kywgi<esc>Pla<bs>
" map <space>f to display all lines with keyword under cursor and ask which one to
" jump to
nmap <space>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>
" open filename under cursor in a new window (use current file's working
" directory) 
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=

"colors
colo delek


" Generic highlight changes
highlight Comment cterm=none ctermfg=Gray
highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
highlight Search cterm=none ctermfg=Black ctermbg=DarkYellow
highlight String cterm=none ctermfg=DarkGreen
highlight treeDir cterm=none ctermfg=Cyan
highlight treeUp cterm=none ctermfg=DarkYellow
highlight treeCWD cterm=none ctermfg=DarkYellow
highlight netrwDir cterm=none ctermfg=Cyan

" Set up cscope options
if has("cscope")
	set csprg=cscope
	set csto=0
	set cst
	set nocsverb
	cs add cscope.out
	set csverb
	map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
	map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
	map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
endif




" Folding rules {{{
set foldenable                  " enable folding
set foldmethod=syntax           " detect triple-{ style fold markers
set foldlevelstart=1            " start out with everything un-folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo


au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/after/syntax/yaml.vim

"quickfix setting
nmap <silent> <F10> :cn!<CR>
nmap <silent> <F9> :cp!<CR>
nmap <silent> <F11> :copen<CR>
"nmap <silent> <F12> :cclose<CR>



"
" NERDTree configuration
"

" Increase window size to 35 columns
let NERDTreeWinSize=35

" map <F7> to toggle NERDTree window
nmap <silent> <F7> :NERDTreeToggle<CR>

nmap <silent> <F4> 
	\ :!ctags -f ./tags
	\ --langmap="php:+.inc"
	\ -h ".inc.php,.hpp" -R --totals=yes
	\ --tag-relative=yes --PHP-kinds=+cf-v .<CR>

	
	set tags=./tags,tags

"" ctrl-n to jump to next tag
nmap <silent> <C-n> :tn<CR>
nmap <silent> <C-p> :tp<CR>

"set lcs=tab:│\ ,trail:·,extends:>,precedes:<,nbsp:&
"set lcs=tab:└─,trail:·,extends:>,precedes:<,nbsp:&
set lcs=tab:│┈,trail:·,extends:>,precedes:<,nbsp:&
set list

" use <F2> to toggle indent lines 
nmap <silent> <F2> :set list!<CR>

"allow 256 colors
set t_Co=256


" Open a new horizontal split
nnoremap <silent> <Space>s :sp<CR>
" Open a new horizontal split
nnoremap <silent> <Space>n :new<CR>
" Open a new vertical split
nnoremap <silent> <Space>v :vs<CR>
" close other open windows
nnoremap <silent> <Space>o <C-W>o
" Move around between splits
nnoremap <Space>h <C-W>h
nnoremap <Space>l <C-W>l
nnoremap <Space>j <C-W>j
nnoremap <Space>k <C-W>k

"Open a scratch buffer in a split window
nnoremap <silent> <Space>S :Sscratch<CR>


"use +/- to resize horizontal split
map + <c-w>+
map - <c-w>-

" Set the <Leader> for combo commands
let mapleader = ","

"Force Saving Files that Require Root Permission
cmap w!! %!sudo tee > /dev/null %

map K <c-u>
map J <c-d>

" doesn't seem to work well
" autocmd FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"pydiction got in the way of ctag keywords
"let g:pydiction_location = '~/.vim/pydiction/complete-dict'


"call pathogen#infect()

autocmd FileType python map <buffer> <F5> :call Flake8()<CR>

