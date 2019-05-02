set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dkarter/bullets.vim'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'plasticboy/vim-markdown'
Plugin 'jpalardy/vim-slime'
Plugin 'lervag/vimtex'
Plugin 'jalvesaq/Nvim-R'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-titlecase'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let R_assign=0
syntax on
set conceallevel=0
let g:pandoc#syntax#conceal#use = 0
let R_user_maps_only=0
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
set inccommand=nosplit
set mouse=a
set termencoding=utf-8 encoding=utf-8

" open config shortcuts
nnoremap ;rc :sp ~/.config/nvim/init.vim<Cr>
nnoremap ;ft :execute 'sp ~/.config/nvim/after/ftplugin/' . &filetype . '.vim'<Cr>
nnoremap ;ab :sp ~/.config/nvim/abbreviations.vim<Cr>

" visuals and line numbers

augroup allgroup
	autocmd! allgroup
	autocmd FileType * let g:lightline = {
				\ 'colorscheme': 'one',
				\ }
	autocmd FileType * set number relativenumber
	autocmd FileType * highlight LineNr cterm=NONE ctermfg=DarkGray guifg=DarkGray ctermbg=NONE guibg=NONE
	autocmd FileType * highlight CursorLineNr cterm=bold ctermfg=11 guifg=11 ctermbg=NONE guibg=NONE
	autocmd FileType * highlight VertSplit ctermbg=NONE guibg=NONE ctermfg=DarkGrey guifg=DarkGrey cterm=NONE
	autocmd FileType * highlight Pmenu ctermfg=DarkGrey ctermbg=237
	autocmd FileType * highlight PmenuSel ctermfg=252 ctermbg=DarkGrey
	autocmd FileType * highlight MatchParen ctermfg=252 ctermbg=239
	autocmd FileType * set foldcolumn=1
	autocmd FileType * highlight FoldColumn ctermbg=NONE guibg=NONE
augroup END

" abbreviations

source ~/.config/nvim/abbreviations.vim

" nerdtree settings

" let NERDTreeShowLineNumbers=0

nnoremap <Tab> :NERDTreeToggle<Cr>

augroup nerdtree
	autocmd! nerdtree
	autocmd FileType nerdtree setlocal nonumber norelativenumber 
	autocmd FileType nerdtree highlight EndOfBuffer ctermfg=235 ctermbg=235
	autocmd FileType nerdtree highlight CursorLine cterm=NONE ctermbg=237
augroup END


" exiting goyo won't reset line number colors

function! s:goyo_leave()
	highlight LineNr cterm=NONE ctermfg=DarkGray guifg=DarkGray ctermbg=NONE guibg=NONE
	highlight CursorLineNr cterm=bold ctermfg=11 guifg=11 ctermbg=NONE guibg=NONE
	highlight FoldColumn ctermbg=NONE guibg=NONE
	highlight VertSplit ctermbg=NONE guibg=NONE
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Disables Automatic Line Numbering
autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" goyo
let g:goyo_height=92
let g:goyo_width=95
map ;w :Goyo \| set linebreak<Cr>

" rebind beginning and end of lines

nnoremap B ^
nnoremap E $

nnoremap $ <nop>
nnoremap ^ <nop>

" rebind for long lines

nnoremap j gj
nnoremap k gk

inoremap ;; <Esc>/<++><Enter>"_c4l
nnoremap ;; /<++><Enter>"_c4l

" paste from last yank

nnoremap yp "0p

" spelling

let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

highlight SpellBad ctermfg=Red guifg=Red ctermbg=NONE guibg=NONE guisp=Red cterm=undercurl
highlight SpellCap ctermfg=LightBlue guifg=LightBlue ctermbg=NONE guibg=NONE guisp=LightBlue cterm=undercurl

"ctrl-l to correct the last spelling mistake

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


