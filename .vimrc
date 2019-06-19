" ============================================================
" This is the list of my common mappings for writing files
" In and out of the Vim language
" Whoohoo!
" ============================================================

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
