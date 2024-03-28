func! VimFastSetPreCode()
	call append( line(".")-1,'" this config is for project' )
	call append( line(".")-1,'' )
	call append( line(".")-1,'" name     : the task name' )
	call append( line(".")-1,'" mode     : (new version add)the mode of task,quickfix,term,workflow,shell')
	call append( line(".")-1,'"            workflow first exec task [begin],and if first exec is ok,exec task [end]')
	call append( line(".")-1,'"            use workflow mode,first exec must be quickfix')
	call append( line(".")-1,'"            workflow mode option is only with:begin,next,name,key')
	call append( line(".")-1,'"            shell model only run in backgroud and show nothing which is always success')
	call append( line(".")-1,'" command  : the command to run' )
	call append( line(".")-1,'" path     : path can be termtask#Term_get_dir() stand for git,expand("%:p:h") for current dir' )
	call append( line(".")-1,'"            expand("%") for current buffer all path,expand("%:t") for current buffer name' )
	call append( line(".")-1,'"            use . can connect str' )
	call append( line(".")-1,'" close    : term and quickfix after command status' )
	call append( line(".")-1,'"            0 noclose' )
	call append( line(".")-1,'"            1 close' )
	call append( line(".")-1,'"            2 if command is not ok,will stay open,or close,' )
	call append( line(".")-1,'"            3 do not open first,after finish,open it(invalid for nvim)' )
	call append( line(".")-1,'" type     : pos of task tab or vsplit or split' )
	call append( line(".")-1,'" key      : key can bound map to make task run' )
	call append( line(".")-1,'" script   : pre,end script is vimscript,use | to divide' )
	call append( line(".")-1,'"            can define function,and make end_script call func to do it(recommand way)' )
	call append( line(".")-1,'"            can use g:asyncrun_code==0 to judge task if success' )
	call append( line(".")-1,"let s:root=termtask#Term_get_dir().'/'" )
	call append( line(".")-1,"let s:pwd=expand('%:p:h')" )
	call append( line(".")-1,"let g:Term_project_task=[" )
	call append( line(".")-1,"			\\{" )
	call append( line(".")-1,"			\\'name'       : 'build'," )
	call append( line(".")-1,"			\\'command'    : 'g++ -O2 '.expand('%')," )
	call append( line(".")-1,"			\\'mode'       : 'quickfix'," )
	call append( line(".")-1,"			\\'path'       : s:root," )
	call append( line(".")-1,"			\\'close'      : 2," )
	call append( line(".")-1,"			\\'type'       : 'split'," )
	call append( line(".")-1,"			\\'key'        : '\\1'," )
	call append( line(".")-1,"			\\'pre_script' : ''," )
	call append( line(".")-1,"			\\'end_script' : ''," )
	call append( line(".")-1,"			\\}," )
	call append( line(".")-1,"			\\{" )
	call append( line(".")-1,"			\\'name'       : 'run'," )
	call append( line(".")-1,"			\\'command'    : './a.out'," )
	call append( line(".")-1,"			\\'mode'       : 'term'," )
	call append( line(".")-1,"			\\'path'       : s:root," )
	call append( line(".")-1,"			\\'close'      : 0," )
	call append( line(".")-1,"			\\'type'       : 'vsplit'," )
	call append( line(".")-1,"			\\'key'        : '\\2'," )
	call append( line(".")-1,"			\\}," )
	call append( line(".")-1,"			\\{")
	call append( line(".")-1,"			\\'name'       : 'workflow',")
	call append( line(".")-1,"			\\'mode'       : 'workflow',")
	call append( line(".")-1,"			\\'begin'      : 'build',")
	call append( line(".")-1,"			\\'next'       : 'run',")
	call append( line(".")-1,"			\\'key'        : '\\3'," )
	call append( line(".")-1,"			\\},")
	call append( line(".")-1,"			\\{" )
	call append( line(".")-1,"			\\'name'       : 'debug'," )
	call append( line(".")-1,"			\\'command'    : 'g++ -g '.expand('%')," )
	call append( line(".")-1,"			\\'mode'       : 'quickfix'," )
	call append( line(".")-1,"			\\'path'       : s:pwd," )
	call append( line(".")-1,"			\\'close'      : 1," )
	call append( line(".")-1,"			\\'type'       : 'split'," )
	call append( line(".")-1,"			\\'key'        : '\\4'," )
	call append( line(".")-1,"			\\'end_script' : 'cclose|packadd termdebug|Termdebug a.out'," )
	call append( line(".")-1,"			\\}," )
	call append( line(".")-1,"			\\]" )
endfunc

if expand('%:t')=='.config.vim'
	augroup TaskLoad
		au!
		au BufWritePost .config.vim exec "source ". expand('%:p')
		au BufDelete .config.vim au! TaskLoad
	augroup END
endif

" for popup menu
func VimMenu()
	unmenu PopUp
	vnoremenu PopUp.Vims\ Run "+y:<c-r>=@+<cr><cr>
	nnoremenu PopUp.Vims\ Source :source <c-r>=expand("%")<cr><cr>
	call MouseConfig()
endfunc
let g:rightmouse_popupmenu['vim']=function("VimMenu")
