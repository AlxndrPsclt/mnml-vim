"execute pathogen#infect()
set nocompatible

"Vundle Setup
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'

"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'Raimondi/delimitMate'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'honza/vim-snippets'
"Plugin 'hynek/vim-python-pep8-indent'
"Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kshenoy/vim-signature'
"Plugin 'scrooloose/nerdtree'
Plugin 'simnalamburt/vim-mundo'
Plugin 'mbbill/undotree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-endwise'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
"Plugin 'vim-scripts/mru.vim'
Plugin 'SirVer/ultisnips'
Plugin 'kien/ctrlp.vim'
Plugin 'DavidEGx/ctrlp-smarttabs'
"Plugin 'luochen1990/rainbow'
"Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
" Plugin 'rking/ag.vim'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-session'
"Plugin 'EvanDotPro/nerdtree-chmod'
Plugin 'djoshea/vim-autoread'
"Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux-focus-events'
"Some markdown glitter
"Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'nelstrom/vim-markdown-folding'
"Elixir plugin
"Plugin 'elixir-lang/vim-elixir'
Plugin 'junegunn/vim-easy-align'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'jistr/vim-nerdtree-tabs'    Testing deactivating this plugin; if
"everything is ok, remove it, else put it back
Plugin 'easymotion/vim-easymotion'
"Plugin 'haoyu953/pride.vim'
Plugin 'arcticicestudio/nord-vim'
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'supercollider/scvim'
"Plugin 'dart-lang/dart-vim-plugin'
Plugin 'AlxndrPsclt/vim-airline-themes'
Plugin 'junegunn/fzf.vim.git'
"Plugin 'ap/vim-css-color.git'


call vundle#end()

set clipboard+=unnamedplus

syntax on

"filetype plugin on
filetype on
filetype indent on
filetype plugin on

"Mettre les fichier swap .swp et .swo dans un dossier spécifique et non dans
"le dossier courant
set backupdir=/tmp
set directory=/tmp

"Utiliser des tabulations de longueur 2
set ts=2 sts=2 sw=2 expandtab

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list!

"Permet d'utiliser 256 couleurs
set t_Co=256

"Utiliser le theme torte
"colorscheme torte
"colorscheme pride
colorscheme nord

let g:airline_theme='base16_nord'

"permet de laisser quelques lignes en bas du texte
set scrolloff=8

"Rajoutte une règle horisontale sur la ligne courante
set cursorline

"Show buffers as vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''


"Rajoutte les numéros de ligne relatifs
set relativenumber

"Always do global line searches (add flag g at the end of a search)
set gdefault

"Set my leader key
let mapleader = " "

"Supprimer les flèches pour utiliser hjkl"
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>

"Racourcis pour mundo
nmap <leader>u :MundoToggle<CR>


"##Working with Splits"
"###Create new splits in a more natural way than vim defaults"
set splitbelow
set splitright

"###Shortcuts to navigate between splits"
nmap <c-k> :wincmd k<CR>
nmap <c-j> :wincmd j<CR>
nmap <c-h> :wincmd h<CR>
nmap <c-l> :wincmd l<CR>

"Resizing windows with + and -
if bufwinnr(1)
  map + <C-W>>
  map - <C-W><
endif


"Permet d'afficher toujours le nom du fichier en bas
set modeline
set ls=2

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=1000 "maximum number lines to save for undo on a buffer reload"



" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"Edit the vimrc with leader v
nmap <leader>v :e $MYVIMRC<CR>

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>se :set spelllang=en<CR>
nmap <silent> <leader>sf :set spelllang=fr<CR>

"Correct the next erroronous with the first suggested correction
nmap <silent> <leader>z h]s1z=
"Skips the next error
nmap <silent> <leader>Z ]sw

hi SpellBad cterm=underline

"Maps leader d to Jump to next digit and leader D to jump to previous digit
nmap <silent> <leader>d /\d<CR>
nmap <silent> <leader>D ?\d<CR>

"Maps leader m to show the list of marks
nmap <silent> <leader>m :marks<CR>


" copy current file name (relative/absolute) to system clipboard
" relative path (src/foo.txt)
nnoremap <leader>cwf :let @"=expand("%")<CR>

" directory name (/something/src)
nnoremap <leader>cwd :let @"=expand("%:p:h")<CR>

" replace selected
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>"



" <Leader>f{char} to move to {char}
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)



function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" tabs to naviagate in ultiSnips instead of c-j, c-k
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-a>"
"let g:UltiSnipsJumpBackwardTrigger="<c-s>"

"Edit snippets in a vertical snip
let g:UltiSnipsEditSplit="vertical"


"A command to allow saving a file using sudo even if you didn't use sudo vim
command W w !sudo tee % > /dev/null


set hlsearch


"  NOT USING CTRLP anymore it seems. Check if it is really depreciaded; and
"  remove if necessary
"  Using FZF vim instead
"Adding ctrlp tabs:
let g:ctrlp_extensions = ['smarttabs']
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<cr>'],
      \ 'AcceptSelection("t")': ['<C-t>'],
      \ }
" nmap O :CtrlP<CR>

nmap O :Files<CR>
nmap <leader>o :CtrlP pwd<CR>


"Adding classic shell aliases to vim bash
"let $BASH_ENV = "~/.config/perso/bash_config/bash_aliases"

"Disable session autosave because it's annoying and rarely usefull"
let g:session_autosave = 'no'


"Paste toggle to allow clean pasting without useless auto indentation
set pastetoggle=,p

let s:hidden_all = 1
set laststatus=0
set noshowcmd
set shortmess=F

" Set scripts to be executable from the shell
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x \"<afile>\"" | endif | endif

" Modifies gf to open file in new tab and create a new file if doesn't exist
" noremap gf :tabe <cfile><CR>

"Commenting blocks of code.
autocmd FileType c,cpp,java,scala,js,ts let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <leader>c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


nmap <leader>l :Lines<CR>
nmap <leader>b :Buffers<CR>

"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)

nmap <leader>a :Ag<CR>
nmap <leader>h :History<CR>

nmap <leader>L :Locate 

nnoremap <Tab> za
nnoremap <S-Tab> zr

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'yml']

set foldmethod=indent
set nofoldenable

vmap <Esc>[1;6A [egv
vmap <Esc>[1;6B ]egv

" Fzf extensions and vim search will ignore these folders
set wildignore+=*/.git/*,*/db/*,*/node_modules/*

" Use arrows to move between buffers
map <Right> :bn<cr>
map <Left> :bp<cr>
map X :bd<cr>

noremap <C-S-Left> <Nop>

nnoremap <M-S-Left> :bmove -1<CR>
nnoremap <M-S-Right> :bmove +1<CR>
