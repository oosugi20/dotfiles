"!
" commands.ag.vim
" ag を使ったカスタム検索コマンド
"
" 使い方:
"   :Ag <検索パターン> [ファイル/ディレクトリ]
"     ag --vimgrep を使って検索し、結果をクイックフィックスウィンドウに表示します。
"     例: :Ag "TODO" .
"     例: :Ag "FIXME" src/
"
"   :AgTodo [!] [ファイル/ディレクトリ]
"     TODO/FIXMEコメント、または特定のマークアップを検索します。
"     引数に "!" を含めると、より重要なマークアップ（例: [!]）を検索します。
"     例: :AgTodo
"     例: :AgTodo !
"     例: :AgTodo ! src/
"
" 注意点:
"   - ag (The Silver Searcher) がシステムにインストールされている必要があります。
"   - 検索結果はクイックフィックスウィンドウに表示されます。
"

command! -nargs=+ -complete=file Ag call g:AgFunc(<q-args>)
command! -nargs=* -complete=file AgTodo call g:AgTodoFunc(<q-args>)
