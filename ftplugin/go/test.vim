
" for gopl coc-go
if exists('g:did_coc_loaded')
	" test
	nnoremap <buffer><space>xe :CocCommand go.test.generate.exported<cr>
	nnoremap <buffer><space>xf :call <sid>TestFunc()<cr>
	nnoremap <buffer><space>xn :CocCommand go.test.generate.file<cr>
	nnoremap <buffer><space>xg :CocCommand go.test.toggle<cr>
	" tag
	nnoremap <buffer><space>xa :CocCommand go.tags.add.prompt<cr>
	nnoremap <buffer><space>xd :CocCommand go.tags.remove.prompt<cr>
	" auto format
	augroup GoFormat
		autocmd!
		autocmd BufWritePre *.go silent! call CocAction('format')
	augroup END
endif

function! s:FindGoPackageName()
	let pattern = '\v^\s*package\s+(\w+)'
	let line = search(pattern, 'n')
	if line != 0|return substitute(matchstr(getline(line), pattern), '^\s*package\s*', '', '')
	else|return ''|endif
endfunction

func! s:JsonRun(name)
	if a:name==""|return|endif
	let str=[]|let s:name=expand("%:p:h")."/json_test.go"
	let packagename=s:FindGoPackageName()
	if packagename==''|let packagename=split(expand('%:p'),'/')[-2]|endif
	call add(str,'package ' . packagename)
	let str+=["import (",'	"testing"','	"fmt"','	"encoding/json"',')']
	let str+=['func TestJson(t *testing.T) {','	temp:='.a:name.'{}']
	let str+=['	data, _ := json.MarshalIndent(temp, "", "  ")','	fmt.Println(string(data))','}']
	call writefile(str,s:name)
	if has('nvim')
		let g:nvim_term_open=1
		let path=expand("%:p:h")
		vsp|enew
		call termopen("go test -v -run TestJson",{"cwd":path,"on_exit":"JsonCloseCbNvim"})
	else
		vert call term_start("go test -v -run TestJson",{"cwd":expand("%:p:h"),"close_cb":"JsonCloseCb"})
	endif
endfunc

func! JsonCloseCb(chan)
	call delete(s:name)|echo "Run ok"
endfunc
func! JsonCloseCbNvim(chan,exitcode,event)
	call delete(s:name)|echo "Run ok"
endfunc

func! s:CodeRun(testfunc)
	write
	let s:name=expand('%:p')
	if match(expand('%'),"test")==-1
		if a:testfunc==''
			if !has('nvim')
				exec ":vert term go run ".expand('%:p')
			else
				let path=expand("%:p")
				let g:nvim_term_open=1
				vsp|enew
				exec ":term go run ".path
			endif
		else
			CocCommand go.test.generate.function
		endif
	else
		if a:testfunc==''
			exec ":vert term go test -v ".expand('%:p:h')
		else
			if !has('nvim')
				vert call term_start("go test -v -run ". a:testfunc,{"cwd":expand("%:p:h")})
			else
				let path=expand("%:p:h")
				vsp|enew
				let g:nvim_term_open=1
				call termopen("go test -v -run ". a:testfunc,{"cwd":path})
			endif
		endif
	endif
endfunc

func! s:TestFunc()
	if match(expand('%'),"test")==-1
		CocCommand go.test.generate.function
	else
		call <sid>CodeRun(CocAction('getCurrentFunctionSymbol'))
	endif
endfunc

nnoremap <buffer><space>xx :call <sid>CodeRun('')<cr>
xnoremap <buffer><space>xf :<c-u>execute "normal! gv\"sy"<cr>:call <sid>CodeRun("^".@s."$")<cr>
nnoremap <buffer><space>xj :call <sid>JsonRun(input("input struct name:"))<cr>
xnoremap <buffer><space>xj :<c-u>execute "normal! gv\"sy"<cr>:call <sid>JsonRun(@s)<cr>

" for popup menu
func GoMenu()
	unmenu PopUp
	vnoremenu PopUp.Go\ Run\ Test :<c-u>execute "normal! gv\"sy"<cr>:call <sid>CodeRun("^".@s."$")<cr>
	vnoremenu PopUp.Go\ Json :<c-u>execute "normal! gv\"sy"<cr>:call <sid>JsonRun(@s)<cr>

	nnoremenu PopUp.Go\ Run\ File :call <sid>CodeRun('')<cr>
	nnoremenu PopUp.Go\ Json :call <sid>JsonRun(input("input struct name:"))<cr>
	nnoremenu PopUp.Go\ Toggle :CocCommand go.test.toggle<cr>
	call MouseConfig()
endfunc
let g:rightmouse_popupmenu['go']=function("GoMenu")

command! GoLines exec "!golines -w ".expand("%d")
