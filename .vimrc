"SETTINGS---------------------------------------
set nocompatible  " Use Vim settings (versus Vi compatible)
set autoread      " Automatically reload when a file is changed outside of Vim
set nobackup      " Do not automatically backup files
set history=10000  " Remember 1000 lines of command line history
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
set hidden "allow buffer hiding wihtout saving or prompt
" map \ to leader char
let mapleader = "\\"
" remove annoying commment inserts
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" paste over selection without losing yank
vnoremap p "_dP

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

" Open new split panes to right and bottom
set splitbelow
set splitright

set laststatus=2 "show status line
set cursorline "highlight current line
set colorcolumn=80,120 "vertical line
set mouse=a          " Enable mouse use for all modes
if has("mouse_sgr")
    set ttymouse=sgr
else
    if !has('nvim')
        set ttymouse=xterm2
    endif
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

" use system cliboard
set clipboard=unnamed
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#begin('~/.vim/plugged')
" setup plugins
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'vim-scripts/LargeFile'
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle','NERDTreeFind'] }
    Plug 'majutsushi/tagbar'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'sgur/ctrlp-extensions.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'easymotion/vim-easymotion'
    Plug 'tomtom/tcomment_vim'
    Plug 'Valloric/YouCompleteMe', { 'on': [] }
    Plug 'terryma/vim-multiple-cursors'
    Plug 'chrisbra/csv.vim', {'for': 'csv' }
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    " Plug 'jeaye/color_coded'
    Plug 'rhysd/vim-clang-format', { 'on': [] }
"    Plug 'edkolev/tmuxline.vim'
    Plug 'craigemery/vim-autotag'
    Plug 'dyng/ctrlsf.vim'
if has('nvim')
    " Plug 'fntlnz/atags.vim'
endif
call plug#end()

" setup python support using virtenv
if has('nvim')
    let g:python_host_prog = '/opt/bb/bin/python'
    let g:python3_host_prog = '/opt/bb/bin/python3'
endif

"**************************************************************************
" ctrlp
"**************************************************************************
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMixed<CR>
nmap <leader>r :CtrlPMRU<CR>
nmap <leader>t :CtrlPBufTag<CR>
let g:ctrlp_max_files = 0 " no file limit
let g:ctrlp_max_depth = 100 " The maximum depth of a directory tree to recurse into
let g:ctrlp_follow_symlinks = 1 " follow but ignore looped internal symlinks to avoid duplicates.
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'refroot\|build\|.*\.orig\|00deps\|.*llcalc_work.*\|\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|a|d|dd|sundev1|linux|orig)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_working_path_mode = 'rw' "begin finding a root from the current working directory outside of CtrlP
"  \ 'dir':  '\v[\/]undev1\|00deps\|.*llcalc_work.*',
let g:ctrlp_extensions = ['buffertag', 'undo', 'line', 'mixed']

" open nerdtree with
nmap <F5> :NERDTreeFind<CR>
let g:NERDTreeMouseMode=2 "single click will open directory nodes, while a double click will still be required for file nodes

" toggle relative number with \n
let g:UseNumberToggleTrigger = 0
nmap <leader>n :call NumberToggle()<CR>

" toggle tagbar with
nmap <F8> :TagbarToggle<CR>
" make usre that tagbar is fast
autocmd FileType tagbar setlocal nocursorline nocursorcolumn nonumber

" dispatch shortcut
nmap <leader>d :Dispatch make
" add the path to builds from directories other than current working dir, the
" build needs to echo this
set errorformat+=%DEntering\ dir\ '%f',%XLeaving\ dir
" toggle word wrap
nmap <leader>w :set wrap!<CR>

" format xml
nmap <leader>fx :%!xmllint --format -<CR>
vnoremap <leader>fx :!xmllint --format -<CR>

" format json
nmap <leader>fj :%!python -m json.tool<CR>
vnoremap <leader>fj :!python -m json.tool<CR>

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
let g:airline#extensions#tagbar#enabled = 1                 " Enable Tagbar integration
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

"**************************************************************************
" vim-autotag
"**************************************************************************
" let g:autotagDisabled = 1

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

"""""""" YouCompleteMe
let g:ycm_filetype_whitelist = { 'cpp': 1, 'python': 1 }
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf_global.py'
let g:ycm_extra_conf_globlist = ['.ycm_extra_conf.py','!*refroot/*']

"SETTINGS---------------------------------------
nmap <F2> :YcmCompleter GoTo<CR>
nmap <F3> :YcmCompleter GoToDeclaration<CR>
nmap <F4> :YcmCompleter GoToDefinition<CR>

"**************************************************************************
" atags.vim
"**************************************************************************
if has('nvim')

" commmand to start indexers and generate new tags
function! s:StartIDE()
    call system('ctags .')
    " Generate tags everytime a file is being written.
    call plug#load('vim-clang-format')
    call plug#load('YouCompleteMe')
    :TagbarOpen
    :NERDTreeToggle
endfunction
command StartIDE call s:StartIDE()

function! s:FClangFormat()
    vi{:ClangFormat
endfunction
command FClangFormat call s:FClangFormat()

" let g:atags_build_commands_list = [
"     \"ctags -R --languages=+C++,C,Python,Make --c++-kinds=+p --fields=+iaSl --extra=+q --links=yes --python-kinds=-i -f tags.tmp",
"     \"mv -f tags.tmp tags",
"     \]
endif
"Information on the following setting can be found with
":help set
