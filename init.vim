"  _           _   _                 _
 " (_)  _ __   (_) | |_      __   __ (_)  _ __ ___
 " | | | '_ \  | | | __|     \ \ / / | | | '_ ` _ \
 " | | | | | | | | | |_   _   \ V /  | | | | | | | |
 " |_| |_| |_| |_|  \__| (_)   \_/   |_| |_| |_| |_|
 "                                                  

 if !exists('g:vscode')

" {{{ plugins
set nocompatible              " be iMproved, required
filetype off                  " required 
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
call plug#begin('~/.vim/plugged')

" basics
Plug 'VundleVim/Vundle.vim'
Plug 'dkarter/bullets.vim'
Plug 'tpope/vim-surround'
" Plug 'ervandew/supertab'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
" Plug 'christoomey/vim-titlecase'
Plug 'itchyny/lightline.vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'tmsvg/pear-tree'
Plug 'triglav/vim-visual-increment'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'easymotion/vim-easymotion' 
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-fugitive'

" autocomplete
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-bufword'

" nerdtree
" Plug 'scrooloose/nerdtree'

" colorschemes

Plug 'andreypopp/vim-colors-plain'
Plug 'ayu-theme/ayu-vim'
Plug 'romainl/Apprentice'
Plug 'arzg/vim-corvine'
Plug 'NewProggie/NewProggie-Color-Scheme'

" markdown
Plug 'godlygeek/tabular'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'plasticboy/vim-markdown'

" r
" Plug 'vim-pandoc/vim-rmarkdown'
Plug 'jalvesaq/Nvim-R'
" Plug 'gaalcaras/ncm-R'

" latex
Plug 'lervag/vimtex'

" python
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/context_filetype.vim'
" Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Plug 'davidhalter/jedi-vim'
Plug 'neomake/neomake'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'mtikekar/nvim-send-to-term'
Plug 'HiPhish/repl.nvim'

" web development
Plug 'alvan/vim-closetag'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim' 
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'mlaursen/vim-react-snippets'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'leafgarland/typescript-vim'

" in development
" Plug 'quentin-fox/vimtitles'
Plug '~/iCloud/projects/vimtitles'
Plug '~/iCloud/projects/nvimnotes'
Plug '~/iCloud/projects/vimsearch'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" All of your Plugins must be added before the following line
call plug#end()
" call vundle#end()            " required
filetype plugin indent on    " required

" }}}
" {{{ basic setup

syntax on

set mouse=a

" used for argdo
" set hidden
set confirm

set termencoding=utf-8 encoding=utf-8

"persistent undo
set undodir=~/.config/nvim/undodir
set undofile

" find/replace, case sensitivity
set inccommand=nosplit
set ignorecase
set smartcase
nnoremap <silent> ;<Enter> :nohlsearch<Cr>

" disable line wrap
set textwidth=0
set wrap
set list  " shows white space on current line


" conceal
set conceallevel=0
let g:pandoc#syntax#conceal#use = 0

" visuals and line numbers
set number relativenumber

" Disables Automatic Line Numbering
autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

set completeopt+=noinsert
set completeopt+=menuone
set completeopt-=preview
au TermOpen * setlocal nonumber norelativenumber

"fzf
nnoremap <silent> <Tab> :FZF<Cr>
nnoremap <silent> <S-Tab> :Lines<Cr>

command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" open fzf in floating window

" let $FZF_DEFAULT_OPTS = '--layout=reverse'

" completion

" let g:SuperTabDefaultCompletionType = "<C-x><C-o>"


" }}}
" {{{ colors ~/.config/nvim/colors

set termguicolors
" set background=dark

" change dropdown colors

colorscheme Apprentice


autocmd ColorScheme * highlight Pmenu ctermfg=DarkGrey ctermbg=None guifg=DarkGrey guibg=237
autocmd ColorScheme * highlight PmenuSel ctermfg=100 ctermbg=DarkGrey guifg=100 guibg=DarkGrey


" }}}
"{{{ sourcing files

source ~/.config/nvim/abbreviations.vim

source ~/.config/nvim/highlight.vim

