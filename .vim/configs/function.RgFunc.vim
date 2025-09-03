if exists('*g:RgFunc')
  delfunction g:RgFunc
endif

"!
" g:RgFunc
" rg (ripgrep) を使った検索関数。
" 検索結果: クイックフィックスウィンドウに表示。
"
" @remarks
"   - 常に大文字小文字を区別しない検索 (-i) を適用。
"   - rg コマンドのオプション（例: --encoding sjis）を解析し、適用。
"
" @param {string} a:arg_string - rg コマンド引数（オプションと検索パターンを含む）。
"
function! g:RgFunc(arg_string)
  setlocal grepformat=%f:%l:%c:%m

  let l:rg_base_cmd = 'rg --vimgrep -i'
  let l:rg_options = []
  let l:search_pattern_parts = []

  let l:args = split(a:arg_string)
  let l:i = 0
  while l:i < len(l:args)
    let l:arg = l:args[l:i]
    if l:arg =~# '^--'
      if l:i + 1 < len(l:args) && l:args[l:i + 1] !~# '^--'
        call extend(l:rg_options, [shellescape(l:arg), shellescape(l:args[l:i + 1])])
        let l:i += 2
      else
        call add(l:rg_options, shellescape(l:arg))
        let l:i += 1
      endif
    else
      call add(l:search_pattern_parts, l:arg)
      let l:i += 1
    endif
  endwhile

  if empty(l:search_pattern_parts)
    echohl WarningMsg | echom "検索パターンを指定してください。" | echohl None
    return
  endif

  let l:search_pattern = shellescape(join(l:search_pattern_parts, ' '))
  let l:full_cmd = l:rg_base_cmd . ' ' . join(l:rg_options, ' ') . ' ' . l:search_pattern

  echom "実行コマンド: " . l:full_cmd

  let l:tmpfile = tempname()
  call system(l:full_cmd . ' > ' . shellescape(l:tmpfile) . ' 2>/dev/null')

  if filereadable(l:tmpfile) && getfsize(l:tmpfile) > 0
    execute 'cfile ' . fnameescape(l:tmpfile)
    copen
  else
    echohl WarningMsg | echom "一致なし、または rg 実行エラー。" | echohl None
  endif

  if filereadable(l:tmpfile)
    call delete(l:tmpfile)
  endif
endfunction
