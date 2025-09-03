"!
" commands.rg.vim
" rg を使ったカスタム検索コマンド
"
" 使い方:
"   :Rg <検索パターン> [ファイル/ディレクトリ]
"     rg --vimgrep を使って検索し、結果をクイックフィックスウィンドウに表示します。
"     例: :Rg "TODO" .
"     例: :Rg "FIXME" src/
"
"   :RgTodo [!] [ファイル/ディレクトリ]
"     TODO/FIXMEコメント、または特定のマークアップを検索します。
"     引数に "!" を含めると、より重要なマークアップ（例: [!]）を検索します。
"     例: :RgTodo
"     例: :RgTodo !
"     例: :RgTodo ! src/
"
" 注意点:
"   - rg (ripgrep) がシステムにインストールされている必要があります。
"   - 検索結果はクイックフィックスウィンドウに表示されます。
"

command! -nargs=+ -complete=file Rg call g:RgFunc(<q-args>)
command! -nargs=* -complete=file RgTodo call g:RgTodoFunc(<q-args>)
