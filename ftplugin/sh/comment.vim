" set preparecode in buffernew
func! VimFastSetPreCode()
	call append(line(".")-1,'#!/bin/bash')
	augroup shmode
		au!
		autocmd! BufWritePost *.sh call setfperm(expand('%'),'rwxrwxr--')
		autocmd! BufDelete *.sh au! shmode|aug! shmode
	augroup END
endfunc
