" Gemini CLI の Diff 色上書き対策
augroup GeminiDiffFix
  autocmd!
  autocmd VimEnter,BufWinEnter * if &diff | call MySetDiffColors() | endif
augroup END

" Gemini CLI が Vim を起動する際に、Diff のハイライト設定をコマンドライン引数で直接上書きするため、
" mine.vim で設定された Diff 色が適用されない問題を解決するための関数。
" Vim が Diff モードで起動された後に、mine.vim で定義された Diff 色を再適用する。
function! MySetDiffColors()
  " DiffAdd: 追加された行の背景色 (mine.vim の設定)
  highlight DiffAdd guibg=#13354A ctermbg=151
  " DiffChange: 変更された行の背景色 (mine.vim の設定)
  highlight DiffChange guifg=#89807D guibg=#4C4745 ctermfg=247 ctermbg=238
  " DiffDelete: 削除された行の背景色 (mine.vim の設定)
  highlight DiffDelete guifg=#960050 guibg=#1E0010 ctermfg=161 ctermbg=217
  " DiffText: 変更されたテキストの背景色 (mine.vim の色合いに合わせた調整)
  highlight DiffText guibg=#304050 ctermbg=17
  " DiffTextAdd: 追加されたテキストの背景色 (mine.vim の色合いに合わせた調整)
  highlight DiffTextAdd guibg=#3C3732 ctermbg=236
endfunction