" Pathogen
filetype off " Pathogen needs to run before plugin indent on

execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

let mapleader=","

" set ctags to look up until it finds a tags file
set tags=tags;

" default: 4000 - lowered to 100 for gitgutter plugin
set updatetime=100

" system stuff
set term=screen-256color
set nocompatible
scriptencoding utf-8
set encoding=utf-8

syntax enable               " Turn on syntax highlighting
filetype plugin indent on   " Turn on filetype detection
set background=dark

let g:gruvbox_italic=0
colorscheme gruvbox
" colors desert

" map ctrl-s to save file
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

" map ,wq for quick write
nnoremap <leader>wq <esc>:wq<cr>

" kill whitespace
nnoremap <leader>ws :%s/\s\+$//e<CR>

" quickly enable/disable paste mode
set pastetoggle=<F2>

set nofoldenable                " disable code folding
let g:DisableAutoPHPFolding = 1 " disable PIV's folding

" Status line setup ------------------------------------------------------
set number                  " Show line numbers
set ruler                   " Show cursor position
set wrap                    " Turn on line wrapping

" Backup control ---------------------------------------------------------
set nobackup                " No backup files (use git)
set nowritebackup           " controls how vim does backups
set noswapfile              " Do not use swap files

" Tab and indent controls ------------------------------------------------
set expandtab
set autoindent " always auto indent
set copyindent " copy the previous indention on autoindenting
set showmatch  " set show matching parenthesis
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4


" Terminal stuff
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
" set title                " change the terminal's title
" set visualbell           " don't beep
" set noerrorbells         " don't beep


" Whitespace at end of line controls -------------------------------------
" Highlight trailing whitespace and long lines
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set backspace=indent,eol,start

set uc=0

"Show command in bottom right portion of the screen
set showcmd

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping
set nowrap

"Highlight searching
set hlsearch
nmap <silent> ,/ :nohlsearch<CR>

" case insensitive search
set incsearch						" show search matches as you type
set ignorecase						" ignore case when searching
set smartcase						" match case if capital letter used

"Hide mouse when typing
set mousehide

" More useful command-line completion
set wildmenu

"Map escape key to jj -- much faster
imap jj <esc>

set backupdir=~/tmp

" make j and k go between wrapped lines as well instead of skipping them
nmap j gj
nmap k gk

nmap <leader>nn :set invnumber<CR>

" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h
" map ,cd :cd %:p:h<CR>

iabbrev </ </<C-X><C-O>

" buffers
set hidden
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
" nmap :q :bp <BAR> bd #<CR>

" tabs
nmap <leader>tq :tabclose<CR>

" plugin: crtlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.bak     " MacOSX/Linux
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'
nmap <leader>p :CtrlP<CR>
" Setup some default ignores
let g:ctrlp_custom_ignore = {
\  'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
\  'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\  }
" Easy bindings for its various modes (searh buffer, mixed or buffers by most
" recently used)
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>


" plugin: tabularize common maps
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
nmap <Leader>a{ :Tabularize /{<CR>
vmap <Leader>a{ :Tabularize /{<CR>
nmap <Leader>a' :Tabularize /'<CR>
vmap <Leader>a' :Tabularize /'<CR>
nmap <Leader>a? :Tabularize /?<CR>
vmap <Leader>a? :Tabularize /?<CR>


" plugin syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" plugin: Nerdtree
" command NE NERDTree
" nmap <leader>nt :NERDTreeToggle <CR>
map <Leader>nt <plug>NERDTreeTabsToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeBookmarksSort=0
" quit nerdtree if file closes
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" plugin: T-comment (Faster shortcut for commenting)
map <leader>c <C-_><C-_>

" plugin: airline
let g:airline_powerline_fonts = 1   " Airline - powerline font
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h20
let g:airline#extensions#tabline#enabled = 1    " enable nice airline tabs
let g:airline#extensions#tabline#fnamemod = 1   " show jsut the filename 
let g:airline#extensions#tmuxline#enabled = 1
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"

" plugin: tagbar
nmap <F9> :TagbarToggle<CR>
nmap <leader>tb :TagbarToggle<CR>

" plugin: snipmatesreload snipmates
nnoremap <F7> :call ReloadAllSnippets()

" plugin: gitgutter
nmap <leader>g :GitGutterToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" indentline
nmap <leader>id :IndentLinesToggle<CR>

