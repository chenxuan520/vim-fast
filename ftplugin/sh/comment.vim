" set preparecode in buffernew
func! VimFastSetPreCode()
	call append(line(".")-1,'#!/bin/bash')
	augroup shmode
		au!
		autocmd! BufWritePost *.sh call setfperm(expand('%'),'rwxrwxr-x')
		autocmd! BufDelete *.sh au! shmode|aug! shmode
	augroup END
endfunc

nnoremap <silent><buffer><space>xx :w<cr>:let g:nvim_term_open = 1<cr>:vert term <c-r>=expand('%:p')<cr><cr>
nnoremap <silent><buffer><space>xl 0v$"+y:!<c-r>=@+<cr><cr>
xnoremap <silent><buffer><space>xl "+y:call <sid>ExecShell(getreg('+'))<cr>
func! s:ExecShell(str)
	let temp=tempname()
	let content=["#!/bin/sh"]+split(a:str,'\n')
	call writefile(content, temp)
	call setfperm(temp,"rwxrwxrwx")
	exec ":!".temp
endfunc

" for popup menu
func ShMenu()
	unmenu PopUp
	vnoremenu PopUp.Shell\ Run "+y:call <sid>ExecShell(getreg('+'))<cr>
	nnoremenu PopUp.Shell\ Run :w<cr>:vert term <c-r>=expand('%:p')<cr><cr>
	" visual model
	vnoremenu PopUp.Yank\ Text "+y
	vnoremenu PopUp.Paste\ Text "+p
	" normal model
	nnoremenu PopUp.Paste\ Text "+p
	nnoremenu PopUp.Select\ All ggVG
endfunc
let g:rightmouse_popupmenu['sh']=function("ShMenu")

" set index for shell script
call g:SetTypeIndex("space", 4)
