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
Plug 'Xuyuanp/nerdtree-git-plugin'

if has('nvim') && has('python3')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
elseif has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  let g:deoplete#enable_at_startup = 1
endif

if has('nvim')
	Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'pdavydov108/vim-lsp-cquery'
	if executable('cquery')
		au User lsp_setup call lsp#register_server({
					\ 'name': 'cquery',
					\ 'cmd': {server_info->['cquery']},
					\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
					\ 'initialization_options': { 'cacheDirectory': '/var/cquery/' },
					\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
					\ })
	endif
endif


Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'            " git wrapper
Plug 'editorconfig/editorconfig-vim' " enforce editor configs
Plug 'itchyny/lightline.vim'         " status line
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme' : '16color',
      \ }


Plug 'ervandew/supertab'             " tab do all the things

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabContextDefaultCompletionType = "<c-k>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabLongestEnhanced = 1

Plug 'ludovicchabant/vim-gutentags'
"set statusline+=%{gutentags#statusline()}

" YAML syntax
Plug 'stephpy/vim-yaml'

" Ansible syntax 
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }


" Fuzzy file, buffer, mru, tag, etc finder
" ctrlp.vim
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''

" better grepping ( source code aware )
Plug 'mileszs/ack.vim'
" use ag instead of default
let g:ackprg = 'ag --nogroup --nocolor --column'

" Markdown support
" https://github.com/plasticboy/vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" TagBar
Plug 'majutsushi/tagbar'

" TMUX integration
Plug 'benmills/vimux'
" ------------------------------
call plug#end()
" ==============================

" Basic
set nocompatible
set autoread				" relead on external file changes
set backspace=indent,eol,start		" backspace behavior
set clipboard=unnamed,unnamedplus	" enable clipboard
set encoding=utf-8                      " enable utf-8 support
set hidden				" hide buffers, don't close
set number				" show line numbers
"set term=xterm-256color                 " terminal type
set wildmenu wildmode=longest:full,full " wildmenu settings
set wildcharm=<Tab>                     " wildmenu character
set showcmd                             " show command keys
set splitbelow splitright
"set autochdir                          " switch to files local directory


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

hi LightlineLeft_normal_0 ctermfg=black|
hi LightlineLeft_normal_1 ctermfg=black|
hi LightlineLeft_normal_2 ctermfg=black|

hi LightlineLeft_command_0 ctermfg=black|

hi LightlineMiddle_normal ctermfg=black ctermbg=8|
hi LightlineMiddle_insert ctermfg=black ctermbg=8|
hi LightlineMiddle_command ctermfg=black ctermbg=8|

hi LightlineRight_normal_0 ctermfg=black ctermbg=11|
hi LightlineRight_normal_1 ctermfg=black ctermbg=11|
hi LightlineRight_normal_2 ctermfg=black ctermbg=11|
hi LightlineRight_normal_3 ctermfg=black ctermbg=11|

hi LightlineRight_visual_0 ctermfg=black ctermbg=11|
hi LightlineRight_visual_1 ctermfg=black ctermbg=11|
hi LightlineRight_visual_2 ctermfg=black ctermbg=11|
hi LightlineRight_visual_3 ctermfg=black ctermbg=11|

hi LightlineRight_insert_0 ctermfg=black ctermbg=11|
hi LightlineRight_insert_1 ctermfg=black ctermbg=11|
hi LightlineRight_insert_2 ctermfg=black ctermbg=11|
hi LightlineRight_insert_3 ctermfg=black ctermbg=11|

hi LightlineRight_command_0 ctermfg=black ctermbg=11|
hi LightlineRight_command_1 ctermfg=black ctermbg=11|
hi LightlineRight_command_2 ctermfg=black ctermbg=11|
hi LightlineRight_command_3 ctermfg=black ctermbg=11|


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

" Key Bindings
let mapleader=','                                " leader key

" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
"
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

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
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"
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

