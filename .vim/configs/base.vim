""
" 基本設定
"
syntax on
colorscheme mine
set termguicolors
set ttimeoutlen=10
set backspace=indent,eol,start

" 一行が長い場合に重くなるのを避けるため、規定値以上はハイライトしない
set synmaxcol=1000


""
" ファイル・バッファ管理
"

" undoファイルの保存場所
set undodir=~/.vim/undo

" swap / backup(~) ファイルを作らない
set noswapfile
set nobackup

" 開いてるファイルが他で更新されたらオートロード
set autoread

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif


""
" ディレクトリ・パス関連
"

" バッファを読み込んだ際に自動的にカレントディレクトリを移動するのを抑制する
" vim .等で起動した際に、カレントディレクトリがずれる問題のため
set noautochdir

" ファイルを開いたときにディレクトリ自動移動
augroup CDAutoCmd
  autocmd!
  "autocmd CDAutoCmd BufEnter * execute 'CD'
  autocmd BufEnter * if empty(&buftype) && filereadable(expand('%')) | execute 'lcd' fnameescape(expand('%:p:h')) | endif
augroup END

" ブラウズの際、初期ディレクトリをバッファの開いたディレクトリにする
set browsedir=buffer


""
" テキスト整形
"

" textwidthの文字数で自動改行させない
" どのファイルタイプでもformatoptionsをronqに設定する
autocmd FileType * setlocal formatoptions=ronq

""
" その他
"

" クリップボードを他と共通に
set clipboard=unnamed

" コマンドライン補完の挙動
set wildmode=list:longest
