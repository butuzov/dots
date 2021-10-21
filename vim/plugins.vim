filetype off                                 " requiredn


" let Vundle manage Vundle, required
exec 'set rtp+=,' . substitute(directory, '_F_', 'bundle/Vundle.vim', 'g')
call vundle#rc( substitute(directory, '_F_', 'bundle/', 'g') )
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                " Plugin Manager

" -- Plugin : NERD Tree : Files Navigation ------------------------------------|
Plugin 'scrooloose/nerdtree'
nmap <C-\> :NERDTreeToggle<cr>

let NERDTreeIgnore=['.DS_Store']
let NERDTreeHighlightCursorline=0


" -- Plugin : Startofy --------------------------------------------------------|
Plugin 'mhinz/vim-startify'

let g:startify_custom_header = readfile(expand(substitute(directory, '_F_', 'header.txt', 'g')))

"let g:startify_custom_header =
"	\ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

let g:startify_lists = [
    \ { 'type': 'files',     'header': [   'MRU']            },
    \ { 'type': 'dir',       'header': [   'MRU '. getcwd()] },
    \ { 'type': 'bookmarks', 'header': [   'Bookmarks']      },
    \ { 'type': 'commands',  'header': [   'Commands']       },
\ ]

set statusline=%=%P\ %f\ %m
"set fillchars=vert:\ ,stl:\ ,stlnc:\
"set laststatus=2

Plugin 'editorconfig/editorconfig-vim'       " .editorcofig              "
Plugin 'ervandew/supertab'


" -- Theme -------------------------------------------------------------------|
Plugin 'joshdick/onedark.vim'


" -- Development --------------------------------------------------------------|
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'

" -- WebDev -------------------------------------------------------------------|
Plugin 'groenewege/vim-less'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'

" -- Plugin : vim-test --------------------------------------------------------|
Plugin 'janko-m/vim-test'


" -- MarkDown -----------------------------------------------------------------|
Plugin 'tpope/vim-markdown'

" -- Python -------------------------------------------------------------------|
Plugin 'klen/python-mode'

" -- Bash ---------------------------------------------------------------------|
Plugin 'bash-support.vim'

" -- PHP ----------------------------------------------------------------------|
Plugin 'stanangeloff/php.vim'

" -- Go -----------------------------------------------------------------------|
"Plugin 'fatih/vim-go'

" -- Tools / DevOps  ----------------------------------------------------------|
Plugin 'docker/docker'

Plugin 'pearofducks/ansible-vim'
Plugin 'phenomenes/ansible-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

