set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
set statusline+=%#warningmsg#
set statusline+=%*


Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Gundo'
Plugin 'vim-airline/vim-airline'
Plugin 'mbbill/undotree'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
" Enable the list of buffers
"let g:airline#extensions#tabline#fnamemod = ':t'

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
"( see :h vundle for more details or wiki for FAQ
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
:nnoremap <leader>q :TagbarToggle<CR>
:nnoremap <leader>ev :e $cli_tools_dir/.vimrc<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:nnoremap <leader>ez :e $cli_tools_dir/.zshrc<cr>
:nnoremap <leader>el :e $HOME/.local_functions<cr>
:nnoremap <leader>ef :e $cli_tools_dir/functions.sh<cr>
:nnoremap <leader>ea :e $cli_tools_dir/aliases.sh<cr>

:iabbrev @@ udbhavksingh@gmail.com
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:inoremap jk <esc>
:noremap <up> <nop>
:noremap <down> <nop>
:noremap <left> <nop>
:noremap <right> <nop>
:set statusline=%f\ -\ FileType\ %y
:set statusline+=%=Current:\ %-4l\ Total:\ %-4L
:set laststatus=2
":set g:tagbar_ctags_bin
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
:nnoremap <leader>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
:nnoremap <leader>g :GundoToggle<CR>
:nnoremap <leader>b :buffers<CR>
:nnoremap <leader>bn :bnext<CR>
:nnoremap <leader>bp :bprevious<CR>
:nnoremap <leader>tc :tabclose<CR>
:nnoremap <C-Left> :tabprevious<CR>
:nnoremap <C-Right> :tabnext<CR>
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
:nnoremap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
:nnoremap <leader>bb :CtrlPBuffer<cr>
:nnoremap <leader>bm :CtrlPMixed<cr>
:nnoremap <leader>bs :CtrlPMRU<cr>
highlight ColorColumn ctermbg=blue
set colorcolumn=81
set list
set listchars=tab:>>,nbsp:_,trail:.
:nnoremap <leader>w :silent !xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR><CR>
set hlsearch
cnoremap <C-x> <C-\>e(<SID>RemoveLastPathComponent())<CR>
function! s:RemoveLastPathComponent()
      return substitute(getcmdline(), '\%(\\ \|[\\/]\@!\f\)\+[\\/]\=$\|.$', '', '')
endfunction
:nnoremap <C-N><C-N> :set invnumber<CR>
:nnoremap <C-nnoremapP> :PluginInstall<CR>:q<CR>
:nnoremap <C-u> :UndotreeToggle<CR>
:noremap <C-s> :w<CR>
:noremap <C-l> o<esc>

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'

" CtrlP Settings

  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_show_hidden = 1

" This allows the user to use :R followed by a command and get the output in a
" scratch buffer
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

