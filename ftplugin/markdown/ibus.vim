
if get(g:,"markdown_simple_disable",0)
	finish
endif

" ibus enable
let g:ibus_enable=get(g:,'ibus_enable',0)
if !g:ibus_enable
	finish
endif
"ibus no exist
if !executable('ibus')
	finish
endif
"ibus isn't running
" if system('ibus engine') =~ 'No engine is set'
" 	finish
" endif
" let g:ibus_normal=system('ibus engine')

func! s:ibusSaveStatus()
	let s:ibus_normal=get(g:,'ibus_normal','xkb:us::eng')
	let g:ibus_status=system('ibus engine')
	execute "call system('ibus engine ".s:ibus_normal."')"
endfunc

func! s:ibusReloadStatus()
	let s:now=system('ibus engine')
	if s:now==g:ibus_status
		return
	endif
	execute "call system('ibus engine ".g:ibus_status."')"
endfunc

let g:ibus_status=''
if g:ibus_enable
	augroup ibus
		au!
		au InsertEnter *.md call s:ibusReloadStatus()
		au InsertLeave *.md call s:ibusSaveStatus()
		au BufDelete   *.md call s:ibusReloadStatus()|au! ibus
	augroup END
endif
