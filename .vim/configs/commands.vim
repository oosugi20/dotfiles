"!
" 汎用コマンド定義ファイル
"

""
" 開いてるファイルのディレクトリに移動
"
command! -nargs=0 CD :execute 'lcd ' . substitute(expand("%:p:h"), ' ', '\ ', 'g')
