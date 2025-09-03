if exists('*g:RgTodoFunc')
  delfunction g:RgTodoFunc
endif

"!
" g:RgTodoFunc
" TODO/FIXMEコメント、特定マークアップの検索関数。
" 検索結果: クイックフィックスウィンドウに表示。
"
" @remarks
"   - 常に大文字小文字を区別しない検索 (-i) を適用。
"   - `- [ ]` 、 `- [!]` を検索対象とする。
"   - 完了済みを示す `[x]` は検索対象としない。
"
" @param {string} a:arg_string - 検索オプション、ファイル/ディレクトリパス。
"                                '!' 指定時: 重要マークアップ（例: [!]）を検索。
"
function! g:RgTodoFunc(arg_string)
  setlocal grepformat=%f:%l:%c:%m

  let l:default_search_pattern = '\b(TODO|FIXME)(:|\s|$)|(^|\s)[-*+]\s*\[\s*\]|(^|\s)[-*+]\s*\[!\s*\]'
  let l:important_search_pattern = '(^|\s)[-*+]\s*\[!\s*\]'
  let l:wait_search_pattern = '(^|\s)[-*+]\s*\[wait\s*\]' " 新しい検索パターン

  let l:search_pattern = l:default_search_pattern
  let l:rg_args = a:arg_string

  if a:arg_string =~# '^!$'
    let l:search_pattern = l:important_search_pattern
    let l:trimmed_arg = trim(a:arg_string)
    if l:trimmed_arg == '!'
      let l:rg_args = ''
    else
      let l:rg_args = substitute(a:arg_string, '^\s*!\s*', '', '')
    endif
  elseif a:arg_string =~# '^wait$' " ここに新しい条件を追加
    let l:search_pattern = l:wait_search_pattern
    let l:rg_args = ''
  else
    " その他の引数処理（ファイルパスなど）
    " ここでは特に変更しないが、必要であれば a:arg_string をそのまま l:rg_args に設定
  endif

  let l:rg_base_cmd = 'rg -i --vimgrep'
  let l:full_cmd = l:rg_base_cmd . ' --regexp ' . shellescape(l:search_pattern)
  if empty(l:rg_args)
    let l:full_cmd .= ' .'
  else
    let l:full_cmd .= ' ' . l:rg_args
  endif

  echomsg "Executing rg command: " . l:full_cmd

  let l:tmp_file = tempname()
  let l:full_cmd_with_redirect = l:full_cmd . ' > ' . shellescape(l:tmp_file)

  call system(l:full_cmd_with_redirect)

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
