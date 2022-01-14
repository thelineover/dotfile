""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
noremap <leader>r :so ~/.config/nvim/init.vim <cr>
noremap <leader>rc :tabnew ~/.config/nvim/init.vim <cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/')

" Colorscheme Plugs
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'danilo-augusto/vim-afterglow'
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00'  }
Plug 'sainnhe/sonokai'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'
Plug 'tomasr/molokai'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'arzg/vim-colors-xcode'
Plug 'kristijanhusak/vim-hybrid-material'

" Pretty dev-icons
Plug 'ryanoasis/vim-devicons'

Plug 'tmux-plugins/vim-tmux'

Plug 'MattesGroeger/vim-bookmarks'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_chalk'

" Comfortable motion
Plug 'yuttie/comfortable-motion.vim'
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" Tagbar
Plug 'majutsushi/tagbar'
nmap ? :TagbarToggle<cr>
let g:tagbar_autofocus = 1
" For mac-mini
let g:tagbar_ctags_bin='/opt/homebrew/Cellar/ctags/5.8_2/bin/ctags'

" Nerdtree
Plug 'scrooloose/nerdtree'
nnoremap <silent> \ :NERDTreeToggle<cr>
nnoremap <silent> <leader>\ :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=0
let g:NERDTreeDirArrowCollapsible = '🔰'
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/


" Autopair close
Plug 'jiangmiao/auto-pairs'

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '▏'


" Clean Whitespace
Plug 'ntpeters/vim-better-whitespace'
nnoremap <leader>cl :StripWhitespace<cr>

" Expand Visual-block
Plug 'terryma/vim-expand-region'
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'   }
Plug 'junegunn/fzf.vim'
noremap <leader>f :FZF<cr>

" tpope
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'justinmk/vim-sneak'
" undotree
Plug 'mbbill/undotree'
noremap <F3> :UndotreeToggle<cr>
set undodir=~/.config/nvim/undodir
set undofile

Plug 'frazrepo/vim-rainbow'
let g:rainbow_active=1

" Plug 'blueyed/vim-diminactive'
" let g:diminactive_enable_focus = 1

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" EASY Motion
Plug 'easymotion/vim-easymotion'
Plug 'pechorin/any-jump.vim'

Plug 'tveskag/nvim-blame-line'
" Ctrlp
Plug 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Floating terminal
Plug 'voldikss/vim-floaterm'
noremap <leader>ter :FloatermNew<cr>

" Terminal
Plug 'vimlab/split-term.vim'
set splitbelow
noremap <leader><c-t> :10Term<cr>

" Python-mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop'  }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pboettch/vim-cmake-syntax'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'wsdjeg/vim-todo'
Plug 'sakshamgupta05/vim-todo-highlight'
call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
"" Syntax on
nmap <silent><F7> :if exists("g:syntax_on") <Bar>
            \   syntax off <Bar>
            \ else <Bar>
            \   syntax enable <Bar>
            \ endif <CR>

let no_buffers_menu=1
colorscheme gruvbox

" Better command line completion
set wildmenu

" mouse support
set mouse=a
set mousemodel=popup
set t_Co=256

set guioptions=egmrti
set gfn=Monospace\ 10
set termguicolors

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif

endif
if &term =~ '256color'
  set t_ut=
endif

set scrolloff=3

"" Status bar
set laststatus=2

set mouse=a
set t_Co=256

" use OS clipboard
set clipboard=unnamed
if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

set cursorline
set noshowmode
set list listchars=trail:»,tab:»-,eol:¬

" Indent for global
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

set fileformats=unix,dos,mac

" Automatic indentation is good
set autoindent
set smartindent

" Searching
set hlsearch
nnoremap <silent><Space> :nohlsearch<Bar>:echo<CR>
set ignorecase
set smartcase

" Column limits
set colorcolumn=110
set textwidth=110
" Toggle between column widths
let g:wide_column = 1
noremap <leader>c :call ToggleColumnWidth()<cr>
function! ToggleColumnWidth()
    if g:wide_column
        set textwidth=80
        set colorcolumn=80
        highlight colorcolumn ctermbg=DarkGray guibg=DarkMagenta
        let g:wide_column = 0
    else
        set textwidth=110
        set colorcolumn=110
        highlight colorcolumn ctermbg=DarkGray guibg=DarkGray
        let g:wide_column = 1
    endif
endfunction

" Relative line number
set number relativenumber
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Navigate completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set python interpreter
noremap <leader>int :CocCommand python.setInterpreter<cr>

" coc-yank
nnoremap <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <leader>ycl :CocCommand yank.clean<cr>
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> /gd :call CocAction('jumpDefinition', 'split')<cr>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap rn <Plug>(coc-rename)

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split windows
noremap <leader>sp :split<cr>
noremap <leader>vsp :vsplit<cr>

" Resizing windows
noremap <leader>= :exe "resize +3" <cr>
noremap <leader>- :exe "resize -3" <cr>
noremap <leader>1 :exe "vertical resize -8" <cr>
noremap <leader>2 :exe "vertical resize +8" <cr>

" Use arrow keys to switch tabs
noremap <leader><leader><esc> :bp <BAR> bd#<cr>
noremap tc :tabclose <cr>
noremap <leader><Tab> :tabnext<cr>
noremap <leader><S-Tab> :tabprevious<cr>
noremap <leader>to :tabnew

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Move windows
nmap <S-h> <C-w>h
nmap <S-j> <C-w>j
nmap <S-k> <C-w>k
nmap <S-l> <C-w>l

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Some useful keys
nmap <c-s> :update<cr>
vmap <c-s> <c-c> :update<cr>
imap <c-s> <c-o> :update<cr>

noremap <esc><esc><esc> :q!<cr>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

" go
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END
"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
let g:airline_theme='base16_chalk'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
