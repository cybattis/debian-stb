set nocompatible
filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'vim-syntastic/syntastic'
Plugin 'mg979/vim-visual-multi'
Plugin 'preservim/nerdtree' |
	\ Plugin 'Xuyuanp/nerdtree-git-plugin' |
	\ Plugin 'ryanoasis/vim-devicons'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'preservim/tagbar'
" Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
 " Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
" Visual
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'alpertuna/vim-header'
" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

let g:mapleader = ','
map <F8> :w <CR> :!gcc -Wall -Wextra -Werror % -o %< && ./%< <CR>
map <F7> :w <CR> :make <CR>

" Color config
syntax on
autocmd vimenter * ++nested colorscheme gruvbox

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set number
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set cursorline
set encoding=UTF-8
set mouse=a
set laststatus=2
set colorcolumn=81
set hidden

" syntastic config

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" YouCompleteMe

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" NERDTree

map <F5> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeGitStatusConcealBrackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

" customize Icon NERDTree

let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconswDefaultFolderOpenSymbol = 'ﱮ'

" airline

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Tagbar

nmap <F10> :TagbarToggle<CR>

" CtrlP

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 'ra'

" Header

map <F9> :AddHeader<CR>
let g:header_auto_add_header = 0
let g:header_field_author = 'stb47'
let g:header_field_author_email = 'cyrilbattistolo@gmail.com'

" Vim terminal

nnoremap <F2> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <Esc> <C-\><C-n><C-w><C-w>
tnoremap :q! <C-\><C-n>:q!<CR>
tnoremap <F3> <Esc><C-\><C-n>:q<CR>

" Terminal Function

let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" snippets

let g:UltiSnipsExpandTrigger="<leader>s"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" auto-pair
