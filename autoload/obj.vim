" obj get for self

func! obj#GetIndent(model)
	let model=a:model
	let str=matchstr(getline('.'),"^\\s*")|let line=line('.')|let i=line
	let begin=0|let end=line('.')-1
	while i>=0
		if len(str)>len(matchstr(getline(i),"^\\s*"))|let begin=i+model|break|endif
		let i-=1
	endwhile
	let i=line
	while i<line('$')
		if len(str)>len(matchstr(getline(i),"^\\s*"))|let end=i-model|break|endif
		let i+=1
	endwhile
	call cursor([begin,0])
	execute "normal! V".(end-begin)."j"
endfunc

func! obj#GetSynchl(model)
	let temp=synstack(line('.'),col('.'))
	if len(temp)==0|return|endif|let hl=temp[-1]
	let begin=col('.')-1|let end=col('.')|let line=line('.')
	let list=synstack(line,begin)
	while(begin>=0&&len(list)>0&&list[-1]==hl)
		let list=synstack(line,begin)|let begin-=1
	endwhile
	let list=synstack(line,end)
	while(end<=line('$')&&len(list)>0&&list[-1]==hl)
		let list=synstack(line,end)|let end+=1
	endwhile
	if begin!=col('.')-1|call cursor([line, begin+2])|execute "normal! v".(end-begin-4)."l"
	else|call cursor(line, begin+1)|execute "normal! v".(end-begin-3)."l"
	endif
endfunc

func! obj#GetArgs(model)
	let model=a:model
	let line=line('.')|let col=col('.')|let i=col-1|let now=getline('.')
	let begin=-1|let end=-1|let pos0=-1|let pos1=-1
	let buket=0|let flag=0
	while i>0
		let temp=now[i]|let flag=0
		if temp==')'|let buket+=1|endif
		if temp=='('|let buket-=1|let flag=1|endif
		if (buket>0)||(buket==0&&flag)|let i-=1|continue|endif
		if temp=='('|| temp==','|let begin=temp|let pos0=i|break|endif
		let i-=1
	endwhile
	let i=col|let buket=0|let flag=0
	while i<col('$')
		let temp=now[i]|let flag=0
		if temp=='('|let buket+=1|endif
		if temp==')'|let buket-=1|let flag=1|endif
		if (buket>0)||(buket==0&&flag)|let i+=1|continue|endif
		if temp==')'|| temp==','|let end=temp|let pos1=i|break|endif
		let i+=1
	endwhile
	if model=='i'
		let pos0+=1|let pos1-=1
	else
		if begin=='('|let pos0+=1|else|let pos1-=1|endif
	endif
	call cursor([line,pos0+1])
	let pos1-=pos0|echom end
	execute "normal! v".pos1."l"
endfunc
