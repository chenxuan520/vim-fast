
func! VimFastSetPreCode()
	call append(line(".")-1,'<!DOCTYPE html>')
	call append(line(".")-1,'<html lang="en">')
	call append(line(".")-1,'<head>')
	call append(line(".")-1,'	<meta charset="UTF-8">')
	call append(line(".")-1,'	<meta name="viewport" content="width=device-width, initial-scale=1.0">')
	call append(line(".")-1,'	<title>Document</title>')
	call append(line(".")-1,'</head>')
	call append(line(".")-1,'<body>')
	call append(line(".")-1,'</body>')
	call append(line(".")-1,'</html>')
endfunc

" open in default browser
let b:browser=get(g:,'default_browser','firefox')

if expand('%:e')=='html'
	nnoremap <silent><buffer><space><space>p :w<cr>:call system(b:browser.' '.expand('%:p'))<cr>
endif
