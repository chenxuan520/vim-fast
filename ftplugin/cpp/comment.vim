" fast add comment for cpp
func SetComment()
       call append(line("."),'/***********************************************')
       call append(line(".")+1,'* Author: chenxuan-1607772321@qq.com')
       call append(line(".")+2,'* change time:'.strftime("%Y-%m-%d %H:%M:%S"))
       call append(line(".")+3,'* description:')
       call append(line(".")+4,'* example: ')
       call append(line(".")+5,'***********************************************/')
endfunc
nnoremap <Leader>c :call SetComment()<CR>
