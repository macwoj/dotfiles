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
set showmatch " Highlight matching braces
set ruler "display info on bottom right
set number "display line numbers
set backspace=indent,eol,start "allow backspace
set hlsearch "highlight search
set incsearch "incremental search
set autowriteall "automatically save any changes made to the buffer before it is hidden
" map \ to leader char
let mapleader = "\\"

" Open new split panes to right and bottom
set splitbelow
set splitright

set laststatus=2 "show status line
set cursorline "highlight current line
"set current line color
"highlight CursorLine cterm=NONE ctermbg=235 guibg=#262626
set mouse=a          " Enable mouse use for all modes
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
" Disable sound/visual bell on errors
set noerrorbells
set novisualbell
set ttimeoutlen=50 " increase ESC speed
" screen not flash on error
set t_vb=

" set text and font
set encoding=utf-8
if has("gui_running")
    if has("gui_win32")
        set guifont=DejaVu_Sans_Mono_for_Powerline:h10
    else
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
    endif
endif

" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,trail:.
" \l toggles showing eol chars
" nmap <leader>l :set list!<CR>
" Invisible character colors
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

" jump to the beginning/end of enclosing scope
map [[ [{
map ]] ]}

" use system cliboard
set clipboard=unnamed
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

" setup plugins
if has("gui_win32")
  " Windows swap error fix
  set directory=.,$TEMP
  set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
  call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'vim-scripts/LargeFile'
    Plugin 'mileszs/ack.vim'
    Plugin 'rking/ag.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'jeffkreeftmeijer/vim-numbertoggle'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'majutsushi/tagbar'
"    Plugin 'xolox/vim-misc'
"    Plugin 'xolox/vim-easytags'
"    Plugin 'vim-scripts/taglist.vim'
    Plugin 'kien/ctrlp.vim'
    Plugin 'ivalkeen/vim-ctrlp-tjump'
    Plugin 'lyuts/vim-rtags'
    Plugin 'tpope/vim-dispatch'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'vim-scripts/a.vim'
    Plugin 'Valloric/YouCompleteMe'
    "Plugin 'Rip-Rip/clang_complete'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'terryma/vim-multiple-cursors'
"    Plugin 'haya14busa/incsearch.vim'
"    Plugin 'haya14busa/incsearch-fuzzy.vim'
"    Plugin 'edkolev/tmuxline.vim'
call vundle#end()

" ctrlp
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMixed<CR>
nmap <leader>r :CtrlPMRU<CR>
let g:ctrlp_max_files = 0 " no file limit
let g:ctrlp_max_depth = 100 " The maximum depth of a directory tree to recurse into
let g:ctrlp_follow_symlinks = 1 " follow but ignore looped internal symlinks to avoid duplicates.
let g:ctrlp_custom_ignore = {
  \ 'dir':  '00deps\|.*llcalc_work.*\|\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|a|d|dd|sundev1|linux|orig)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_working_path_mode = 'rw' "begin finding a root from the current working directory outside of CtrlP
"  \ 'dir':  '\v[\/]undev1\|00deps\|.*llcalc_work.*',
" open nerdtree with \t
nmap <leader>t :NERDTreeToggle<CR>
let g:NERDTreeMouseMode=2 "single click will open directory nodes, while a double click will still be required for file nodes

" toggle relative number with \n
let g:UseNumberToggleTrigger = 0
nmap <leader>n :call NumberToggle()<CR>

" toggle tagbar with \b
nmap <F8> :TagbarToggle<CR>
" make usre that tagbar is fast
autocmd FileType tagbar setlocal nocursorline nocursorcolumn nonumber

" dispatch shortcut
nmap <leader>d :Dispatch make -f %<CR>
" add the path to builds from directories other than current working dir, the
" build needs to echo this
set errorformat+=%DEntering\ dir\ '%f',%XLeaving\ dir
" toggle word wrap
nmap <leader>w :set wrap!<CR>

" map \gf (global find) to Ag seatch
nmap <leader>gf :Ag -f --cpp 
vnoremap <leader>gf y:Ag -f --cpp '<C-R>"'

" change the default EasyMotion shading to something more readable with
" Solarized
hi link EasyMotionTarget2First EasyMotionTarget
hi link EasyMotionTarget2Second EasyMotionTarget
" solarized
if has("gui_running")
else
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  set t_Co=256
endif
let g:solarized_visibility="low"
let g:solarized_contrast="high"
set background=light
colorscheme solarized

" set status line theme
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse = 0                         " Do not collapse the status line while having multiple windows
let g:airline#extensions#whitespace#enabled = 0             " Do not check for whitespaces
let g:airline#extensions#tabline#enabled = 1                " Display tab bar with buffers
let g:airline#extensions#tabline#buffer_nr_show = 1         " Display buffer number
let g:airline#extensions#branch#enabled = 1                 " Enable Git client integration
let g:airline#extensions#tagbar#enabled = 0                 " Enable Tagbar integration
let g:airline#extensions#hunks#enabled = 0                  " Enable Git hunks integration

"tmux line
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R'}

"      \,'z'    : '#(hostname)'
"      \,'c'    : '#W'

" a.vim
" switches to the header file corresponding to the current file being edited (or vise versa)
nmap <leader>a :A<CR>
" splits and switches
nmap <leader>as :AS<CR>
" vertical splits and switches
nmap <leader>av :AV<CR>
" new tab and switches
nmap <leader>at :AT<CR>
" cycles through matches
nmap <leader>an :AN<CR>

"**************************************************************************
" nerdcommenter
"**************************************************************************
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'start'
" do not rm spaces since we are commenting at first line
let g:NERDRemoveExtraSpaces = 0

"**************************************************************************
" gitgutter
"**************************************************************************
" turn off vim-gitgutter by default
let g:gitgutter_enabled = 0

" YouCompleteMe
let g:ycm_filetype_whitelist = { 'cpp': 1, 'hpp': 1, 'h': 1 }
"Information on the following setting can be found with
":help set
