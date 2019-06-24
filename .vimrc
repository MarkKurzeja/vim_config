" ============================================================
" This is the list of my common mappings for writing files
" In and out of the Vim language
" Whoohoo!
" Mark Kurzeja 2019
" ============================================================

" ============================================================
" This is from the sensible package from t-pope!!!
" These aim to be options that are non-confrontational at 
" worst and useful at best and can be downloaded as a base
" for the vimrc file between two people
" ============================================================
 " sensible.vim - Defaults everyone can agree on
 " " Maintainer:   Tim Pope <http://tpo.pe/>
 " " Version:      1.2
" https://raw.githubusercontent.com/tpope/vim-sensible/master/plugin/sensible.vim

 if exists('g:loaded_sensible') || &compatible
   finish
else
    let g:loaded_sensible = 'yes'
endif

 if has('autocmd')
   filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
    set ttimeout
    set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
    set scrolloff=5
endif
if !&sidescrolloff
    set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
endif

if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
    set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
    set history=1000
endif
if &tabpagemax < 50
    set tabpagemax=50
endif
if !empty(&viminfo)
    set viminfo^=!
endif

set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
    set t_Co=16
endif
 
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==#''
    runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:

" =================================================================
" For the tabbing that is required in python - it just happens 
" To work nice for generic documents! :)
" =================================================================

set autoindent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set softtabstop=4

" =================================================================
" Enabling the smart indent showings so that line wraps are in the 
" same line as their indentation
" =================================================================
" enable indentation
set breakindent
set linebreak

" indent  by an additional 2 characters on wrapped lines, when line >= 40
" characters, put 'showbreak' at start of line
" set breakindentopt=shift:2,min:40,sbr 
set breakindentopt=shift:0,min:40,sbr

" append '>>' to indent
set showbreak=>>   

" Given that the indenting makes moving around harder on a single
" long line, you can remap the up and down keys to navigate inter-
" line and not hop the entire line at a time

" nnoremap k gk
" nnoremap j gj
nnoremap <buffer> k gk
nnoremap <buffer> j gj

" =================================================================
" For quickly editing the VIMRC file - these come in handy a lot
" =================================================================

:nnoremap ec :vsp $MYVIMRC<CR> 
:nnoremap sc :so $MYVIMRC<CR>

" This is a custom file for the project that I am working on
:nnoremap :run :w<esc> :!clear; python3 soln.py<esc>
:nnoremap :test :w<esc> :!clear; python3 tests.py -v <esc>

" Set numbering for each of the lines
set number 

" Set highlighting for searching and a command to turn it off quickly
:set hlsearch
:nnoremap :offhigh :nohlsearch<CR>

" =================================================================
" This is all of the snips that I have for insertion
" =================================================================

inoremap :topic<space> <esc>:-1read ~/vim_snips/topic<CR>14li
inoremap :rtopic<space> <esc>:-1read ~/vim_snips/rtopic<CR>14li
inoremap :cdesc<space> <esc>:-1read ~/vim_snips/compactdesc<CR>j10li
inoremap :cenum<space> <esc>:-1read ~/vim_snips/compactenum<CR>jA
inoremap :citem<space> <esc>:-1read ~/vim_snips/compactitem<CR>jA
inoremap :iim<space> <esc>:-1read ~/vim_snips/itemdesc<CR>6li
inoremap :env<space> <esc>:-1read ~/vim_snips/enviroment<CR>7li

" =================================================================
" These are the commands for spelling turnon and off
" =================================================================
" For spelling you can use [s and ]s to get to the previous and next
" spelling error respectively and you can use z= to find the 
" alternative ways to spell something
nnoremap :spellon :set spell spelllang=en_us
nnoremap :spelloff :set nospell
hi SpellBad guibg=#ff0000 ctermbg=009

" =================================================================
" Set the relative line numbers on
" =================================================================
" turn hybrid line numbers on
:set number relativenumber
:set nu rnu
" turn hybrid line numbers off
" :set nonumber norelativenumber
" :set nonu nornu
" " toggle hybrid line numbers
" :set number! relativenumber!
" :set nu! rnu!s

