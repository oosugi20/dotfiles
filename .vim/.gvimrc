set columns=100
set lines=54
set transparency=2
set guifont=MigMix\ 1M\ Regular\ for\ Powerline:h14

augroup MyGvimAutoCmd
  autocmd!
augroup END

autocmd MyGvimAutoCmd BufEnter * setlocal formatoptions=q

" no tool bar
set guioptions-=T

" no scrollbar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
