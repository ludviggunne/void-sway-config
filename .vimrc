set number relativenumber
set nocompatible
set history=500
set ruler
set ignorecase smartcase
set magic
set nobackup nowb noswapfile
set laststatus=2
syntax on

colorscheme slate

" Minimal number of lines above/below cursor
set scrolloff=12

" Default tab settings
set expandtab softtabstop=4 tabstop=4 shiftwidth=4 smarttab

" Recursive search for 'find' etc.
set path+=**

" Show list of matches in command line
set wildmenu wildoptions+=pum wildoptions+=fuzzy wildignore+=*.o,*/.git

" Incremental search
set incsearch

" Don't redraw while executing macros
set lazyredraw

" Fix delay on escape
set ttimeoutlen=5

" Change cursor shape in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Enable transparent background
hi Normal guibg=NONE ctermbg=NONE

" Netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

" Automatically trim trailing whitespace
fun! TrimWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" Detect file changes outside of Vim
set autoread
autocmd FocusGained,Bufenter * silent! checktime

" GCC output format
set errorformat=%f:%l:%c:\ error:\ %m,%-G

" Open help in vertical split
cabbrev h vert bo help

let g:mapleader = ","

nnoremap <leader>f :find<space>

" C-r for replacing occurences of selected text, with prompts
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

" Same but in normal mode. Replaces the word under the cursor
nnoremap <leader>r viw"hy:%s/<C-r>h//gc<left><left><left>
