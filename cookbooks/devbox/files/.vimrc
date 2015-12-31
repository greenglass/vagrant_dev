set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-bundler'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

set rtp+=/usr/share/vim/site

set number
syntax enable
set background=dark
let g:solarized_termcolors=256
" colorscheme solarized
colorscheme elflord

set noswapfile

set ruler
set cmdheight=2
set ignorecase
set smartcase
set showmatch
set mat=2

set noerrorbells
set novisualbell

set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set laststatus=2

"NERDTree Config
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$']

"Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_ruby_checkers = ['rubocop']

"vim-json config
let g:vim_json_syntax_conceal = 0

"IndenGuide Configuration
let g:indent_guides_guide_size=1

autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufWritePre *.java :normal gg=G
autocmd BufWritePre *.rb :normal gg=G
