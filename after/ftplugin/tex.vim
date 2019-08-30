" highlighting

source ~/.config/nvim/highlight.vim

" snippets
command Texcount call execute("!texcount %")
set nospell
inoremap ;fn \footnote{}<++><Esc>?}<Enter>i
inoremap ;ct \citet{}<++><Esc>?}<Enter>i
inoremap ;cp \citep{}<++><Esc>?}<Enter>i
inoremap ;it \emph{}<++><Esc>?}<Enter>i
inoremap ;bf \textbf{}<++><Esc>?}<Enter>i
inoremap ;if \begin{figure}[<++>]<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\includegraphics[width = <++>]{<++>}<Enter>\end{figure}
inoremap ;be <Esc>diwi\begin{<Esc>pa}<Enter><Enter>\end{<Esc>pa}<Esc>ki

" vimtex

let g:vimtex_compiler_latexmk = { 'continuous' : 0 }

nnoremap ;cp :w<Cr>:VimtexCompileSS<Cr>
nnoremap ;vw :VimtexView<Cr>

" indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=100
set expandtab
set autoindent
