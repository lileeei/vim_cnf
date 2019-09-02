""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" global setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autowrite
" Set to auto read when a file is changed from outside
set autoread
set nocompatible
"set background=dark
" 解决Vim插入模式下backspace按键无法删除字符的问题
set backspace=indent,eol,start
set number
set cursorline
set hlsearch

" 设置缩进
set cindent
set tabstop=2
set shiftwidth=2

" Open status line at any time
set laststatus=2

" Set utf8 as standard encoding
set encoding=utf8

" set maxmempattern
set maxmempattern=5000

" Use Unix as standard file type
set ffs=unix,dos,mac
set ff=unix

" Enable syntax highlighting
syntax enable


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'morhetz/gruvbox'

Plug 'sheerun/vim-polyglot'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'segeljakt/vim-silicon'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'


" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark    " Setting dark mode
set guioptions=                 "去掉两边的scrollbar


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd vimenter * NERDTree
"map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIgnore=['\.d$[[dir]]', '\.o$[[file]]']
let NERDTreeNodeDelimiter="\u00a0"
"let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
   		\ "Staged"    : "✚",
   		\ "Untracked" : "✭",
   		\ "Renamed"   : "➜",
   		\ "Unmerged"  : "═",
   		\ "Deleted"   : "✖",
   		\ "Dirty"     : "✗",
   		\ "Clean"     : "✔︎",
   		\ "Ignored"   : "☒",
   		\ "Unknown"   : "?"
   		\ }
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree automatically when vim starts up on opening a directory
"autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
nmap <F5> :NERDTreeToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline设置
set laststatus=2
" 使用powerline打过补丁的字体
"let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-lsp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '⚡'} " icons require GUI
let g:lsp_signs_hint = {'text': '🔨'} " icons require GUI

"let g:lsp_highlights_enabled = 0
"let g:lsp_textprop_enabled = 0
highlight link LspErrorText GruvboxRedSign  
highlight clear LspWarningLine
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

" logging
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.vim/vim-lsp.log')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"asyncomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt+=preview
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_test_timeout = '10s'
"let g:go_gocode_unimported_packages = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_textobj_include_function_doc = 1
let g:go_decls_includes = "func,type"
" let g:go_auto_type_info = 1

let mapleader = ","
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"rust
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
let g:rustfmt_autosave = 1
