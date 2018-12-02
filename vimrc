" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/YankRing.vim'
Plug 'eparreno/vim-l9'
Plug 'vim-scripts/FuzzyFinder'
" Note: These plugins bellow are obsoleted by 'YouCompleteMe'.
" Plug 'vim-scripts/OmniCppComplete'
" Plug 'vim-scripts/AutoComplPop'
" Plug 'Shougo/neocomplcache.vim'
" Plug 'ervandew/supertab'

"
" Plug 'drmingdrmer/vim-toggle-quickfix'
" Plug 'ronakg/quickr-cscope.vim'
"
Plug 'romainl/vim-qf'
Plug 'vim-scripts/echofunc.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'

" Initialize plugin system
call plug#end()

syntax enable
syntax on
colorscheme desert

" cscope automatically load settings
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    set nocscopeverbose
"    set cscopequickfix=s-,c-,d-,i-,t-,e-

    :set cscopequickfix=s-,c-,d-,i-,t-,e-
    nmap <F6> :cn<cr>
    nmap <F7> :cp<cr>
"    move with :cnext :cprevious, show list with :cw, quit list with :ccl

"    let g:quickr_cscope_use_qf_g = 1
"    let g:loaded_qf_resize = 10

    " http://vim.wikia.com/wiki/Automatically_create_and_update_cscope_database
    nmap <C-@><C-@> :cs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>s yiw:cs find s <c-r>=expand("<cword>")<cr><cr>:bd<cr>:cwindow<cr>/<c-r>0<cr>
    nmap <F8> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
         \:!cscope -b -i cscope.files -f cscope.out<CR>
         \:cs reset<CR>

    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    else
       let cscope_file=findfile("cscope.out", ".;")
       let cscope_pre=matchstr(cscope_file, ".*/")
       if !empty(cscope_file) && filereadable(cscope_file)
           exe "cs add" cscope_file cscope_pre
       endif
     endif
endif
" ctags settings
nmap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags=./tags,tags;$HOME


""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1            "Show tags only for the current file
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
map <silent> <leader>tl :TlistToogle<cr>
map <silent> <F9> :TlistToggle<cr>

" OmniCppComplete, http://www.vim.org/scripts/script.php?script_id=1520
set nocp
filetype plugin on

" SupperTab http://www.vim.org/scripts/script.php?script_id=1643
let g:SuperTabDefaultCompletionType="context"

autocmd StdinReadPre * let s:std_in=1
"when enable this, need to change:
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } -> Plug 'scrooloose/nerdtree'
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif
"autocmd VimEnter * if !argc() | Startify | NERDTreeToggle | wincmd w | endif
"map <C-n> :NERDTreeToggle<CR>
nmap <F3> :NERDTreeToggle<CR>
"nmap <F8> :TagbarToggle<CR>
nnoremap <silent> <F7> :YRShow<CR>
nmap <C-g><C-o> <Plug>window:quickfix:toggle

function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " . expand("<cword>")
endfunction

"https://stackoverflow.com/questions/33600608/how-to-cause-ctags-to-show-tag-definition-on-vertical-split-without-opening-a-ne?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
nnoremap <c-]> :call FollowTag()<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

set nu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

