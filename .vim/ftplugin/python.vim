setlocal ts=4 sw=4 sts=4 expandtab
setlocal tw=79 fo=cq wm=0

" strip trailing whitespace
autocmd BufWritePre <buffer> :%s/\s\+$//e

if exists('+colorcolumn')
	setlocal colorcolumn=+1
endif

