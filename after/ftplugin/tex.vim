" snippets
nnoremap ;count :w<Cr>:!texcount %<Cr>
set spell
inoremap ;fn \footnote{}<++><Esc>?}<Enter>i
inoremap ;ct \citet{}<++><Esc>?}<Enter>i
inoremap ;cp \citep{}<++><Esc>?}<Enter>i
inoremap ;it \emph{}<++><Esc>?}<Enter>i
inoremap ;bf \textbf{}<++><Esc>?}<Enter>i
inoremap ;if \begin{figure}[<++>]<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\includegraphics[width = <++>]{<++>}<Enter>\end{figure}
inoremap ;be <Esc>diwi\begin{<Esc>pa}<Enter><Enter>\end{<Esc>pa}<Esc>ki

" vimtex

" let g:vimtex_compiler_latexmk = { 'continuous' : 0 }
let g:vimtex_mappings_enabled=0
let g:vimtex_compiler_latexmk_engines= {
			\ 'xelatex': '-xelatex',
			\ }
let g:vimtex_view_method ='skim'
let g:vimtex_view_automatic=1
let g:vimtex_view_skim_activate=1

nnoremap ;cp :w<Cr>:VimtexCompileSS<Cr>
nnoremap ;vw :VimtexView<Cr>
