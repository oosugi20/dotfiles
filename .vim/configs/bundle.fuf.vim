"!
" FuzzyFinder settings
" --------------------------------------------------

nnoremap <C-f> <ESC>
nnoremap <silent> <C-f><C-f> :<C-u>call FufCustomFileInCurrentWindow()<CR>
nnoremap <silent> <C-f><C-d> :FufDir<CR>
nnoremap <silent> <C-f><C-D> :FufDirWithFullCwd<CR>
nnoremap <silent> <C-f><Up> :FufChangeList<CR>
nnoremap <silent> <C-f><Right> :FufLine!<CR>
nnoremap <silent> <C-f><Down> :FufJumpList<CR>
nnoremap <silent> <C-f><C-m> :FufMruFile<CR>
nnoremap <silent> <C-f><C-z> :FufMruCmd<CR>
nnoremap <silent> <C-f><C-b> :FufBuffer<CR>
nnoremap <silent> <C-f><C-v> :FufBookmarkDir<CR>
nnoremap <silent> <C-f><C-q> :FufQuickfix<CR>


let g:fuf_keyOpenSplit = '<D-CR>'
let g:fuf_keyOpenVsplit = '<C-CR>'
let g:fuf_keyOpenTabpage = '<S-CR>'
let g:fuf_useMigemo = 0
let g:fuf_modesDisable = []


" TODO
" - fufで開いた時、右に開く
"   - ctl-fだけ対応済み。履歴とかはまだ
" - fufdataを移動
" - 行頭と前の行末の行き来の設定が順番変えると効かなくなる

"!
" FufCustomFileInCurrentWindow
" アクティブなペインでファイルを開くための関数
"
function! FufCustomFileInCurrentWindow()
  let l:current_winid = win_getid()
  let l:listener = {}
  let l:listener.onComplete = function('FufCustomFileOnComplete', [l:current_winid])
  let l:listener.onAbort = function('FufCustomFileOnAbort', [l:current_winid])

  " FufRenewCache コマンドを直接実行
  execute ':FufRenewCache'
  call fuf#callbackfile#launch('', 0, '>File[]>', '', l:listener)
endfunction

function! FufCustomFileOnComplete(winid, item, method)
  " 元のウィンドウに戻り、ファイルを開く
  call win_gotoid(a:winid)
  execute 'edit ' . fnameescape(a:item)
endfunction

function! FufCustomFileOnAbort(winid)
  " 元のウィンドウに戻る
  call win_gotoid(a:winid)
endfunction
