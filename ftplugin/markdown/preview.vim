" this file is for preview markdown file
if get(g:,"markdown_simple_disable",0)
	finish
endif

if get(g:,'markdown_preview_disable',0)
	finish
endif

let b:pandoc=get(g:,'markdown_preview_tool','pandoc')

" open in default browser
if has('mac')
	" mac
	let b:browser=get(g:,'default_browser','open')
elseif has('unix')
	" linux
	let b:browser=get(g:,'default_browser','xdg-open')
elseif has('win32') || has('win64')
	" windows
	let b:browser=get(g:,'default_browser','start')
else
	echom 'not support this system'
	finish
endif

" be dark model
let b:header='<style type="text/css" media="screen"> @media (prefers-color-scheme: dark) { html { background-color: #1E1F21; color: #EEEFF1; } a { color: #EEEFF1; } a:visited { color: #EEEFF1; } blockquote p: { color: #606060; } hr { background-color: #EEEFF1; } } </style>'

let g:mdFileMp={}

func! s:MarkdownPreview()
	if !executable(b:pandoc)
		echom b:pandoc.' not find,please make sure pandoc install'
		return
	endif

	if !executable(b:browser)
		echom b:browser.' not find'
		return
	endif

	let s:fileName=expand('%:p')
	let s:html=''
	if has_key(g:mdFileMp,s:fileName)
		let s:html=g:mdFileMp[s:fileName]
	else
		let s:html=tempname()
		let s:html=s:html.".html"
		let g:mdFileMp[s:fileName]=s:html
	endif

	write
	if b:header!=''
		call system('echo "'.b:header.'" > '.s:html)
	endif
	echo 'Turn md to html,please wait...'
	call system(b:pandoc.' '.expand('%:p').' -t html >>'.s:html)
	if has('nvim')
		call jobstart(b:browser.' '.s:html)
	else
		call job_start(b:browser.' '.s:html)
	endif
	echo s:html
endfunc

nnoremap <silent><buffer><expr><space><space>p <sid>MarkdownPreview()
