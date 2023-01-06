
let s:last_oper=0
func! cursorline#NextMove(seq)
	if mode() == 'c' && stridx('/?', getcmdtype()) < 0
		return a:seq
	endif
	silent! autocmd! slash
	set hlsearch
	map <expr> <plug>(cursor-trailer) <sid>trailer()
	let s:last_oper=1
	return a:seq.s:trailer()
endfunc

func! s:trailer()
	augroup slash
		autocmd!
		autocmd CursorMoved,CursorMovedI * set nohlsearch | autocmd! slash
	augroup END
	return ""
endfunc

func! cursorline#FindWord(seq,str)
	set hlsearch
	return a:seq."``"
endfunc

func! cursorline#VisualFind()
	set hlsearch
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
	let @s=temp
endfunc

function! cursorline#highlight() abort
  if !get(g:, 'cursorword_highlight', 1) | return | endif
  highlight CursorWord0 term=underline cterm=underline gui=underline
  redir => out
    silent! highlight CursorLine
  redir END
  let highlight = 'highlight CursorWord1 term=underline cterm=underline gui=underline'
  execute highlight matchstr(out, 'ctermbg=#\?\w\+') matchstr(out, 'guibg=#\?\w\+')
endfunction

function! cursorline#matchadd(...) abort
	if get(g:,"cursorword_highlight",0)==0
		call cursorline#highlight()
		let g:cursorword_highlight=1
	endif
	let enable = get(b:, 'cursorword', get(g:, 'cursorword', 1)) && !has('vim_starting')
	if !enable && !get(w:, 'cursorword_match') | return | endif
	let i = (a:0 ? a:1 : mode() ==# 'i' || mode() ==# 'R') && col('.') > 1
	let line = getline('.')
	let linenr = line('.')
	let word = matchstr(line[:(col('.')-i-1)], '\k*$') . matchstr(line[(col('.')-i-1):], '^\k*')[1:]
	if get(w:, 'cursorword_state', []) ==# [ linenr, word, enable ] | return | endif
	let w:cursorword_state = [ linenr, word, enable ]
	if get(w:, 'cursorword_match')
		silent! call matchdelete(w:cursorword_id0)
		silent! call matchdelete(w:cursorword_id1)
	endif
	let w:cursorword_match = 0
	if !enable || word ==# '' || len(word) !=# strchars(word) && word !~# s:alphabets || len(word) > 1000 | return | endif
	let pattern = '\<' . escape(word, '~"\.^$[]*') . '\>'
	let w:cursorword_id0 = matchadd('CursorWord0', pattern, -100)
	let w:cursorword_id1 = matchadd('CursorWord' . &l:cursorline, '\%' . linenr . 'l' . pattern, -100)
	let w:cursorword_match = 1
endfunction

function! cursorline#Disable()
	if get(w:, 'cursorword_match')
		silent! call matchdelete(w:cursorword_id0)
		silent! call matchdelete(w:cursorword_id1)
	endif
	let w:cursorword_match = 0
endfunction
