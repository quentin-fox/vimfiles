set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=0
set wrapmargin=0
set wrap
set expandtab
set autoindent
set fileformat=unix

" code folding options
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=99 " no folds closed by default, but folding still enabled
nnoremap <Space> za

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" changes the repl attached to the &ft=python from python to python3
" changed after switching to pyenv

autocmd BufEnter term://* startinsert

" nnoremap <silent> sic :call search('class', 'b')<Cr>V/^n

" pair matching for f-strings


