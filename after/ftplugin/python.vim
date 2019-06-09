set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100
set expandtab
set autoindent
set fileformat=unix

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" changes the repl attached to the &ft=python from python to python3
let python_repl = {
            \ 'bin': 'python3',
            \ 'args': [],
            \ 'syntax': '',
            \ 'title': 'Python REPL',
            \ }

call repl#define_repl('python', python_repl, 'force')

autocmd BufEnter term://* startinsert

" nnoremap <silent> sic :call search('class', 'b')<Cr>V/^n
