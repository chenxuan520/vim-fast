
func! ibus#SaveStatus()
	let s:ibus_normal=get(g:,'ibus_normal','xkb:us::eng')
	let g:ibus_status=system('ibus engine')
	execute "call system('ibus engine ".s:ibus_normal."')"
endfunc

func! ibus#ReloadStatus()
	let s:now=system('ibus engine')
	if s:now==g:ibus_status
		return
	endif
	execute "call system('ibus engine ".g:ibus_status."')"
endfunc
