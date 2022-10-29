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

	let s:ch=a:ch
	if a:ch=='~~'
		let s:ch='\~\~'
	endif

	execute ":s/".s:str."/".s:ch.s:str.s:ch."/"
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

func! s:Paste()
	if strridx(@+,"https://")==-1&&strridx(@+,"http://")==-1
		execute "normal! \"+p"
		return
	endif
	if strridx(@+,"[]")!=-1
		execute "normal! \"+p"
		return
	endif

	let s:str=""
	if strridx(@+,".png")!=-1||strridx(@+,".jpg")!=-1||
				\strridx(@+,".PNG")!=-1||strridx(@+,".jpeg")!=-1||
				\strridx(@+,".gif")!=-1||strridx(@+,".JPG")!=-1||
				\strridx(@+,".bmp")!=-1||strridx(@+,".JPEG")!=-1
		let s:str="![](".@+.")"
	else
		let s:str="[](".@+.")"
	endif
	let @s=s:str

	execute "normal! \"sp"
	execute "normal! F]"
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

nnoremap <silent><buffer>#         : call <sid>AddTitle()<cr><right>

nnoremap <silent><buffer>-         : call <sid>AddSub()<cr><right>

nnoremap <silent><buffer>&         : call <sid>Number()<cr>

nnoremap <silent><buffer><leader>> : call <sid>Refence()<cr>

vnoremap <silent><buffer><leader>~ : call <sid>Bold('~~')<cr>

vnoremap <silent><buffer>*     :call <sid>Bold('*')<cr>
vnoremap <silent><buffer><c-b> :call <sid>Bold('**')<cr>
nnoremap <silent><buffer>*     viw:call <sid>Bold('*')<cr>

vnoremap <silent><buffer>`     :call <sid>Bold('`')<cr>
vnoremap <silent><buffer><c-i> :call <sid>Bold('`')<cr>
nnoremap <silent><buffer>`     viw:call <sid>Bold('`')<cr>

nnoremap <silent><buffer>o     :call <sid>Enter()<cr>o<c-r>s
inoremap <silent><buffer><c-m> <c-o>:call <sid>Enter()<cr><cr><c-r>s

nnoremap <silent><buffer><leader><leader>p :call <sid>Paste()<cr>

nnoremap <silent><buffer>> >>
nnoremap <silent><buffer>< <<

vnoremenu <silent> PopUp.Bold\ Text   : call <sid>Bold('**')<cr>
vnoremenu <silent> PopUp.Italic\ Text : call <sid>Bold('*')<cr>
vnoremenu <silent> PopUp.Line\ Text   : call <sid>Bold('~~')<cr>
vnoremenu <silent> PopUp.Code\ Text   : call <sid>Bold('`')<cr>

iab <buffer>! ![]()<left>
iab <buffer>] []()<left>
