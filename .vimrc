" ============================================================
" This is the list of my common mappings for writing files
" In and out of the Vim language
" Whoohoo!
" ============================================================

" ============================================================
" This is from the sensible package from t-pope!!!
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
    set listchars=tab:>\
    ,trail:-,extends:>,precedes:<,nbsp:+
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
inoremap :iim<space> <esc>:-1read ~/vim_snips/itemdesc<CR>kdd6li
inoremap :env<space> <esc>:-1read ~/vim_snips/enviroment<CR>7li

" =================================================================
" These are the commands for spelling turnon and off
" =================================================================
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

" Surrond ---------------------------------------------------------
" https://github.com/tpope/vim-surround
" You can use the cs key tag to change tags, ds to delete tags,
" and <y|c>s<movement><surrond> to add / change the surronding 
" characters
"
" Take line of Hello World with curson positined over Hello
" ysiw( => ( Hello ) World
" yss) => (Hello World)
" yss( => ( Hello World )
" yss} => {Hello World}
" Take Line (Hello World) with cursor over Hello
" dss) => Hello World
" cs"' => 'Hello World'

" Commentary -----------------------------------------------------
" https://github.com/tpope/vim-commentary
" gcc to comment out a line
" gcap to comment out a paragraph
" gc<movement> to comment out a movement
" gc while in visual mode to comment out a bunch of text 
