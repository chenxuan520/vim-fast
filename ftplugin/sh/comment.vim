" set preparecode in buffernew
func VimFastSetPreCode()
	call append(line(".")-1,'#!/bin/bash')
endfunc
