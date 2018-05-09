" -----------------------------------------------------------------------------|
" --- By Oleg Butuzov  --------------------------------------------------------|
" -----------------------------------------------------------------------------|

set nocompatible
let directory=system('echo $(dirname $(realpath ~/.vimrc))/vim/_F_')
let directory=substitute(directory, '\n', '', 'g')

exe 'set rtp+=,' . substitute(directory, '_F_', '', 'g')

" -- Plugins ------------------------------------------------------------------|
exec 'source '. substitute(directory, '_F_', 'plugins.vim', 'g')

set directory=/tmp

" -- Functions ----------------------------------------------------------------|
exec 'source '. substitute(directory, '_F_', 'functions.vim', 'g')

" -- General ------------------------------------------------------------------|
set t_CO=256                              " 256 Colors for Terminal
set term=xterm-256color                   " 256 Colors for Terminal
let os=GetRunningOS()                     " Operating System Name

" -- Colors -------------------------------------------------------------------|

" -- Editor -------------------------------------------------------------------|
syntax      enable                        " Enables Syntax Highlight
colorscheme onedark

set         number                        " Shows Line Numbers
set         ruler
set         rulerformat=%l,%v             " Ruller

set list
set showbreak=↪\
set listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:·,trail:·

set backspace=indent,eol,start            " Backspace in Insert mode"
set tabstop=4                             "
set softtabstop=0 noexpandtab             "

" -- Splits -------------------------------------------------------------------"

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>

" Switch to Right Split With Ctrl + L
nmap <C-L> <C-W><C-L>

" Switch to Right Split With Ctrl + H
nmap <C-H> <C-W><C-H>

set splitbelow
set splitright

" -- Tabs -------------------------------------------------------------------"
nmap <S-N> :tabprevious<CR>
nmap <S-M> :tabnext<CR>


" --Search --------------------------------------------------------------------|
set hlsearch                              " Search HighLight
