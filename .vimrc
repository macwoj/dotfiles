"SETTINGS--------------------------------------- 
set nocompatible  " Use Vim settings (versus Vi compatible)
set autoread      " Automatically reload when a file is changed outside of Vim
set nobackup      " Do not automatically backup files
set history=1000  " Remember 1000 lines of command line history
syntax on "syntax highlight
filetype plugin indent on
" default indentation: 4 spaces, tabs to spaces
set ts=4 sts=4 sw=4 expandtab
set autoindent "turn on auto indent
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
  elseif has("gui_win32")
    set guifont=Courier_New:h16:cDEFAULT
  endif
endif
" Shortcut to rapidly toggle `set list` -> /l 
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:?\ ,eol:¬
"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
    
" jump to the beginning/end of a function that does not have a "{" in the first column
map [[ ?{<CR>
map [] ?}<CR>
map ][ /{<CR>
map ]] /}<CR>

" toggle relative/absolute line numbers map to C-n
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" switch to absolute line numbers whenever Vim loses focus
:au FocusLost * :set norelativenumber
:au FocusGained * :set relativenumber

" use absolute line numbers when we’re in insert mode and relative numbers when we’re in normal mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Uncomment below to make screen not flash on error
" set vb t_vb=""
if has("gui_win32")
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'vim-scripts/LargeFile'
  Plugin 'mileszs/ack.vim'
  "Plugin 'scrooloose/nerdtree'
  call vundle#end()
endif

"autocmd vimenter * NERDTree

"Information on the following setting can be found with
":help set
