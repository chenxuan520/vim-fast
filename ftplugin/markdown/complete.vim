let s:suggestions = [
			\{'abbr':'header5'      , 'word': '##### '              , 'menu': ''} ,
			\{'abbr':'header4'      , 'word': '#### '               , 'menu': ''} ,
			\{'abbr':'header3'      , 'word': '### '                , 'menu': ''} ,
			\{'abbr':'header2'      , 'word': '## '                 , 'menu': ''} ,
			\{'abbr':'header1'      , 'word': '# '                  , 'menu': ''} ,
			\{'abbr':'link'         , 'word': '[{text}]({link})'    , 'menu': ''} ,
			\{'abbr':'pic'          , 'word': '![{text}]({link})'   , 'menu': ''} ,
			\{'abbr':'unorder list' , 'word': '- '                  , 'menu': ''} ,
			\{'abbr':'order list'   , 'word': '1. '                 , 'menu': ''} ,
			\{'abbr':'table'        , 'word': '| {text} | {text} |' , 'menu': ''} ,
			\]

func! s:MarkDownComplete()
	let line = getline('.')
	let col = col('.') - 1
	let opt=&completeopt
	let flag=stridx(opt,"noselect")
	if col!=0 && line[col-1] =~ '\S'
		if flag!=-1
			return "/\<c-x>\<c-f>"
		else
			return "/\<c-x>\<c-f>\<c-p>"
		endif
	endif
	call complete(col('.'), s:suggestions)
	if flag!=-1
		return ''
	else
		echom 1
		return "\<c-p>"
	endif
endfunc

" inoremap <buffer>\\ <c-r>=<SID>MarkDownComplete()<cr>
inoremap <buffer>/ <c-r>=<SID>MarkDownComplete()<cr>
