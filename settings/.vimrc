set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=4
set expandtab "This converts all tabs to spaces
set shiftwidth=4
set number
set mouse=a
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
"This will delete the current line in insert mdoe
:inoremap <c-d> <esc>ddi
:vnoremap <c-u> iwU
:nnoremap <c-u> viwU
:let mapleader = '-'
:let maplocalleader = "\\"
:nnoremap <leader>d dd
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:iabbrev @@ udbhavksingh@gmail.com
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:inoremap jk <esc>
:noremap <up> <nop>
:noremap <down> <nop>
:noremap <left> <nop>
:noremap <right> <nop>
:set statusline=%f\ -\ FileType\ %y
:set statusline+=%=Current:\ %-4l\ Total:\ %-4L
