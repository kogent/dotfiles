set nocompatible               " be iMproved
filetype off                   " required!

if has('python3')
 silent! python3 1
endif

set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#rc()
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'
Plugin 'ajh17/VimCompletesMe'
"Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/csapprox'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'pld-linux/vim-syntax-nagios'
Plugin 'hashivim/vim-vagrant'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vividchalk'
Plugin 'robbles/logstash.vim'

Plugin 'junegunn/vim-easy-align'
Plugin 'matchit.zip'
"Plugin 'SirVer/ultisnips'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

"Dash.app
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required

let g:dash_map = {
  \ 'ruby'        : 'rb',
  \ 'bash'        : 'shell',
  \ 'sh'          : 'shell',
  \ 'javascript'  : 'js',
  \ 'css'         : 'style',
  \ }

filetype plugin indent on  

"Filetype detection
filetype indent on
filetype plugin on

" General options
set incsearch
set ignorecase smartcase 
"set mouse=a
"set ttymouse=xterm2

set encoding=utf-8
" Use two space tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set fileformat=unix

"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
""    \ set textwidth=79
"    \ set autoindent

"au BufRead,BufNewFile * match BadWhitespace /\s\+$/

:cmap <C-f> :%s///<cr>

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"force .netrwhist file to be written to $HOME
let g:netrw_home = $HOME

" Remaps :SW to sudo save the current file and tell vim to reload it 
"if exists("g:kogent") && g:kogent
  command SW execute 'w !sudo tee % >/dev/null' | e! %
"endif

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

nnoremap <F3> :!%:p<CR>

nnoremap <CR> :noh<CR><CR>

let g:syntastic_javascript_checkers = ['jslint']
let g:ycm_autoclose_preview_window_after_completion=1

syntax on
colorscheme vividchalk

set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos
