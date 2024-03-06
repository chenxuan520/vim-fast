" 使用tab进行移出括号
noremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ CheckBackspace() ? "\<TAB>" :
            \ CheckPair()? "\<right>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckPair() abort
    return getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getlin
endfunction
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" uninstall plug function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:deregister(repo)
	let repo = substitute(a:repo, '[\/]\+$', '', '')
	let name = fnamemodify(repo, ':t:s?\.git$??')
	call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)

" like clever-f (experimental) {{{
nnoremap <silent>f :call <sid>CleverF('f')<cr>
nnoremap <silent>F :call <sid>CleverF('F')<cr>
nnoremap <silent>; :call <sid>CleverF(';')<cr>
let s:cleverf_hl_arr=[]
let s:cleverf_pos_arr=[]
let s:cleverf_find_now=0
let s:cleverf_find_line=-1
let s:cleverf_find_last=0
func! s:CleverFDeleteHl() abort
	if s:cleverf_find_now==getline(line("."))[col(".")-1]&&s:cleverf_find_line==line('.')
		return
	endif
	for hl in s:cleverf_hl_arr
		call matchdelete(hl)
	endfor
	let s:cleverf_hl_arr=[]
	let s:cleverf_pos_arr=[]
	let s:cleverf_find_now=0
	let s:cleverf_find_line=-1
	au! CleverF
endfunc
func! s:CleverF(ch) abort
	let line=getline('.')
	let line_num=line('.')
	let col=col('.')
	if type(s:cleverf_find_now)==0&&a:ch==#'F'
		call feedkeys('F','n')
		return
	endif
	if type(s:cleverf_find_now)!=0
		let i=0
		if a:ch!=#'F'
			while i<len(s:cleverf_pos_arr)&&col>s:cleverf_pos_arr[i]
			let i=i+1
		endwhile
		else
			let i=len(s:cleverf_pos_arr)-1
			while i>0&&col-1<=s:cleverf_pos_arr[i]
				let i=i-1
			endwhile
		endif
		if i>=0&&i<len(s:cleverf_pos_arr)
			call cursor(line('.'),s:cleverf_pos_arr[i]+1)
		endif
		return
	endif
	if a:ch==#'f'
		let ch=nr2char(getchar())
	elseif a:ch==#';'
		let ch=s:cleverf_find_last
	endif
	let s:cleverf_pos_arr=[]
	let pos=stridx(line,ch,col)
	while pos!=-1
		call add(s:cleverf_pos_arr,pos)
		let pos=stridx(line,ch,pos+1)
	endwhile
	if len(s:cleverf_pos_arr)==0
		return
	endif
	for now_pos in s:cleverf_pos_arr
		let tmp = matchaddpos("incsearch", [[line_num,now_pos+1,1]])
		call add(s:cleverf_hl_arr,tmp)
	endfor
	call cursor(line('.'), s:cleverf_pos_arr[0]+1)
	let s:cleverf_find_now=ch
	let s:cleverf_find_line=line_num
	let s:cleverf_find_last=ch
	augroup CleverF
		au!
		autocmd! CursorMoved * call <sid>CleverFDeleteHl()
	augroup END
endfunc
" }}}
