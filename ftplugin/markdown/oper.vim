fun! s:AddTitle()
	execute "normal! ^"
	let col = col('.') - 1
	let s:char= getline('.')[col]
	if s:char=='#'
		execute "normal! i#"
	else
		execute "normal! i#\ "
	endif
	execute "normal! $"
endfun

func! s:AddSub()
	execute "normal! ^"
	let col = col('.') - 1
	let s:char= getline('.')[col]
	if s:char=='-'
		execute "normal! 2x"
	else
		execute "normal! i-\ "
	endif
	execute "normal! $"
endfunc

func! s:Refence()
	execute "normal! ^"
	let col = col('.') - 1
	let s:char= getline('.')[col]
	if s:char=='-'
		execute "normal! 2x"
	else
		execute "normal! i>\ "
	endif
	execute "normal! $"
endfunc

func! s:Bold(ch)
	let temp = @s
	norm! gv"sy
	let s:str = @s
	let @s = temp
	let col = col('.')

	execute ":s/".s:str."/".a:ch.s:str.a:ch."/"
	call cursor(line('.'),col+1)
endfunc

func! s:Number()
	let s:get=getchar()
	execute "normal! ^"
	if s:get==38
		execute "normal! 3x"
	elseif s:get==35
		execute "normal! x"
	else
		execute "normal! i".(str2nr(s:get)-48).".\ "
	endif
	execute "normal! $"
endfunc

func! s:Enter()
	execute "normal! ^"
	let s:char=""
	let s:i=col('.')-1
	while s:i<strlen(getline('.'))
		let s:char=s:char . getline('.')[s:i]
		if getline('.')[s:i]<'0'||getline('.')[s:i]>'9'
			break
		endif
		let s:i=s:i+1
	endwhile

	let @s=""
	if s:char=='-'
		let @s='- '
	elseif s:char=='>'
		let @s='> '
	elseif s:char[0]>0&&s:char[0]<=9
		let @s=(s:char+1).". "
	endif

	execute "normal! $"
endfunc

nnoremap <silent><buffer>#     :call <sid>AddTitle()<cr><right>

nnoremap <silent><buffer>-     :call <sid>AddSub()<cr><right>

nnoremap <silent><buffer>&     :call <sid>Number()<cr>

nnoremap <silent><buffer>>     :call <sid>Refence()<cr>

vnoremap <silent><buffer>*     :call <sid>Bold('*')<cr>
vnoremap <silent><buffer><c-b> :call <sid>Bold('**')<cr>
nnoremap <silent><buffer>*     viw:call <sid>Bold('*')<cr>

vnoremap <silent><buffer>`     :call <sid>Bold('`')<cr>
nnoremap <silent><buffer>`     viw:call <sid>Bold('`')<cr>

nnoremap <silent><buffer>o     :call <sid>Enter()<cr>o<c-r>s
inoremap <silent><buffer><c-m> <c-o>:call <sid>Enter()<cr><cr><c-r>s

iab <buffer>! ![]()<left>
iab <buffer>] []()<left>
