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

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

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
set wildignore+=*.o,*.obj,*.pyc,.git

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

" Fix my <Backspace> key (in Mac OS X Terminal)
"set t_kb=
"fixdel

" Avoid loading MatchParen plugin
"let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

" case-insensitive search
:set ignorecase
:set smartcase


" turn off JSLint highlighting 
let g:JSLintHighlightErrorLine = 0

" turn off JSLint automatic checking, it really screws up input mode
let b:jslint_disabled = 1

"
" MAPPINGS
"

" save changes
map ,s :w<CR>
" exit vim without saving any changes
map ,q :q!<CR>
" exit vim saving changes
map ,w :x<CR>
" switch to upper/lower window quickly
map <C-J> <C-W>j
map <C-K> <C-W>k
" use CTRL-F for omni completion
imap <C-F> 
" map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> a<esc>kywgi<esc>Pla<bs>
" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>
" cursor right with <Space>
nmap <Space> l
" open filename under cursor in a new window (use current file's working
" directory) 
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

"colors
colo desert


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


" code folding
function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=99
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/after/syntax/yaml.vim

"quickfix setting
nmap <silent> <F10> :cn!<CR>
nmap <silent> <F9> :cp!<CR>
nmap <silent> <F11> :copen<CR>
nmap <silent> <F12> :cclose<CR>



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


"use +/- to resize horizontal split
map + <c-w>+
map - <c-w>-

"use C-,/C-. to resize vertical split
map < <c-w><
map > <c-w>>


" Set the <Leader> for combo commands
let mapleader = ","
