
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
		autocmd BufWritePre *.go call CocAction('format')
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
	vert call term_start("go test -v -run TestJson",{"cwd":expand("%:p:h"),"close_cb":"JsonCloseCb"})
endfunc
func! JsonCloseCb(chan)
	call delete(s:name)|echo "Run ok"
endfunc

func! s:CodeRun(testfunc)
	write
	let s:name=expand('%:p')
	if match(expand('%'),"test")==-1
		exec ":vert term go run ".expand('%:p')
	else
		if a:testfunc==''
			exec ":vert term go test -v ".expand('%:p:h')
		else
			if !has('nvim')
				vert call term_start("go test -v -run ". a:testfunc,{"cwd":expand("%:p:h")})
			else
				vsp
				call termopen("bash -c 'go test -v -run ". a:testfunc.";bash'",{"cwd":expand("%:p:h")})
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
