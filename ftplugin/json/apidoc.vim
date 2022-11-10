
if expand('%')!='apidoc.json'
	finish
endif

command! -buffer ApiDocJson  :call apidoc#ApiJson()