"}}}
"{{{ basic keybindings

" open config shortcuts

function! OpenConfig()

	if bufname() == ""
		execute "e ~/.config/nvim/init.vim"
	else
		if winwidth(0) > (winheight(0) * 1.5)
			execute "vs ~/.config/nvim/init.vim"
		else
			execute "sp ~/.config/nvim/init.vim"
		endif
	endif
endfunction

nnoremap <silent> ;rc :call OpenConfig()<Cr>


nnoremap ;ft :execute 'sp ~/.config/nvim/after/ftplugin/' . &filetype . '.vim'<Cr>
nnoremap ;ab :sp ~/.config/nvim/abbreviations.vim<Cr>

" copy and paste

" Copy to clipboard
vnoremap  sy  "+y
nnoremap  sY  "+yg_
nnoremap  sy  "+y

" Paste from clipboard
nnoremap sp "+p
nnoremap sP "+P
vnoremap sp "+p
vnoremap sP "+P

" Y to yank until end of the line

nnoremap Y y$

" gp to select what was last pasted

nnoremap gp `[v`]

" capital U to re-do

nnoremap U <C-r>

" shortcut to toggle spelling

nnoremap <silent> ;sp :set spell!<Cr>

" toggle for line number (used for debugging)

nnoremap ;ln :set number relativenumber!<Cr>

" window navigation

nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>


tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>

" get out of terminal mode with escape
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w> <C-\><C-n><C-w>


" rebind beginning and end of lines

nnoremap B ^
nnoremap E $

nnoremap $ <nop>
nnoremap ^ <nop>

" rebind for long lines

nnoremap j gj
nnoremap k gk

inoremap <silent> ;; <Esc>:call search("<++>")<Enter>"_c4l
nnoremap <silent> ;; :call search("<++>")<Enter>"_c4l

function! BreakHere()
	s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
	call histdel("/", -1)
endfunction

nnoremap <silent> K :<C-u>call BreakHere()<CR>

" going to next/prev match will turn off the search highlights

" nnoremap <silent> n n<Esc>:nohl<Cr>
" nnoremap <silent> N N<Esc>:nohl<Cr>


" align text with center after jumping to previous edit

nnoremap <silent> g; g;zz

" source the current file

nnoremap ;src :source %<Cr>

" closetag support for xml/plist files

let g:closetag_filetypes = 'html,xhtml,phtml,xml'

" toggle recursive folds with <Space>
nnoremap <silent> <Space> zA

" }}}
" {{{ plugin keybindings 

" goyo
map <silent> ;w :Goyo \| set linebreak<Cr>

" sideways.vim keybindings
nnoremap <S-Left> :SidewaysLeft<cr>
nnoremap <S-Right> :SidewaysRight<cr>

" vim-easy-align keybindings

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim fugitive

nnoremap ~ :Gstatus<Cr>

" }}}
" {{{ ncm2

set shortmess+=c

set pumheight=5

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <C-c> <Esc>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" autocmd BufEnter * call ncm2#disable_for_buffer()
" autocmd BufEnter *.py, call ncm2#enable_for_buffer()


" let ncm2#popup_delay = 200
" let ncm2#complete_length = [[1, 1]]

" let g:ncm2#matcher = 'substrfuzzy'

