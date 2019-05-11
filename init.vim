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
Plugin 'lervag/vimtex'
Plugin 'jalvesaq/Nvim-R'
Plugin 'ervandew/supertab'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-titlecase'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/calendar.vim'

"python plugins
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'Shougo/context_filetype.vim'
Plugin 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
Plugin 'davidhalter/jedi-vim'
Plugin 'neomake/neomake'
Plugin 'HiPhish/repl.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" basic setup
syntax on
set mouse=a
set termencoding=utf-8 encoding=utf-8

" completion

let g:SuperTabDefaultCompletionType = "<C-x><C-o>"



" find/replace, case sensitivity
set inccommand=nosplit
set ignorecase
set smartcase
nnoremap ;<Enter> :nohlsearch<Cr>

source ~/.config/nvim/highlight.vim


" conceal
set conceallevel=0
let g:pandoc#syntax#conceal#use = 0

" disable nvim-r things
let R_assign=0
let R_user_maps_only=0

" open config shortcuts
nnoremap ;rc :sp ~/.config/nvim/init.vim<Cr>
nnoremap ;ft :execute 'sp ~/.config/nvim/after/ftplugin/' . &filetype . '.vim'<Cr>
nnoremap ;ab :sp ~/.config/nvim/abbreviations.vim<Cr>

" copy and paste

" " Copy to clipboard
vnoremap  sy  "+y
nnoremap  sY  "+yg_
nnoremap  sy  "+y

" " Paste from clipboard
nnoremap sp "+p
nnoremap sP "+P
vnoremap sp "+p
vnoremap sP "+P

" capital U to re-do

nnoremap U <C-r>

" visuals and line numbers
set number relativenumber

" toggle for line number (used for debugging)

nnoremap ;ln :set number relativenumber!<Cr>

augroup allgroup
	autocmd! allgroup
	autocmd FileType * let g:lightline = {
				\ 'colorscheme': 'one',
				\ }
augroup END

" abbreviations

source ~/.config/nvim/abbreviations.vim

" nerdtree settings

" let NERDTreeShowLineNumbers=0

nnoremap <Tab> :NERDTreeToggle<Cr>

augroup nerdtree
	autocmd! nerdtree
	autocmd FileType nerdtree setlocal nonumber norelativenumber 
	autocmd FileType nerdtree highlight EndOfBuffer ctermfg=235 ctermbg=235 guifg=235 guibg=235
	autocmd FileType nerdtree highlight CursorLine cterm=NONE ctermbg=237term=NONE  guibg=237
augroup END

" calendar
" ;cal to enter, pressing q exits
nnoremap ;cal :Calendar -view=year -split=vertical -width=27<Cr>


" exiting goyo won't reset line number colors

function! s:goyo_leave()
	source ~/.config/nvim/highlight.vim
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

highlight SpellBad ctermfg=Red guifg=Red ctermbg=NONE guibg=NONE guisp=Red cterm=undercurl
highlight SpellCap ctermfg=LightBlue guifg=LightBlue ctermbg=NONE guibg=NONE guisp=LightBlue cterm=undercurl

"ctrl-l to correct the last spelling mistake

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


let g:vimtex_mappings_enabled=0
let g:vimtex_compiler_latexmk_engines= {
			\ 'xelatex': '-xelatex',
			\ }
let g:vimtex_view_method ='skim'
let g:vimtex_view_automatic=1
let g:vimtex_view_skim_activate=1

" templates

if has ("autocmd")
	augroup templates
		autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex
		autocmd BufNewFile *.Rmd 0r ~/.config/nvim/templates/skeleton.Rmd
		autocmd BufNewFile *.md 0r ~/.config/nvim/templates/skeleton.md
	augroup END
endif


nnoremap ;tde A<Space><C-r>=substitute(&commentstring, '%s', '', 'g')<Cr>TODO<Space><Space>(<C-r>=strftime("\%Y-\%m-\%d")<Cr>)<Esc>TOa
nnoremap ;tdl A<C-r>=substitute(&commentstring, '%s', '', 'g')<Cr>TODO<Space><Space>(<C-r>=strftime("\%Y-\%m-\%d")<Cr>)<Esc>TOa

"python

" Neomake 

" Run linter on write
autocmd! BufWritePost * Neomake

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0

" Deoplete 

" Use deoplete only for python

augroup pythoncomplete
    autocmd! pythoncomplete
    autocmd FileType python call deoplete#enable()
    autocmd BufEnter *.py call deoplete#enable()        
    autocmd BufLeave *.py call deoplete#disable()        
augroup END

let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'
set completeopt+=noinsert
set completeopt-=preview

" Jedi-vim 

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" REPL for python

"remove binding for s, it's essentially just ci

augroup pythonrepl
	autocmd! pythonrepl
	autocmd FileType python nmap \rf :Repl python<Cr>a
	autocmd FileType python nmap s <Plug>(ReplSend)
	autocmd FileType python nmap ss <Plug>(ReplSend)ap
augroup END

au TermOpen * setlocal nonumber norelativenumber

" get out of terminal mode with escape
tnoremap <Esc> <C-\><C-n>

