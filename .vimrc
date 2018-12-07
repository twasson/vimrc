set number
set nocompatible      " We're running Vim, not Vi!
set incsearch
set smartcase
set hlsearch  " highlight search items
set noswapfile
set tags=./tags;,./gems.tags;,./.git/tags;
set autoindent expandtab smartindent smarttab tabstop=2 softtabstop=2 shiftwidth=2
set diffopt+=vertical
set showcmd
"auto reload file changes from disk
set autoread
set termguicolors     " enable true colors support
set guioptions+=e
"set autochdir "change to the current file's directory.

"stop vim from adding EOL to bottom of file if missing workaround
":set binary
":set noeol
set switchbuf+=newtab

runtime macros/matchit.vim

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
filetype plugin indent on    " required

autocmd FileType ruby compiler ruby

"copy file path to clipboard
:command! COP let @+ = expand('%:p')


let g:ctrlp_working_path_mode = 0
let g:airline#extensions#tabline#enabled = 1
let NERDTreeQuitOnOpen = 0
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:auto_save = 1
let g:auto_save_silent = 1
let NERDTreeShowHidden = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
"let g:vim_tags_auto_generate = 1
cnoreabbrev
colorscheme industry
"colorscheme ayu

"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"
"changes ctrlp default open to tab 
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
au BufEnter *.rb syn match error contained "\<binding.pry\>"

"open nerdtree by default
"autocmd vimenter * NERDTree

map <C-n> :NERDTreeToggle<CR>
map <C-x> :g/binding\.pry/d<CR>
nmap <leader>f :NERDTreeFind<CR>

"shortcut to copy current file path to clipboard ctrl-shift-c
map <C-C> :COP<CR>
"map <C-K> :%bd\|e<CR>


"alt-w for mac

"map <C-m> <MiddleMouse>
:nnoremap <F4> :Ack!<CR>
:nnoremap <F3> :source $MYVIMRC<CR>
:nnoremap <F2> :edit $MYVIMRC<CR>
:nnoremap <leader>ct :silent ! ctags -R --languages=ruby --exclude=.git --exclude=log -f tags<cr>
:nnoremap <leader>cc :CodeClimateAnalyzeCurrentFile<cr>

" remap tabbing to shift tab
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>
"causes conflict
"inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

"do not open first file from search results
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

cd ~/gitrepo/introhive

" opens search results in a window w/ links and highlight the matches
command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude *.{json,pyc} . -e <args>' | copen | execute 'silent /<args>'
" shift-control-* Greps for the word under the cursor

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'astashov/vim-ruby-debugger'
Plugin 'dyng/ctrlsf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-endwise' "Added end after def, if, do etc.
Plugin 'szw/vim-tags'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" fuzzy file search
Plugin 'ctrlpvim/ctrlp.vim'
" file explorer (ctrl-n to open)Plugin
Plugin 'scrooloose/nerdtree'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Vim Ruby

" Debug ruby
Plugin 'joonty/vdebug'

"auto save files
Plugin 'vim-scripts/vim-auto-save'
Plugin 'ayu-theme/ayu-vim'


Plugin 'ecomba/vim-ruby-refactoring'

"highlight word under cursor and all references
"Plugin 'lygaret/autohighlight.vim'

"highlight word under cursor
Plugin 'pboettch/vim-highlight-cursor-words'

"Auto save/load vim sessions based on directory and git branch.
Plugin 'wting/gitsessions.vim'

Plugin 'Shougo/unite.vim'

Plugin 'tpope/vim-rbenv'
Plugin 'tpope/gem-ctags'
Plugin 'vim-scripts/ruby-matchit'

"allow you to use :TestNearest to test on cusor
Plugin 'janko-m/vim-test'

"http://peterodding.com/code/vim/notes/
Plugin 'xolox/vim-notes'
Plugin 'vim-misc'

"different ctrlp searching algorithm
Plugin 'JazzCore/ctrlp-cmatcher'

":CodeClimateAnalyzeProject
":CodeClimateAnalyzeOpenFiles
":CodeClimateAnalyzeCurrentFile
Plugin 'wfleming/vim-codeclimate'

Bundle 'vim-ruby/vim-ruby'
" Surround your code :)
Bundle 'tpope/vim-surround'
" Tab completions
Bundle 'ervandew/supertab'
" All of your Plugins must be added before the following line
"
call vundle#end()            " required


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
" Put your non-Plugin stuff after this linelygaret/autohighlight.vim'