" augroup my_cm_setup
"   autocmd!
"   autocmd BufEnter *.tex call ncm2#enable_for_buffer()
"   autocmd Filetype tex call ncm2#register_source({
"           \ 'name' : 'vimtex-cmds',
"           \ 'priority': 8,
"           \ 'complete_length': -1,
"           \ 'scope': ['tex'],
"           \ 'matcher': {'name': 'prefix', 'key': 'word'},
"           \ 'word_pattern': '\w+',
"           \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
"           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"           \ })
"   autocmd Filetype tex call ncm2#register_source({
"           \ 'name' : 'vimtex-labels',
"           \ 'priority': 8,
"           \ 'complete_length': -1,
"           \ 'scope': ['tex'],
"           \ 'matcher': {'name': 'combine',
"           \             'matchers': [
"           \               {'name': 'substr', 'key': 'word'},
"           \               {'name': 'substr', 'key': 'menu'},
"           \             ]},
"           \ 'word_pattern': '\w+',
"           \ 'complete_pattern': g:vimtex#re#ncm2#labels,
"           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"           \ })
"   autocmd Filetype tex call ncm2#register_source({
"           \ 'name' : 'vimtex-files',
"           \ 'priority': 8,
"           \ 'complete_length': -1,
"           \ 'scope': ['tex'],
"           \ 'matcher': {'name': 'combine',
"           \             'matchers': [
"           \               {'name': 'abbrfuzzy', 'key': 'word'},
"           \               {'name': 'abbrfuzzy', 'key': 'abbr'},
"           \             ]},
"           \ 'word_pattern': '\w+',
"           \ 'complete_pattern': g:vimtex#re#ncm2#files,
"           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"           \ })
"   autocmd Filetype tex call ncm2#register_source({
"           \ 'name' : 'bibtex',
"           \ 'priority': 8,
"           \ 'complete_length': -1,
"           \ 'scope': ['tex'],
"           \ 'matcher': {'name': 'combine',
"           \             'matchers': [
"           \               {'name': 'prefix', 'key': 'word'},
"           \               {'name': 'abbrfuzzy', 'key': 'abbr'},
"           \               {'name': 'abbrfuzzy', 'key': 'menu'},
"           \             ]},
"           \ 'word_pattern': '\w+',
"           \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
"           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"           \ })
" augroup END


"}}}
" {{{ coc

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


nnoremap <silent> ge :CocCommand explorer --toggle<Cr>

nnoremap <silent> <leader>pp :CocCommand prettier.formatFile<Cr>

nnoremap <F2> <Plug>(coc-rename)


" text objects

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" }}}
" {{{ jedi

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "2"
" let g:python3_host_prog = '~/.config/nvim_python/neovim3/bin/python'

" }}}
"{{{ spelling

set nospell

highlight SpellBad ctermfg=Red guifg=Red ctermbg=NONE guibg=NONE guisp=Red cterm=undercurl
highlight SpellCap ctermfg=LightBlue guifg=LightBlue ctermbg=NONE guibg=NONE guisp=LightBlue cterm=undercurl

"ctrl-l to correct the last spelling mistake

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"ctrl-s to jump back to last spelling mistake, open spelling menu

