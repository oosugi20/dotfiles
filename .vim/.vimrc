set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis,cp932,iso-2022-jp,euc-jp


" .vimrcのディレクトリをruntimepathに追加
let s:dotvim_dir = fnamemodify($MYVIMRC, ':h')
execute 'set rtp+=' . s:dotvim_dir . '/after'
execute 'set rtp^=' . s:dotvim_dir


"!
" Load Configs
"
function! s:LoadConfig(filename)
	let src = $HOME . "/.vim/configs/" . a:filename . ".vim"
	if (filereadable(src))
		execute "source " . src
	endif
endfunction


call s:LoadConfig('base')
call s:LoadConfig('bundle')
call s:LoadConfig('bundle.lightline')
call s:LoadConfig('bundle.fuf')
call s:LoadConfig('bundle.ale')
call s:LoadConfig('bundle.indent-guides')
"call s:LoadConfig('bundle.browserreload')
"call s:LoadConfig('bundle.align')
call s:LoadConfig('bundle.javascript')

call s:LoadConfig('search')
call s:LoadConfig('view')
call s:LoadConfig('function.AgFunc')
call s:LoadConfig('function.AgTodoFunc')
call s:LoadConfig('function.RgFunc')
call s:LoadConfig('function.RgTodoFunc')
call s:LoadConfig('function.HarfSize')
call s:LoadConfig('commands')
call s:LoadConfig('commands.ag')
call s:LoadConfig('commands.rg')
call s:LoadConfig('commands.imgcat')
call s:LoadConfig('gemini')
call s:LoadConfig('keyremap')


" vimrc-local: 現在開いているファイルのディレクトリ、またはその親ディレクトリに存在する
" .vimrc.local ファイルを自動読み込みする設定。
" プロジェクト固有の設定適用に利用（例: SJIS/CP932などのエンコーディング）。
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
