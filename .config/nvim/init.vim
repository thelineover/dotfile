""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
let mapleader=","
noremap <leader>r :so ~/.config/nvim/init.vim<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/')
" Colorscheme Plugs
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00'  }
Plug 'sainnhe/sonokai'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'
Plug 'tomasr/molokai'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'arzg/vim-colors-xcode'
Plug 'kristijanhusak/vim-hybrid-material'

""" Plugin configuration
" Pretty dev-icons
Plug 'ryanoasis/vim-devicons'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod =':t'
" EasyAlign
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
xmap <leader>a gaip*
nmap <leader>a gaip*

" Tagbar
Plug 'majutsushi/tagbar'
nmap <silent><leader>w :TagbarToggle<cr>
let g:tagbar_width = 35
let g:tagbar_iconchars = ['↠', '↡']

" Nerdtree
Plug 'scrooloose/nerdtree'
nmap \ <leader>q
map  <silent><leader>q :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '🔰'

" Nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
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
" Autopair close
Plug 'jiangmiao/auto-pairs'

" IndentGuide-style
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
map  <leader>fzf :Files<cr>

Plug 'machakann/vim-highlightedyank'

" Clean Whitespace
Plug 'ntpeters/vim-better-whitespace'
nnoremap <leader>cl :StripWhitespace<cr>

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
noremap <F3> :UndotreeToggle<cr>

" Useful python
Plug 'metakirby5/codi.vim'
noremap <leader>codi :Codi!!<cr>

" Expand Visual-block
Plug 'terryma/vim-expand-region'
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

Plug 'blueyed/vim-diminactive'
let g:diminactive_enable_focus = 1

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Color Scheme
colorscheme xcodedark
let g:airline_theme = "fruit_punch"
"
syntax on
set noshowmode
set cmdheight=2
set list listchars=trail:»,tab:»-,eol:¬
set pastetoggle=<F2>

" indent for global
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

" Automatic indentation is good
set autoindent
set smartindent

" Searching
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set ignorecase
set smartcase

" Column limits
set textwidth=110
set colorcolumn=110
" Toggle between column widths
let g:wide_column = 1
noremap <leader>c :call ToggleColumnWidth()<cr>
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

" Git Gutter always shows
set signcolumn=yes
set updatetime=100

set number relativenumber
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

" Last modifed cursor position
au BufReadPost *
  \ if line("'\"") > -1 && line("'\"") <= line("$") |
  \ exe "norm g`\"" |
  \ endif

" Filetype
filetype plugin indent on
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Custom keydding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors option
nmap <leader>ee :Colors<cr>
nmap <leader>ea :AirlineTheme

" Split windows
nmap <leader>s- :split
nmap <leader>s\ :vsplit

" Git status
noremap <leader>gst :Gstatus<cr>
noremap <leader>git :Git

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

" Format JSON
noremap <leader>js :%!python -m json.tool<cr>

" Some mistake keys
map Q gq
cmap Wq wq
cmap W w
cmap Q q
