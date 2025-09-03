if exists('*g:AgTodoFunc')
  delfunction g:AgTodoFunc
endif

"!
" g:AgTodoFunc
" TODO/FIXMEコメント、特定マークアップの検索関数。
" 検索結果: クイックフィックスウィンドウに表示。
"
" @remarks
"   - 常に大文字小文字を区別しない検索 (-i) を適用。
"   - '[x]' を含むファイル/ディレクトリを検索対象から除外。
"
" @param {string} a:arg_string - 検索オプション、ファイル/ディレクトリパス。
"                                '!' 指定時: 重要マークアップ（例: [!]）を検索。
"
function! g:AgTodoFunc(arg_string)
  setlocal grepformat=%f:%l:%c:%m

  let l:default_search_pattern = '\b(TODO|FIXME)(:|\s|$)|(^|\s)[-*+]\s*\[\s*\]|(^|\s)[-*+]\s*\[!\s*\]'
  let l:important_search_pattern = '(^|\s)[-*+]\s*\[!\s*\]'

  let l:search_pattern = l:default_search_pattern
  let l:ag_args = a:arg_string


  if a:arg_string =~# '^!$'

    let l:search_pattern = l:important_search_pattern
    let l:trimmed_arg = trim(a:arg_string)
    if l:trimmed_arg == '!'

      let l:ag_args = ''
    else

      let l:ag_args = substitute(a:arg_string, '^\s*!\s*', '', '')
    endif
  else

  endif

  let l:ag_base_cmd = 'ag -i --ignore ''[x]'' ''' . l:search_pattern . ''' --vimgrep'
  let l:full_cmd = l:ag_base_cmd
  if empty(l:ag_args)
    let l:full_cmd .= ' .'
  else
    let l:full_cmd .= ' ' . l:ag_args
  endif

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
