if exists('*g:AgFunc')
  delfunction g:AgFunc
endif

"!
" g:AgFunc
" ag (The Silver Searcher) を使った検索関数。
" 検索結果: クイックフィックスウィンドウに表示。
"
" @remarks 常に大文字小文字を区別しない検索 (-i) を適用。
"
" @param {string} a:arg_string - ag コマンド引数。
"
function! g:AgFunc(arg_string)
  setlocal grepformat=%f:%l:%c:%m
  let l:ag_base_cmd = 'ag --vimgrep'
  let l:full_cmd = l:ag_base_cmd . ' ' . a:arg_string
  
  let l:tmp_file = tempname()
  let l:full_cmd_with_redirect = l:full_cmd . ' > ' . shellescape(l:tmp_file)

  
  call system(l:full_cmd_with_redirect . ' 2>/dev/null')

  if filereadable(l:tmp_file) && getfsize(l:tmp_file) > 0
    execute 'cfile' l:tmp_file
    copen
  else
    echohl WarningMsg | echo "No matches found." | echohl None
  endif

  if filereadable(l:tmp_file)
    call delete(l:tmp_file)
  endif
endfunction
