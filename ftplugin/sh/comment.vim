" set preparecode in buffernew
func FtpluginSetPreCode()
	call append(line(".")-1,'#!/bin/bash')
endfunc
