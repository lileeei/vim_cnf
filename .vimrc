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

Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Plug 'valloric/youcompleteme'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark    " Setting dark mode
set guioptions=                 "去掉两边的scrollbar

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5

" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ycm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_python_binary_path = '/usr/bin/python3'
"let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1  " 补全后自动关闭preview
"let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
"let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
"let g:syntastic_ignore_files=[".*\.py$"]
"let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
"let g:ycm_complete_in_comments = 1
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
"let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
""let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
"nnoremap <F5> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline设置
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
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
let g:syntastic_rust_checkers = ['cargo']
let g:racer_cmd = "racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
"nnoremap <buffer> <silent> gd :<Plug>(rust-def)<cr>

autocmd FileType rust nmap gd <Plug>(rust-def)
autocmd FileType rust nmap gs <Plug>(rust-def-split)
autocmd FileType rust nmap gx <Plug>(rust-def-vertical)
