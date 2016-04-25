"SETTINGS--------------------------------------- 
set nocompatible  " Use Vim settings (versus Vi compatible)
set autoread      " Automatically reload when a file is changed outside of Vim
set nobackup      " Do not automatically backup files
set history=1000  " Remember 1000 lines of command line history
set clipboard=unnamedplus "use system clipboard
syntax on "syntax highlight
filetype plugin indent on
set tabstop=4 "tab size
set expandtab "tabs to spaces
set autoindent "turn on auto indent
set shiftwidth=4  "this is the level of autoindent, adjust to taste
set smartindent   "does the right thing (mostly) in programs
set ruler "display info on bottom right
set number "display line numbers
set backspace=indent,eol,start "allow backspace
set hlsearch "highlight search
set incsearch "incremental search
colorscheme torte
set cursorline "highlight current line
"set current line color
highlight CursorLine cterm=NONE ctermbg=235 guibg=#262626 
set mouse=a          " Enable mouse use for all modes
" Disable sound/visual bell on errors
set noerrorbells
set novisualbell

" set font and text size for gvim
set t_vb=
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Courier\ New\ 20
  elseif has("gui_photon")
    set guifont=Courier\ New:s20
  elseif has("gui_kde")
    set guifont=Courier\ New/20/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Courier_New:h20:cDEFAULT
  endif
endif

" jump to the beginning/end of a function that does not have a "{" in the first column
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" Uncomment below to make screen not flash on error
" set vb t_vb=""

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
"call vundle#end()

"autocmd vimenter * NERDTree

"Information on the following setting can be found with
":help set
