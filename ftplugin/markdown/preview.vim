" this file is for preview markdown file
if get(g:,"markdown_simple_disable",0)
	finish
endif

if get(g:,'markdown_preview_disable',0)
	finish
endif

let b:pandoc=get(g:,'markdown_preview_tool','pandoc')
if !executable(b:pandoc)
	echoerr b:pandoc.' not find,please make sure pandoc install'
	finish
endif

let b:browser=get(g:,'markdown_browser','firefox')
if !executable(b:browser)
	echoerr b:browser.' not find'
	finish
endif

func! s:MarkdownPreview()
	let s:html=tempname()
	call system(b:pandoc.' '.expand('%:p').' -t html >'.s:html)
	call system(b:browser.' '.s:html)
	echo s:html
endfunc

nnoremap <silent><buffer><expr><space><space>p <sid>MarkdownPreview()
