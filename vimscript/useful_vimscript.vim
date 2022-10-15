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
