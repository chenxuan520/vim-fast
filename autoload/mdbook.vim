
"======================================================================
"
" termtask
"
" update by chenxuan 2023-01-17 18:58:45
"
"======================================================================

function! s:Travel(file,tab,path) abort
	let tab=a:tab|let path=a:path|let file=a:file
	if g:mdbook_sort|call sort(file,"N")|endif
	for now in file
		let old=now|let now=path.now
		if isdirectory(now)
			let temp=now."/README.md"
			if !filereadable(temp)|let temp=""|endif
			let s:result=s:result.tab."- [".old."](".temp.")\n"
			call s:Travel(readdir(now),tab."\t",now."/")
		else
			if stridx(now,"README.md")!=-1|continue|endif
			if stridx(now,"SUMMARY.md")!=-1|continue|endif
			let name=fnamemodify(now,":t:r")
			let s:result=s:result.tab."- [".name."](".now.")\n"
		endif
	endfor
endfunction

function! s:Init() abort
	let s:result=get(g:,"mdbook_head","#Summary\n\n")
	let g:mdbook_sort=get(g:,"mdbook_sort",1)
endfunction

function! mdbook#MkbookFile() abort
	call s:Init()
	if !isdirectory("./src")|echohl WarningMsg|echo "please back to root dir"|echohl NONE|endif
	cd ./src
	if filereadable("./README.md")|let s:result=s:result."- [README](./README.md)\n"|endif
	call s:Travel(readdir("."),"","./")
	cd ..
	return s:result
endfunction

" command! Mkbook for v in split(mdbook#MkbookFile(),"\n")|call append(line('.')-1,v)|endfor
