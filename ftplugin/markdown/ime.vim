
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
if system('ibus engine') =~ 'No engine is set'
	finish
endif
let g:ibus_normal=system('ibus engine')
let g:ibus_status=''
if g:ibus_enable
	augroup ibus
		au!
		au InsertEnter *.md call ibus#ReloadStatus()
		au InsertLeave *.md call ibus#SaveStatus()
		au BufDelete   *.md call ibus#ReloadStatus()|au! ibus
	augroup END
endif
