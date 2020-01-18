" Daniel de Schiffart's vim startup script

" Vim configuration files can be found at github.com/ekspek/vimfiles.
" Check README.md for extra information.

"- - - - - - - - - - "
" Preloaded settings "
"- - - - - - - - - - "

" Get the defaults while I don't move them over to this file
source $VIMRUNTIME/defaults.vim

" Disable compatibility with Vi
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If XTerm is acting up, add these lines to your ~/.Xdefaults file.
"
"     *customization: -color
"     XTerm*termName: xterm-256color
"     XTerm*Background: black
"     XTerm*Foreground: white

" If XTerm is STILL acting up, add the same lines to your ~/.Xresources file
" (create one if necessary) and run the following command in the terminal.
"
"     xrdb -merge ~/.Xresources
" 
" Replace '-merge' with '-remove' to undo.

" Detects XTerm and forces 256 colors. Use only if necessary.
" This segment was replaced by the lines above.
"
"     if $TERM == "xterm-256color"
"     	set t_Co=256
"     endif

" Messing around with 256-color terminal settings got me here. Looks
" nicer on most color schemes.
let g:rehash256=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows compatibility block
" Because sometimes you have to do things the hard way
"
" Find your .vimrc by running :echo $MYVIMRC
" Put your .vim folder contents in C:\Users\<username>\vimfiles\

" If you're using gVim
if has('gui_running')
	set guifont=Inconsolata_for_Powerline:h11:cANSI:qDRAFT
	"set guifont=Space_Mono_for_Powerline:h10:cANSI:qDRAFT
	set encoding=utf-8
	set fileencoding=utf-8
	set hlsearch
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other compatibility and version checks
"
" Most of these came with Vim itself. They're probably worth keeping.
if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file (restore to previous version)
	if has('persistent_undo')
		set undofile	" keep an undo file (undo changes after closing)
	endif
endif

if &t_Co > 2
	" Switch on highlighting the last used search pattern.
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
	au!

	" For all text files set 'textwidth' to 76 characters.
	autocmd FileType text setlocal textwidth=76
	augroup END
else
	" always set autoindenting on
	set autoindent
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"- - - - - - - - - - - - "
" Standard Vim settings  "
"- - - - - - - - - - - - "

" Set the tab length to four spaces
set tabstop=4
set shiftwidth=4
set noexpandtab

" Set display numbers
set number
set relativenumber

" Use the external clipboard
"set clipboard=unnamedplus

" Display control characters
set list
set listchars=tab:>·,

" Stick indentations to 4-space multiples
set shiftround

" FIletype-specific indentations
filetype indent on

" Vim native autocomplete
filetype plugin on
syntax on
set omnifunc=syntaxcomplete#Complete

" Less redraws
set lazyredraw

" Set netrw preferences
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

" Reload changed files automatically
set autoread

" Search case sensitivity options
set ignorecase
set smartcase

" Set Vim default
set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.

" Leave folds open on startup
set foldlevel=99

" Split settings
set splitbelow
set splitright

"- - - - - "
" Mappings "
"- - - - - "

" Set leader key
let mapleader = ','

" Drag lines up or down
nnoremap - ddp
nnoremap _ ddkP

" Change begin and end line characters
nnoremap L $
vnoremap L $
onoremap L $
nnoremap H 0
vnoremap H 0
onoremap H 0
nnoremap $ L
vnoremap $ L
onoremap $ L
nnoremap 0 H
vnoremap 0 H
onoremap 0 H

" Clone the current line downwards
nnoremap <c-j> yyp

" Tab navigation binds
nnoremap <leader>h :tabprevious<cr>
nnoremap <leader>l :tabnext<cr>
nnoremap <leader>k :tabfirst<cr>
nnoremap <leader>j :tablast<cr>

" Open .vimrc NOW
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Run the macro saved in register s (space)
nnoremap <space> @s

" Show stored marks
nnoremap <leader>m :marks<cr>

" Show registers
nnoremap <leader>r :reg<cr>

" Escape key alternative
inoremap jk <esc>

" Map a split of netrw
nnoremap <F3> :Vexplore<cr>

" Resize splits
nnoremap <C-Up> :resize -3<cr>
nnoremap <C-Down> :resize +3<cr>
nnoremap <C-Left> :vertical resize -3<cr>
nnoremap <C-Right> :vertical resize +3<cr>

"- - - - - - - - - "
" Plugin settings  "
"- - - - - - - - - "

" Set color scheme
let g:airline_theme='night_owl'

" Undo tree toggle mapping
nnoremap <F2> :UndotreeToggle<cr>

" Enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1

colorscheme molokai
colorscheme molokayo
colorscheme molokayo

