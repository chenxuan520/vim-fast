
func! ibus#SaveStatus()
	let g:ibus_status=system('ibus engine')
	execute "call system('ibus engine ".g:ibus_normal."')"
endfunc

func! ibus#ReloadStatus()
	let s:now=system('ibus engine')
	if s:now==g:ibus_status
		return
	endif
	execute "call system('ibus engine ".g:ibus_status."')"
endfunc
