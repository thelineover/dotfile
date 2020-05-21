""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
let mapleader = " "
noremap <leader>r :so ~/.config/nvim/init.vim <cr>
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
Plug 'morhetz/gruvbox'

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

Plug 'easymotion/vim-easymotion'

" Limelight && Goyo
Plug 'junegunn/goyo.vim'
nmap <leader>go :Goyo<cr>

Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Tagbar
Plug 'majutsushi/tagbar'
nmap <silent><leader>? :TagbarToggle<cr>
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
let g:indent_guides_start_level = 1
let g:indent_guides_color_change_percent = 3
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
Plug 'vifm/vifm'
Plug 'machakann/vim-highlightedyank'

" Clean Whitespace
Plug 'ntpeters/vim-better-whitespace'
nnoremap <leader>cl :StripWhitespace<cr>

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
nmap <leader>gs :G<cr>

Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
noremap <F3> :UndotreeToggle<cr>
set undodir=~/.config/nvim/undodir
set undofile

" Useful pythou
Plug 'metakirby5/codi.vim'
noremap <leader>run :Codi!!<cr>

" Expand Visual-block
Plug 'terryma/vim-expand-region'
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

Plug 'blueyed/vim-diminactive'
let g:diminactive_enable_focus = 1

"==================================================================================================="
" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
noremap <leader>int :CocCommand python.setInterpreter<cr>
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Git Gutter always shows
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
    " Use `complete_info` if your (Neo)Vim version supports it.
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"==================================================================================================="

" LSP https://github.com/mattn/vim-lsp-settings
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Better syntax
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'pechorin/any-jump.vim'
Plug 'frazrepo/vim-rainbow'
let g:rainbow_active = 1

Plug 'gabrielelana/vim-markdown'
Plug 'shime/vim-livedown'
nmap <leader>md :LivedownToggle<cr>

" Wakatime
Plug 'wakatime/vim-wakatime'

" Autopep8
Plug 'tell-k/vim-autopep8'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Color Scheme
" colorscheme xcodedark
colorscheme gruvbox
set background=dark
set cursorline
let g:airline_theme = "base16_gruvbox_dark_hard"

syntax on
set noshowmode
set list listchars=trail:»,tab:»-,eol:¬
set pastetoggle=<F2>

" indent for global
set expandtab
set shiftwidth=4
set softtabstop=4

" Automatic indentation is good
set autoindent
set smartindent

" Searching
set hlsearch
nnoremap <silent><Space> :nohlsearch<Bar>:echo<CR>
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
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Custom keydding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors option
nmap <leader>ee :Colors <cr>
nmap <leader>ea :AirlineTheme
nmap <leader>rc :tabnew ~/.config/nvim/init.vim <cr>

" Move Cursor to previous position
nmap <leader><leader>o <c-o>


" Split windows
nmap <leader>sp :split
nmap <leader>vsp :vsplit

" Git status
noremap <leader>gst :Gstatus <cr>
noremap <leader>git :Git

" Resizing windows
noremap <leader>= :exe "resize +3" <cr>
noremap <leader>- :exe "resize -3" <cr>
noremap <leader>1 :exe "vertical resize -8" <cr>
noremap <leader>2 :exe "vertical resize +8" <cr>

" Use arrow keys to switch tabs
noremap <leader>bq :bp <BAR> bd#<cr>
noremap <leader><Left> :tabprevious<cr>
noremap <leader><Right> :tabnext<cr>
noremap <Left> :bprevious <cr>
noremap <Right> :bnext <cr>
noremap <leader>to :tabnew

" Format JSON
noremap <leader>js :%!python -m json.tool<cr>

" Some mistake keys
map Q gq
cmap Wq wq
cmap W w
cmap Q q

" Some useful keys
nmap <c-s> :update<cr>
vmap <c-s> <c-c> :update<cr>
imap <c-s> <c-o> :update<cr>

highlight LineNr ctermfg=DarkCyan
