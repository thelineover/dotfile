""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
let mapleader=","
noremap <leader>r :so ~/.vimrc<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'machakann/vim-highlightedyank'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = "base16_3024"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod =':t'

Plug 'ntpeters/vim-better-whitespace'
nnoremap <leader>cl :StripWhitespace<cr>

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree'
nmap \ <leader>q
map  <silent><leader>q :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NerdTreeShowLineNumbers=0
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '🔰'

Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

Plug 'terryma/vim-expand-region'
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

Plug 'majutsushi/tagbar'
set tags=./tags,tags;$HOME
nmap <silent><leader>w :TagbarToggle<cr>
let g:tagbar_width = 35
let g:tagbar_iconchars = ['↠', '↡']

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

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VIM Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set noshowmode
set cmdheight=2
set pastetoggle=<F2>
let &t_SI = "\e[6 q"
let &t_EI = "\e[6 q"
" let &t_EI = "\e[2 q"
set list listchars=trail:»,tab:»-,eol:¬

" indent for global
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

" Filetype Tab size
filetype plugin indent on
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 cindent
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent

" Automatic indentation
set autoindent
set smartindent

" Searching
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set ignorecase
set smartcase

" Line number
set number relativenumber
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

" Column limits
set textwidth=110
set colorcolumn=110

" Toggle between column widths
nnoremap <leader>c :call ToggleColumnWidth()<cr>
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""KeyBinding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader><Left> :tabprevious<cr>
noremap <leader><Right> :tabnext<cr>
noremap <Left> :bprevious<cr>
noremap <Right> :bnext<cr>
noremap <leader>to :tabnew

" Resizing windows
noremap <leader>= :exe "resize +3"<cr>
noremap <leader>- :exe "resize -3"<cr>
noremap <leader>1 :exe "vertical resize -8"<cr>
noremap <leader>2 :exe "vertical resize +8"<cr>


" Some mistake keys
map Q gq
cmap Wq wq
cmap W w
cmap Q q
