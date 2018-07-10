set rtp+=~/.vim/bundle/Vundle.vim
set laststatus=2
set nonumber
set encoding=utf-8
imap jj <Esc>

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/landscape.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'danro/rename.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'junegunn/limelight.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'c9s/helper.vim'
Plugin 'c9s/treemenu.vim'
Plugin 'c9s/vikube.vim'
Plugin 'tpope/vim-fugitive'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

call vundle#end()

let mapleader=","

map ; :Buffers<CR>
map , :Files<CR>
map <Leader>r :Tags<CR>
map <C-o> :NERDTreeToggle<CR>
" map  <C-l> :tabn<CR>
map  <C-l> :Lines<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
nmap <Leader>l <Plug>(Limelight)

" Empty line without insert mode. Enter or Shift+Enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

set nonu

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:ackprg = 'ag --nogroup --nocolor --column'

" Limelight config
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

let NERDTreeShowHidden=1

autocmd FileType yaml setlocal commentstring=#\ %s

let g:NERDSpaceDelims = 1

" lightline 
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
