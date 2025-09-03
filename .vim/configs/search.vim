" =============================================================
" 検索
"
"検索の時に大文字小文字を区別しない
set ignorecase
"ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set smartcase
"検索のときに大文字小文字を区別する
"set noignorecase
"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
"インクリメンタルサーチ
set incsearch
"検索結果文字列のハイライト
set hlsearch

" vimgrep 後自動的にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

