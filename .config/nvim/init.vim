""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
Plug 'junegunn/vim-emoji'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'arzg/vim-colors-xcode'
Plug 'kristijanhusak/vim-hybrid-material'

" Functional plugins
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/Colorizer'
Plug 'machakann/vim-highlightedyank'
Plug 'romainl/vim-cool'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'yuttie/comfortable-motion.vim'
Plug 'PeterRincker/vim-searchlight'
Plug 'mbbill/undotree'
Plug 'metakirby5/codi.vim'
Plug 'ervandew/supertab'
Plug 'terryma/vim-expand-region'
Plug 'blueyed/vim-diminactive'
Plug 'jeetsukumaran/vim-buffergator'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax
Plug 'elzr/vim-json'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set hidden
set title
set showcmd showmode
set list listchars=trail:»,tab:»-,eol:¬
set fillchars+=vert:\
set wrap breakindent
set ruler

set nobackup
set nowritebackup

" PasteToggle
set pastetoggle=<F2>

" Tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" Automatic indentation is good
set autoindent
set smartindent

" read/write file when switching buffers
set autowrite
set autoread

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

" Column limits
set textwidth=110
set colorcolumn=110

" Toggle between column widths
let g:wide_column = 1
function! ToggleColumnWidth()
    if g:wide_column
        set textwidth=80
        set colorcolumn=80
        highlight colorcolumn ctermbg=lightcyan guibg=lightblue
        let g:wide_column = 0
    else
        set textwidth=110
        set colorcolumn=110
        highlight colorcolumn ctermbg=lightgrey guibg=lightgrey
        let g:wide_column = 1
    endif
endfunction

" See help
set formatoptions=qrnj1

" Hightlight cursor line
set cursorline

" Accelerated scrolling
set scrolljump=-20

" Git Gutter always shows
set signcolumn=yes
set updatetime=300

" Undo function after reopening
set undofile
set undodir=/tmp

set number relativenumber
autocmd InsertEnter,InsertLeave * set cul!
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

" Last modifed cursor position
au BufReadPost *
  \ if line("'\"") > -1 && line("'\"") <= line("$") |
  \ exe "norm g`\"" |
  \ endif


" Toggle quickfix window
nnoremap <leader><leader> :call ToggleQuickfix()<cr>
function! ToggleQuickfix()
  for buffer in tabpagebuflist()
    if bufname(buffer) == ''
      " then it should be the quickfix window
      cclose
      return
    endif
  endfor

  copen
endfunction

" Filetype
filetype plugin indent on
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd Filetype c,cpp setlocal expandtab tabstop=2 shiftwidth=2 cindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf','autopep8']
\}
let g:python_highlight_all = 1
let g:ale_completion_enabled = 1

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

" Background color focus
let g:diminactive_enable_focus = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod =':t'

" Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" NERDTree
let NERDTreeShowHidden=1
let NerdTreeShowLineNumbers=0
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '🔰'

" Close vim if the last window open is NerdTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NerdTree git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "🚧",
    \ "Staged"    : "📋",
    \ "Untracked" : "🔎",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "💫",
    \ "Deleted"   : "❌",
    \ "Dirty"     : "✗",
    \ "Clean"     : "🍀",
    \ 'Ignored'   : '💢',
    \ "Unknown"   : "❓"
    \ }

" Git-gutter
let g:gitgutter_sign_added = emoji#for('heavy_plus_sign')
let g:gitgutter_sign_modified = emoji#for('hammer')
let g:gitgutter_sign_removed = emoji#for('heavy_minus_sign')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

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

" Comfort scroll
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" Buffergator
let g:buffergator_viewport_split_policy="T"
let g:buffergator_hsplit_size=10

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Color Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme xcodedark
let g:airline_theme = "alduin"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Custom keydding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap \ <leader>q
map  <silent><leader>q :NERDTreeToggle<cr>
nmap <silent><leader>w :TagbarToggle<cr>
nmap <leader>zz :Goyo<cr>
map  <leader>fzf :Files<cr>

" Colors option
nmap <leader>ee :Colors<cr>
nmap <leader>ea :AirlineTheme

" Easy-align
xmap <leader>a gaip*
nmap <leader>a gaip*

" Split windows
nmap <leader>s- :split
nmap <leader>s\ :vsplit

" trailing whitespace
nnoremap <leader>cl :StripWhitespace<cr>

" reload init.vim
nmap <leader>r :so ~/.config/nvim/init.vim<cr>

" Git status
noremap <leader>gst :Gstatus<cr>
noremap <leader>git :Git

" Toggle ColumnWidth
" nnoremap <leader>c :call ToggleColumnWidth()<cr>

" Resizing windows
noremap <leader>= :exe "resize +3"<cr>
noremap <leader>- :exe "resize -3"<cr>
noremap <leader>1 :exe "vertical resize -8"<cr>
noremap <leader>2 :exe "vertical resize +8"<cr>

" Use arrow keys to switch tabs
noremap <leader>bq :bp <BAR> bd #<cr>
noremap <leader><Left> :tabprevious <cr>
noremap <leader><Right> :tabnext     <cr>
noremap <Left> :bprevious<cr>
noremap <Right> :bnext<cr>
noremap <leader>to :tabnew

" Sort lines in alphabetical order
vnoremap <leader>s :'<,'>!sort -f<cr>

" For python codi
noremap <leader>codi :Codi!!<cr>

" Format JSON
noremap <leader>js :%!python -m json.tool<cr>

" UndoTree history undo
noremap <F3> :UndotreeToggle<cr>

" expand region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" BufferGator
nmap ,g :BuffergatorToggle<cr>

" Some mistake keys
map Q gq
cmap Wq wq
cmap W w
cmap Q q