inoremap <C-s> <Esc>ms[sea<C-x>s
" inoremap <C-y> <C-y><Esc>`sa
"}}}
"{{{ templates

if has ("autocmd")
	augroup templates
		autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex
		autocmd BufNewFile *.Rmd 0r ~/.config/nvim/templates/skeleton.Rmd
		autocmd BufNewFile *.md 0r ~/.config/nvim/templates/skeleton.md
	augroup end
endif

" }}}
"{{{ nerdtree settings

" let NERDTreeShowLineNumbers=0


" fun! ToggleNERDTreeWithRefresh()
"     :NERDTreeToggle 
"     if(exists("b:NERDTreeType") == 1)
"         call feedkeys("R")  
"     endif   
" endf 

" nnoremap <silent> <Tab> :call ToggleNERDTreeWithRefresh()<Cr>

" augroup nerdtree
" 	autocmd! nerdtree
" 	autocmd FileType nerdtree setlocal nonumber norelativenumber 
" 	autocmd FileType nerdtree highlight EndOfBuffer ctermfg=235 ctermbg=235 guifg=235 guibg=235
" 	autocmd FileType nerdtree highlight CursorLine cterm=NONE ctermbg=237term=NONE  guibg=237
" augroup end

"}}}
"{{{ goyo settings

" exiting goyo won't reset line number colors

function! s:goyo_leave()
	source ~/.config/nvim/highlight.vim
endfunction


autocmd! User GoyoLeave nested call <SID>goyo_leave()

" goyo
let g:goyo_height=92
let g:goyo_width=95


"}}}
" {{{ lightline settings

augroup allgroup
	autocmd! allgroup
	autocmd FileType * let g:lightline = {
				\ 'colorscheme': 'one',
				\ 'active': {
				\ 'right': [ [ 'lineinfo' ],
				\ [ 'percent' ] ]
				\ },
				\ }
augroup end 


" }}}
" {{{ latex

let g:vimtex_mappings_enabled=0
let g:vimtex_compiler_latexmk_engines= {
			\ 'xelatex': '-xelatex',
			\ }
let g:vimtex_view_method ='skim'
let g:vimtex_view_automatic=1
let g:vimtex_view_skim_activate=1


"}}}
" {{{ markdown


autocmd FileType pandoc nnoremap  gb mbI*<Space><Esc>`b2l

" }}}
" {{{ bullets.vim 

let g:bullets_enabled_file_types = ['markdown', 'text', 'gitcommit', 'notes']

" }}}
"{{{ python

" Neomake 

let g:neomake_python_python_exe = 'python3'

" Run linter on write
call neomake#configure#automake('nw', 750)


augroup neomakeft
	autocmd! neomakeft
	autocmd BufEnter * silent NeomakeDisableBuffer
	autocmd BufEnter *.py,*.js,*.jsx,*.ts,*.tsx silent NeomakeEnableBuffer
	" autocmd BufEnter *.py silent NeomakeEnableBuffer
augroup end

let g:neomake_error_sign = {'text': '>', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
     \   'text': '?',
     \   'texthl': 'NeomakeWarningSign',
     \ }
let g:neomake_message_sign = {
      \   'text': '➤',
      \   'texthl': 'NeomakeMessageSign',
      \ }
let g:neomake_info_sign = {'text': 'i', 'texthl': 'NeomakeInfoSign'}

let g:neomake_python_enabled_makers = ['flake8']
" configuration for flake8 found at ~/.config/flake8

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 1

" Deoplete 

" Use deoplete only for python

" augroup pythoncomplete
"     autocmd! pythoncomplete

"     autocmd FileType python call deoplete#enable()
"     autocmd BufEnter *.py call deoplete#enable()        
"     autocmd BufLeave *.py call deoplete#disable()        
" augroup end

" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
" " complete with words from any opened file
" let g:context_filetype#same_filetypes = {}
" let g:context_filetype#same_filetypes._ = '_'

" python indentation

let g:python_pep8_indent_hang_closing=0

" call deoplete#custom#option('auto_complete_delay', 200)

" Jedi-vim 

" Disable autocompletion (using deoplete instead)
" let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
" let g:jedi#goto_command = ',d'
" Find ocurrences
" let g:jedi#usages_command = ',o'
" Find assignments
" let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
" nmap ,D :tab split<CR>:call jedi#goto()<CR>

" REPL for python

let g:is_pythonsense_suppress_object_keymaps = 0
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_suppress_location_keymaps = 1

" repl settings


augroup pythonrepl
	autocmd! pythonrepl
	autocmd FileType python nmap <silent> \rf ms:Repl python<Cr>:SendHere<Cr><C-w><C-p>`s
	autocmd FileType python nmap <silent> \rr :w<Cr>:!python3 %<Cr>
	autocmd FileType python nmap <silent> \ri :execute "below sp <bar> term python3 -i %"<Cr>:SendHere<Cr>
	autocmd FileType python nmap <silent> \rq :bdelete! term<Cr>
	autocmd FileType python nnoremap s 
augroup end

function! ClosePyRepl()
    if len(bufname("term")) != 0
        exe "bdelete! term<Tab>")
    endif
endfunction

"}}}
"{{{ flask

" shortcut for run

" autocmd Filetype python nnoremap <Bar> :wa<Cr>:!flask run<Cr>

"}}}
" {{{ django 

autocmd Filetype python,jinja.html nnoremap <Bar> :wa<Cr>:call ToggleDjango()<Cr>
autocmd Filetype python,jinja.html nnoremap <silent> <C-\> :silent execute "!open http://127.0.0.1:8000/admin -a Firefox"<Cr>


