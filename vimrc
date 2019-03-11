" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==============================
call plug#begin('~/.vim/plugged')
" ------------------------------
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'   " nerdtree git icons
Plug 'tpope/vim-fugitive'            " git wrapper
Plug 'editorconfig/editorconfig-vim' " enforce editor configs
Plug 'ervandew/supertab'             " tab do all the things
Plug 'godlygeek/tabular'  
Plug 'plasticboy/vim-markdown'       " Markdown support  
Plug 'ludovicchabant/vim-gutentags'
Plug 'stephpy/vim-yaml'              " yaml syntax support
Plug 'benmills/vimux' 
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'  " better grepping ( source code aware )
Plug 'christoomey/vim-tmux-navigator' " seemless transition between vim and tmux

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabContextDefaultCompletionType = "<c-k>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabLongestEnhanced = 1



let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''

let g:ackprg = 'ag --nogroup --nocolor --column' " use ag instead of default

" ------------------------------
call plug#end()
" ==============================

" Basic
set autoread				" relead on external file changes
set backspace=indent,eol,start		" backspace behavior
set clipboard=unnamed,unnamedplus	" enable clipboard
set encoding=utf-8                      " enable utf-8 support
set hidden				" hide buffers, don't close
set number				" show line numbers
set wildmenu wildmode=longest:full,full " wildmenu settings
set wildcharm=<Tab>                     " wildmenu character
set showcmd                             " show command keys
set splitbelow splitright

" UI
filetype on
filetype plugin on
filetype indent on
syntax on

set sidescroll=6
set listchars=eol:¶,trail:•,tab:▸\               " whitespace characters
"set scrolloff=999                                " center cursor position vertically
set showbreak=¬\                                 " Wrapping character
set showmatch

" Colors
"hi Normal guibg=NONE ctermbg=NONE|		" transparency fix
hi Search ctermfg=black|              " highlight fix
hi Error ctermfg=black|
hi ErrorMsg ctermfg=black|              " highlight fix
hi PmenuSbar ctermfg=black|
hi DiffText ctermfg=black|              " highlight fix
hi Visual ctermfg=black|
hi CursorColumn ctermfg=black|
hi Folded ctermfg=lightblue|
hi NvimInternalError ctermfg=black|

" Tabs & Indentation
set autoindent expandtab
set shiftwidth=2 softtabstop=2 tabstop=2


" Search
set hlsearch ignorecase incsearch smartcase      " search options


" Undo & Backup
set nobackup noswapfile nowritebackup            " disable backup and swap files
set undofile undodir=~/.vim/undo undolevels=9999 " undo options


" Performance Tuning
set lazyredraw					 " enable lazy redraw
set nocursorline                                 " disable cursorline          
set noshowmode
set ttyfast                                      " enable fast terminal connection

" Tags
set tags+=tags
set tags+=../tags
set tags+=~/.tags
set tags+=~/.local/share/tags

" Key Bindings
let mapleader=','                                " leader key

" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
"
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Quick edit config files
nnoremap <leader>ed :edit ~/.dotfiles/<CR>|
nnoremap <leader>ev :edit ~/.vimrc<CR>|
nnoremap <leader>et :edit ~/.tmux.conf<CR>|
nnoremap <leader>ep :edit ~/.local/share/zsh/init.d/06-prompt.zsh<CR>|
nnoremap <leader>eg :edit ~/.gitconfig<CR>|

nnoremap <leader>, :let @/=''<CR>:noh<CR>|       " clear search
nnoremap <silent> <leader># :g/\v^(#\|$)/d_<CR>| " delete commented blank lines
nnoremap <leader>b :ls<CR>:buffer<space>|        " show buffer
nnoremap <silent> <leader>i gg=G``<CR>|          " indent file
nnoremap <leader>l :set list! list?<CR>|         " show invisible character
nnoremap <leader>m :marks<CR>|                   " list marks
nnoremap <leader>p :set invpaste paste?<CR>|     " toggle paste mode
nnoremap <leader>s :retab<CR>|                   " convert tabs to space
nnoremap <leader>r :source $MYVIMRC<CR>|          " reload .vimrc


nnoremap <silent> <leader>t :%s/\+$//e|          " trim whitespace            
nnoremap <leader>o :edit<space><Tab>|            " open buffer
nnoremap <leader>x :bd<CR>|                      " close buffer
nnoremap <leader>w :set wrap! wrap?<CR>|         " toggle wrapping
nnoremap <silent> <leader>n :enew<CR>|           " new empty buffer
nnoremap <silent> <S-Right> :bn<CR>|             " next buffer
nnoremap <silent> <S-Left> :bp<CR>|              " previous buffer
map <leader>d "_d|                               " delete selected text


" Custom Commands
cnoreabbrev w!! w !sudo tee > /dev/null %|       " write file with sudo

" Netr: settings
let g:netrw_banner=0
let g:netrw_browse_split=1

let s:hidden_all = 0
function! ToggleHiddenAll()
  if s:hidden_all  == 0
    let s:hidden_all = 1
    set noshowmode
    set noruler
    set laststatus=0
    set noshowcmd
    TagbarClose
    NERDTreeClose
  else
    set foldcolumn=0
    let s:hidden_all = 0
    set showmode
    set ruler
    set laststatus=2 
    set showcmd
    NERDTree
    TagbarOpen
  endif
endfunction

nnoremap <silent> <leader>h :call ToggleHiddenAll()<CR>

