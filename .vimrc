set autowrite
set background=dark
set number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Set to auto read when a file is changed from outside
set autoread

" Open status line at any time
set laststatus=2



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" =>Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Enable syntax highlighting
syntax enable

colorscheme monokai

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }


" markdown syntax
Plug 'plasticboy/vim-markdown'




" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }



" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plug 'valloric/youcompleteme'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Theme monokai
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plug 'sickill/vim-monokai'




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Track the engine
Plug 'sirver/ultisnips'
" Snippets are separated from the engine.
Plug 'honza/vim-snippets'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plug 'jistr/vim-nerdtree-tabs'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Plug 'taglist.vim'
" let Tlist_Use_Right_Window = 1 " taglist show right side
" let Tlist_File_Fold_Auto_Close = 1 
" let Tlist_Show_One_File = 1 "only show one file's tag
" let Tlist_Exit_OnlyWindow = 1 " if the last window is taglist, quit vim
" let Tlist_WinWidth = 32 " set tag window size



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Tag bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plug 'ctrlpvim/ctrlp.vim'

" Plug 'Chiel92/vim-autoformat'
" noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat
" let g:autoformat_verbosemode=1
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')  " replaces the current buffer with the alternate file.
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit') " open a new vertical split with the alternate file.
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split') " open the alternate file in a new split view.
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe') " open the alternate file in a new table.



Plug 'fatih/vim-go', { 'tag': '*' }
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', {'do': 'GoInstallBinaries'}



" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1	" enable automatic running of RustFmt when save a buffer 


" Initialize plugin system
call plug#end()
