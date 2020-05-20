set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/autoload')

" Go plugin for vim development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'tomtom/tcomment_vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-python/python-syntax'

call plug#end()            " required

set encoding=UTF-8
" basic setup

" We don't want vi
" set nocompatible

" enables sytax and plugins
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
syntax enable
filetype plugin on

" finding files
" This recursivly looks for files
" Tab completion for file look
set path+=**

" Some Examples for snippits
" nnoremap ,main :-1read $HOME/.vim/.skeleton.javamain<CR>f{o:
" nnoremap ,class :-1read $HOME/.vim/.skeleton.javaclass<CR>3jf{o


" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" hit tab :find by partial match 
" Hit * to make it fuzzy

" THINGS TO CONSIDER:
" -:b lets you autocomplete any open buffer

" TAG JUMPING:

" Create the tags file Install ctags with brew
command! MakeTags !ctags -R

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


colorscheme brogrammer
let g:airline_theme='molokai'
let g:python_highlight_all = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Creating leader for custom remaps
let mapleader = ","

nnoremap <Leader>jc :-1read $HOME/.vim/snippits/.skeleton.javaclass<CR>
nnoremap <Leader>jm :-1read $HOME/.vim/snippits/.skeleton.javamain<CR>
nnoremap <Leader>go :-1read $HOME/.vim/snippits/.skeleton.go<CR>8jo

