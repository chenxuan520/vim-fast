
"======================================================================
"
" termtask
"
" Created by chenxuan on 2022.11.02
"
"======================================================================

if get(g:,"markdown_simple_disable",0)
	finish
endif

let b:indent=get(g:,"markdown_simple_indent",nr2char(9))
let b:table_flag=get(g:,"markdown_simple_table_flag",";;")

let g:AutoPairsMapBS=0
augroup mdpair
	au!
	au BufLeave *.md let g:AutoPairsMapBS=1|au! mdpair
augroup END

func! s:AddTitle()
	let s:old=col('.')-1

	execute "normal! ^"
	let col = col('.') - 1
	let s:char= getline('.')[col]
	if s:char=='#'
		execute "normal! i#"
	else
		execute "normal! i#\ "
	endif

	execute "normal! 0".s:old."l"
endfunc

func! s:AddSub()
	let s:old=col('.')-1

	execute "normal! ^"
	let col = col('.') - 1
	let s:char= getline('.')[col]
	if s:char=='-'
		execute "normal! 2x"
		let s:old-=3
	else
		execute "normal! i-\ "
		let s:old+=1
	endif

	if s:old>0
		execute "normal! 0".s:old."l"
	endif
endfunc

func! s:Code()
	call append(line('v')-1,'```')
	call append(line('.'),'```')
endfunc

func! s:Refence()
	let s:old=col('.')-1

	execute "normal! ^"
	let col = col('.') - 1
	let s:char= getline('.')[col]
	if s:char=='-'
		execute "normal! 2x"
	else
		execute "normal! i>\ "
	endif

	execute "normal! 0".s:old."l"
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
	let s:old=col('.')-1

	let s:get=getchar()
	execute "normal! ^"
	if s:get==38
		execute "normal! 3x"
		let s:old=s:old-3
	elseif s:get==35
		execute "normal! x"
		let s:old=s:old-1
	else
		execute "normal! i".(str2nr(s:get)-48).".\ "
	endif

	execute "normal! 0".s:old."l"
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

func! g:VimFastEnter(ch)
	let s:str=getline('.')
	let s:char=""
	let s:i=0

	for s:ch in str2list(s:str)
		if s:ch!=char2nr(' ')&&s:ch!=9
			break
		endif
		let s:i=s:i+1
	endfor

	while s:i<strlen(getline('.'))
		let s:char=s:char . getline('.')[s:i]
		if getline('.')[s:i]<'0'||getline('.')[s:i]>'9'
			break
		endif
		let s:i=s:i+1
	endwhile

	if s:char=='|'&&getline('.')[col('$')-2]!='|'
		call setline(line('.'),getline('.').'|')
	endif

	let @s=""
	if a:ch=='io'
		let @s=b:indent
		return "\<cr>".@s
	elseif a:ch=='ke'
		let @s=b:indent
	endif

	if s:char=='-'
		let @s=@s.'- '
	elseif s:char=='>'
		let @s='> '
	elseif s:char=='|'
		if exists('g:plugs')&&has_key(g:plugs,'tabular')
			execute ":Tabularize /|"
			execute "normal! $l"
		endif
		let @s='|'
	elseif s:char[0]>0&&s:char[0]<=9
		let @s=(s:char+1).". "
	else
		let @s=""
	endif

	return "\<cr>".@s
endfunc

func! s:Backspace()
	let s:str=getline('.')
	let s:char=""
	let s:i=col('.')-2
	let s:delete=1
	let s:tab=0

	while s:i>0
		if s:str[s:i]==nr2char(9)
			let s:tab=1
			break
		elseif s:str[s:i]==' '||s:str[s:i]=='-'||s:str[s:i]=='|'||
					\s:str[s:i]=='>'||s:str[s:i]=='.'||
					\(s:str[s:i]>='0'&&s:str[s:i]<='9')
			let s:delete+=1
		else
			break
		endif
		let s:i-=1
	endwhile

	let s:result=''

	if s:i==0&&s:str[s:i]==nr2char(9)
		let s:delete-=1
	endif
	if s:tab
		let s:delete-=1
	endif

	let s:result=s:result."\<bs>"
	if s:delete>0
		while s:delete>1
			let s:result=s:result."\<bs>"
			let s:delete-=1
		endwhile
		return s:result
	else
		return s:result
	endif
	return
endfunc

nnoremap <silent><buffer>#         : call <sid>AddTitle()<cr><right>

nnoremap <silent><buffer>-         : call <sid>AddSub()<cr><right>

nnoremap <silent><buffer>&         : call <sid>Number()<cr>

nnoremap <silent><buffer><leader>> : call <sid>Refence()<cr>

vnoremap <silent><buffer><leader>~ : call <sid>Bold('~~')<cr>

vnoremap <silent><buffer>*     :call <sid>Bold('*')<cr>
vnoremap <silent><buffer><c-i> :call <sid>Bold('*')<cr>
vnoremap <silent><buffer><c-b> :call <sid>Bold('**')<cr>
nnoremap <silent><buffer>*     viw:call <sid>Bold('*')<cr>

vnoremap <silent><buffer>`     :call <sid>Bold('`')<cr>
nnoremap <silent><buffer>`     viw:call <sid>Bold('`')<cr>

vnoremap <silent><buffer><leader>` :<c-u>call <sid>Code()<cr>

nnoremap <silent><buffer>o         :call g:VimFastEnter('o')<cr>o<c-r>s
nnoremap <silent><buffer><leader>o :call g:VimFastEnter('io')<cr>o<c-r>s

inoremap <silent><buffer><c-m>      <c-r>=g:VimFastEnter('')<cr>
inoremap <silent><buffer>\<cr>      <c-r>=g:VimFastEnter('io')<cr>
inoremap <silent><buffer><kenter>   <c-r>=g:VimFastEnter('ke')<cr>

inoremap <expr><silent><buffer><c-\>  <sid>Backspace()
inoremap <expr><silent><buffer><bs>   <sid>Backspace()

inoremap <silent><buffer>- -<space>
inoremap <silent><buffer>> ><space>
for s:i in [1,2,3,4,5,6,7,8,9]
	execute "inoremap <silent><buffer>".s:i.". ".s:i.". "
endfor

if b:table_flag!=""
	execute ":inoremap <silent><buffer>".b:table_flag." \\|"
endif

nnoremap <silent><buffer><leader><leader>p :call <sid>Paste()<cr>
nnoremap <silent><buffer>"+p :call <sid>Paste()<cr>

nnoremap <silent><buffer>> >>
nnoremap <silent><buffer>< <<

vnoremenu <silent> PopUp.Bold\ Text   : call <sid>Bold('**')<cr>
vnoremenu <silent> PopUp.Italic\ Text : call <sid>Bold('*')<cr>
vnoremenu <silent> PopUp.Line\ Text   : call <sid>Bold('~~')<cr>
vnoremenu <silent> PopUp.Code\ Text   : call <sid>Bold('`')<cr>

iab <buffer>! ![]()<left>
iab <buffer>] []()<left>

set conceallevel=3
