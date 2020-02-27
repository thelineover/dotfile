""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim-plug (Using https://github.com/junegunn/vim-plug)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/')
" Aesthetics plugins
Plug 'ryanoasis/vim-devicons'
Plug 'ryanoasis/vim-webdevicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'nightsense/forgotten'
Plug 'zaki/zazen'
Plug 'danilo-augusto/vim-afterglow'
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00'  }
Plug 'sainnhe/sonokai'
Plug 'nightsense/nemo'
Plug 'yuttie/hydrangea-vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'
Plug 'tomasr/molokai'

" Functional plugins
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'romainl/vim-cool'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:molokai_original=1
colorscheme molokai

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Tab settings
set shiftwidth=4
set tabstop=3
set softtabstop=4
set expandtab
set smarttab

" Automatic indentation is good
set autoindent
set smartindent

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

" Accelerated scrolling
set scrolljump=-15

" Git Gutter always shows
set signcolumn=yes

" Undo function after reopening
set undofile
set undodir=/tmp

set number relativenumber
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

" Last modifed cursor position
au BufReadPost *
  \ if line("'\"") > -1 && line("'\"") <= line("$") |
  \ exe "norm g`\"" |
  \ endif

" Filetype
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd Filetype c, cpp setlocal expandtab tabstop=2 shiftwidth=2 cindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'
" Close vim if the last window open is NerdTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" TagBar
let g:tagbar_width = 35
let g:tagbar_iconchars = ['↠', '↡']

" Don't be too smart across lines
let g:AutoPairsMultilineClose=0
" Don't insert extra spaces
let g:AutoPairsMapSpace=0

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" IndentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" Ctrl-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Color_Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme=''
    color dracula
    IndentLinesEnable
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorSeoul256()
    let g:airline_theme='silver'
    color seoul256
    IndentLinesDisable
endfunction

" Forgotten Mode (Light)
function! ColorForgotten()
    " Light airline themes: tomorrow, silver, alduin
    " Light colors: forgotten-light, nemo-light
    let g:airline_theme='tomorrow'
    color forgotten-light
    IndentLinesDisable
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Custom keydding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
map <leader>q :NERDTreeToggle<cr>
nmap <leader>\ :NERDTreeToggle<cr>
nmap \ <leader>q
nmap <leader>goyo :Goyo<cr>
nmap <leader>w :TagbarToggle<cr>
nmap <leader>l :Limelight!!<cr>
xmap <leader>l :Limelight!!<cr>
nmap <leader>h :RainbowParentheses!!<cr>
nmap <leader>ee :Colors<cr>
nmap <leader>ea :AirlineTheme
nmap <leader>e0 :call ColorDracula()<cr>
nmap <leader>e2 :call ColorSeoul256()<cr>
nmap <leader>e3 :call ColorForgotten()<cr>
map <leader>fzf :Files<cr>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>w- :split<cr>
nmap <leader>w\ :vsplit<cr>
nmap <leader>t :StripWhitespace<cr>
nmap <leader>r :so ~/.config/nvim/init.vim<cr>
" Don't use Ex mode, use Q for formatting
map Q gq
cmap Wq wq
cmap W w
noremap <leader><space> :nohlsearch<cr>
noremap <F2> :set invpaste paste?<cr>