" =================================================================
" How to use the t-pope packages for vim
" =================================================================

" Surrond --------------------------------------------------------
" https://github.com/tpope/vim-surround
" You can use the cs key tag to change tags, ds to delete tags,
" and <y|c>s<movement><surround> to add / change the surrounding 
" characters
"
" Take line of Hello World with cursor positioned over Hello
" ysiw( => ( Hello ) World
" yss) => (Hello World)
" yss( => ( Hello World )
" yss} => {Hello World}
" Take Line (Hello World) with cursor over Hello
" dss) => Hello World
" cs"' => 'Hello World'
" 
" If you highlight text, then you press S<brace char> to insert it

" Commentary -----------------------------------------------------
" https://github.com/tpope/vim-commentary
" gcc to comment out a line
" gcap to comment out a paragraph
" gc<movement> to comment out a movement
" gc while in visual mode to comment out a bunch of text 

" =================================================================
" This is from the vim-unimpaired package by t-pope - these 
" commands are available and are awesome for line manipulations
" The great majority of these commands were taken from the following 
" doc:
" https://raw.githubusercontent.com/tpope/vim-unimpaired/master/doc/unimpaired.txt
" and the site is located here:
" https://github.com/tpope/vim-unimpaired
" =================================================================

" There are mappings which are simply short normal mode aliases for commonly used ex commands. ]q is :cnext. [q is :cprevious. ]a is :next. [b is :bprevious. See the documentation for the full set of 20 mappings and mnemonics. All of them take a count.

" There are linewise mappings. [<Space> and ]<Space> add newlines before and after the cursor line. [e and ]e exchange the current line with the one above or below it.

" There are mappings for toggling options. [os, ]os, and yos perform :set spell, :set nospell, and :set invspell, respectively.

" OPTION TOGGLING                                 *unimpaired-toggling*

" On  Off Toggle  Option
" *[ob*   *]ob*   *yob*   'background' (dark is off, light is on)
" *[oc*   *]oc*   *yoc*   'cursorline'
" *[od*   *]od*   *yod*   'diff' (actually |:diffthis| / |:diffoff|)
" *[oh*   *]oh*   *yoh*   'hlsearch'
" *[oi*   *]oi*   *yoi*   'ignorecase'
" *[ol*   *]ol*   *yol*   'list'
" *[on*   *]on*   *yon*   'number'
" *[or*   *]or*   *yor*   'relativenumber'
" *[os*   *]os*   *yos*   'spell'
" *[ou*   *]ou*   *you*   'cursorcolumn'
" *[ov*   *]ov*   *yov*   'virtualedit'
" *[ow*   *]ow*   *yow*   'wrap'
" *[ox*   *]ox*   *yox*   'cursorline' 'cursorcolumn' (x as in crosshairs)

" NEXT AND PREVIOUS                               *unimpaired-next*

" The following maps all correspond to normal mode commands.  If a count is
" given, it becomes an argument to the command.  A mnemonic for the "a" commands
" is "args" and for the "q" commands is "quickfix".

" *[a*     |:previous|
" *]a*     |:next|
" *[A*     |:first|
" *]A*     |:last|
" *[b*     |:bprevious|
" *]b*     |:bnext|
" *[B*     |:bfirst|
" *]B*     |:blast|
" *[l*     |:lprevious|
" *]l*     |:lnext|
" *[L*     |:lfirst|
" *]L*     |:llast|
" *[<C-L>* |:lpfile|
" *]<C-L>* |:lnfile|
" *[q*     |:cprevious|
" *]q*     |:cnext|
" *[Q*     |:cfirst|
" *]Q*     |:clast|
" *[<C-Q>* |:cpfile| (Note that <C-Q> only works in a terminal if you disable
" *]<C-Q>* |:cnfile| flow control: stty -ixon)
" *[t*     |:tprevious|
" *]t*     |:tnext|
" *[T*     |:tfirst|
" *]T*     |:tlast|
" *[<C-T>* |:ptprevious|
" *]<C-T>* |:ptnext|
