nnoremap ;count :w<Cr>:!texcount %<Cr>
set spell
inoremap ;fn \footnote{}<++><Esc>?}<Enter>i
inoremap ;ct \citet{}<++><Esc>?}<Enter>i
inoremap ;cp \citep{}<++><Esc>?}<Enter>i
inoremap ;it \emph{}<++><Esc>?}<Enter>i
inoremap ;bf \textbf{}<++><Esc>?}<Enter>i
inoremap ;if \begin{figure}[<++>]<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\includegraphics[width = <++>]{<++>}<Enter>\end{figure}
inoremap ;be <Esc>diwi\begin{<Esc>pa}<Enter><Enter>\end{<Esc>pa}<Esc>ki


