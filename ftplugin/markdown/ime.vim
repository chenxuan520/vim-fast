"ibus no exist
if !executable('ibus')
	finish
endif
"ibus isn't running
if system('ibus engine') =~ 'No engine is set'
	finish
endif
let g:ibus_normal=system('ibus engine')
let g:ibus_status=''
let g:ibus_enable=get(g:,'ibus_enable',1)
if g:ibus_enable
	augroup ibus
		au!
		au InsertEnter *.md call ibus#ReloadStatus()
		au InsertLeave *.md call ibus#SaveStatus()
		au BufDelete   *.md au! ibus|call ibus#ReloadStatus()|let g:AutoPairsMapBS=1
	augroup END
endif
