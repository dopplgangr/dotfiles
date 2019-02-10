" Basic
set autoread				" relead on external file changes
set backspace=indent,eol,start		" backspace behavior
set clipboard=unnamed,unnamedplus	" enable clipboard
set encoding=utf-8                      " enable utf-8 support
set hidden				" hide buffers, don't close
set number				" show line numbers
set term=xterm-256color                 " terminal type
set wildmenu wildmode=longest:full,full " wildmenu settings
set wildcharm=<Tab>                     " wildmenu character
set showcmd                             " show command keys
set splitbelow splitright
"set autochdir                          " switch to files local directory


" UI
filetype plugin indent on
set listchars=eol:¶,trail:•,tab:▸\               " whitespace characters
set scrolloff=999                                " center cursor position vertically
set showbreak=¬\                                 " Wrapping character
set showmatch
syntax on


" Colors
hi Normal guibg=NONE ctermbg=NONE|		" transparency fix


" Ruler
set laststatus=0
set ruler rulerformat=%50(%=%<%F%m\ ›\ %{getfsize(@%)}B\ \›\ %l/%L:%v%)


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
set ttyfast                                      " enable fast terminal connection


" Key Bindings
let mapleader=','                                " leader key
nnoremap <leader>, :let @/=''<CR>:noh<CR>|       " clear search
nnoremap <silent> <leader># :g/\v^(#\|$)/d_<CR>| " delete commented blank lines
nnoremap <leader>b :ls<CR>:buffer<space>|        " show buffer
nnoremap <silent> <leader>i gg=G``<CR>|          " indent file
nnoremap <leader>l :set list! list?<CR>|         " show invisible character
nnoremap <leader>m :marks<CR>|                   " list marks
nnoremap <leader>p :set invpaste paste?<CR>|     " toggle paste mode
nnoremap <leader>s :retab<CR>|                   " convert tabs to space
nnoremap <leader>r :source $MYVIMRC<CR>|          " reload .vimrc
nnoremap <leader>e :edit $MYVIMRC<CR>|
nnoremap <silent> <leader>t :%s/\+$//e|          " trim whitespace            
nnoremap <leader>o :edit<space><Tab>|            " open buffer
nnoremap <leader>x :bd<CR>|                      " close buffer
nnoremap <silent> <leader><space> :Explore<CR>|  " open netrw
nnoremap <leader>w :set wrap! wrap?<CR>|         " toggle wrapping
nnoremap <silent> <leader>n :enew<CR>|           " new empty buffer
nnoremap <silent> <S-Right> :bn<CR>|             " next buffer
nnoremap <silent> <S-Left> :bp<CR>|              " previous buffer
map <leader>d "_d|                               " delete selected text


" Custom Commands
cnoreabbrev w!! w !sudo tee > /dev/null %|       " write file with sudo


" Netrw settings
let g:netrw_banner=0
let g:netrw_browse_split=1


" Autocomplete Settings
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
