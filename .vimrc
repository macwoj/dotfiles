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

" jump to the beginning/end of enclosing scope
map [[ [{
map ]] ]}

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
    Plug 'mileszs/ack.vim'
    Plug 'rking/ag.vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle','NERDTreeFind'] }
    Plug 'airblade/vim-gitgutter'
    Plug 'majutsushi/tagbar'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'sgur/ctrlp-extensions.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'easymotion/vim-easymotion'
    Plug 'tomtom/tcomment_vim'
    Plug 'vim-scripts/a.vim'
    Plug 'Valloric/YouCompleteMe', { 'on': [] }
    Plug 'lyuts/vim-rtags', { 'on': [] }
    Plug 'ronakg/quickr-cscope.vim', { 'on': [] }
    Plug 'terryma/vim-multiple-cursors'
    Plug 'chrisbra/csv.vim', {'for': 'csv' }
"    Plug 'edkolev/tmuxline.vim'
if has('nvim')
    Plug 'fntlnz/atags.vim'
endif
call plug#end()

" easymotion
map 8 \\b
map 9 \\w

" ctrlp
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMixed<CR>
nmap <leader>r :CtrlPMRU<CR>
nmap <leader>t :CtrlPBufTag<CR>
let g:ctrlp_max_files = 0 " no file limit
let g:ctrlp_max_depth = 100 " The maximum depth of a directory tree to recurse into
let g:ctrlp_follow_symlinks = 1 " follow but ignore looped internal symlinks to avoid duplicates.
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '.*\.orig\|00deps\|.*llcalc_work.*\|\.(git|hg|svn)$',
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
nmap <leader>d :Dispatch make -f %<CR>
" add the path to builds from directories other than current working dir, the
" build needs to echo this
set errorformat+=%DEntering\ dir\ '%f',%XLeaving\ dir
set errorformat+=%Zplink\ error:\ %m
" toggle word wrap
nmap <leader>w :set wrap!<CR>

" map \gf (global find) to Ag seatch
nmap <leader>gf :Ag -f --cpp 
vnoremap <leader>gf y:Ag -f --cpp '<C-R>"'

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

" """""""" Use deoplete.
" let g:deoplete#enable_at_startup = 1
" if !exists('g:deoplete#omni#input_patterns')
"     let g:deoplete#omni#input_patterns = {}
" endif
" " Close the documentation window when completion is done
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" " deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['buffer']
" " let g:deoplete#sources.cpp = ['buffer', 'tag','clang_complete']
" let g:deoplete#sources.cpp = ['buffer', 'tag']
" let deoplete#tag#cache_limit_size = 100000000
"
" """""""" clang_complete
" let g:clang_complete_auto = 0
" let g:clang_auto_select = 0
" let g:clang_omnicppcomplete_compliance = 0
" let g:clang_make_default_keymappings = 0
" let g:clang_library_path='/home/mwojton/work/linux/lib/'

"""""""" YouCompleteMe
let g:ycm_filetype_whitelist = { 'cpp': 1, 'python': 1 }
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_python_binary_path = 'bbpy2.7'

" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
nmap <F2> :YcmCompleter GoTo<CR>
nmap <F3> :YcmCompleter GoToDeclaration<CR>
nmap <F4> :YcmCompleter GoToDefinition<CR>

"**************************************************************************
" quickr-cscope.vim.vim
"**************************************************************************
let g:quickr_cscope_keymaps = 0
nmap <leader>cs <plug>(quickr_cscope_symbols)
nmap <leader>cg <plug>(quickr_cscope_global)
nmap <leader>cc <plug>(quickr_cscope_callers)
nmap <leader>cf <plug>(quickr_cscope_files)
nmap <leader>ci <plug>(quickr_cscope_includes)
nmap <leader>ct <plug>(quickr_cscope_text)
nmap <leader>ce <plug>(quickr_cscope_egrep)
nmap <leader>cd <plug>(quickr_cscope_functions)

"**************************************************************************
" atags.vim
"**************************************************************************
if has('nvim')
" Generate tags everytime a file is being written.
autocmd BufWritePost * call GenerateATags()

" command StartIDE atags#generate()

function! GenerateATags()
    call atags#generate()
    call plug#load('quickr-cscope.vim')
endfunction

" update ctags file
nmap <leader>ut :call GenerateATags()<CR>

" commmand to start indexers and generate new tags
function! s:StartIDE()
    call GenerateATags()
    call plug#load('YouCompleteMe')
    " call jobstart('startRtags.sh; rc .')
    " call plug#load('vim-rtags')
endfunction
command StartIDE call s:StartIDE()

let g:atags_build_commands_list = [
    \"ctags -R --c++-kinds=+p --fields=+iaSl --extra=+q --links=yes --python-kinds=-i -f tags.tmp",
    \"mv -f tags.tmp tags",
    \"find . -name \"*.c\" -o -name \"*.cc\" -o -name \"*.hpp\" -o -name \"*.h\" -o -name \"*.cpp\" >.cscopelist.tmp",
    \"cscope -q -R -b -i .cscopelist.tmp",
    \"rm .cscopelist.tmp"
    \]
endif
"Information on the following setting can be found with
":help set