function! ToggleDjango()
    " use toggle to initialize job
    if !exists("g:django_running")
	    let g:django_running = 0
    endif
    if g:django_running == 0
        let g:django_job_id = jobstart(split(&shell) + split(&shellcmdflag) + ['python manage.py runserver'])
        echo "Running Django Server, job " . g:django_job_id
        let g:django_running = 1
    elseif g:django_running == 1
        call jobstop(g:django_job_id)
        echo "Quitting Django Server, job " . g:django_job_id
        let g:django_running = 0
    endif
endfunction

command! DShell call execute("sp <bar> term source venv/bin/activate && python manage.py shell")


" }}}
" {{{ html


" }}}
" {{{ javascript 

let g:neomake_javascript_enabled_makers = ['eslint']

autocmd BufNewFile,BufRead *.jsx set filetype=javascript
autocmd Filetype javascript set foldmethod=syntax

hi link jsClassProperty Function

"}}}
" {{{ typescript 


autocmd BufNewFile,BufRead,BufEnter *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead,BufEnter *.tsx setlocal filetype=typescript.tsx

" typescript settings for pear-tree defined in
" overrides defaults to deal better with behavior of <>'s
" use emmet instead to write JSX/html blocks
" requires yats.vim syntax group of typescriptArrowFunc

let g:neomake_typescript_enabled_makers = ['eslint']
let g:neomake_typescript_eslint_exe = $PWD . '/node_modules/.bin/eslint'

let g:neomake_typescript_tsx_enabled_makers = ['eslint']
let g:neomake_typescript_tsx_eslint_exe = $PWD . '/node_modules/.bin/eslint'

augroup tsx_pairs
    autocmd!
    autocmd FileType typescript,typescript.tsx let b:pear_tree_pairs = {
                \ '`': {'closer': '`'},
                \ '"': {'closer': '"'},
                \ "'": {'closer': "'"},
                \ '[': {'closer': ']'},
                \ '(': {'closer': ')'},
                \ '{': {'closer': '}'},
                \ '<': {'closer': '>', 'not_in': ['typescriptArrowFunc']},
		\ }
    autocmd Filetype typescript,typescript.tsx set foldmethod=syntax
augroup END

" fixes the problems with highlights of imports
hi link typescriptBlock typescriptBOM

" }}}
" {{{ pear-tree 

let g:pear_tree_repeatable_expand = 0



" }}}
"{{{ r


" disable nvim-r things
let R_assign=0
let R_user_maps_only=0

" }}}
"{{{ transcription


" command! -nargs=1 -complete=file Transcribe call execute("below 6sp | term mpv --input-file=~/.config/mpv/mpvfifo " . fnameescape(<q-args>))

" nnoremap <silent> <Cr> :silent execute "!echo 'keypress p' > ~/.config/mpv/mpvfifo"<Cr>
" nnoremap <silent> = :silent execute "!echo 'seek 4' > ~/.config/mpv/mpvfifo"<Cr>
" nnoremap <silent> - :silent execute "!echo 'seek -4' > ~/.config/mpv/mpvfifo"<Cr>


"}}}
"{{{ subtitles

let g:neomake_subtitle_srt_maker = {
			\ 'exe': 'srt',
			\ 'args': ['lint'],
			\ 'errorformat': 'error: %m near line: %l',
			\ }

let g:neomake_subtitle_enabled_makers = ['srt']

"}}}
" {{{ custom functions


function! DeWindows()
  " 'e' flag prevents errors from being displayed 
  execute '%s///ge'
  execute "%s/‘\|’/'/ge"
  execute "%s/’/'/ge"
  execute "%s/‘/'/ge"
  execute '%s/“\|”/"/ge'
  execute '%s/…/.../ge'
  execute '%s/–/-/ge'
  execute '%s/—/--/ge'
  echom 'Converted windows characters to UNIX versions.'
endfunction

function! SentenceToLine()
	silent execute '%s/\. \+\([A-Z]\)/.\r\1/g'
endfunction

function! LatexQuotes()
	silent execute "%s/“/``/g"
	silent execute "%s/”/''/g" 
endfunction

nnoremap <F10> :echo synIDattr(synID(line("."), col("."), 1), "name")

	
" }}}

endif
