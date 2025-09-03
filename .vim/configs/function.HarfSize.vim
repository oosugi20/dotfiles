""
" 選択した数値を半分にする
"
function! HarfSize()
	" 元のレジスタを保存
	let tmp = @@

	" 最後に選択したものをヤンク
	silent normal gvy

	" ヤンクした文字列を置換
	let str = @@
	let str = str / 2

	" 置換した文字列をレジスタに格納
	let @@ = str

	" 格納したレジスタから隣のウィンドウにペースト
	execute 'normal gv""p'

	" レジスタを元に戻す
	let @@ = tmp
endfunction
