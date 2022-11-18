" obj get for self

func! obj#GetArgc(one,two)
	let s:pos=col('.')|let s:begin=''|let s:end=''|let s:i=s:pos-1|let s:one=a:one|let s:two=a:two
	while s:i>0
		if getline('.')[s:i]=='('||getline('.')[s:i]==','
			let s:begin=getline('.')[s:i]
			break
		endif
		let s:i-=1
	endwhile
	let s:i=s:pos
	while s:i<col('$')
		if getline('.')[s:i]==')'||getline('.')[s:i]==','
			let s:end=getline('.')[s:i]
			if s:begin==','&&s:two=='f'&&s:end!=','
				let s:one='F'
			endif
			if s:end==')'
				let s:two='t'
			endif
			break
		endif
		let s:i+=1
	endwhile
	if s:begin!=''&&s:end!=''
		execute "normal! ".s:one.s:begin."v".s:two.s:end
	endif
endfunc
