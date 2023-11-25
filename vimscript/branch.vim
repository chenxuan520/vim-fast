" MIT License. Copyright (c) 2013-2021 Bailey Ling et al.
" Plugin: fugitive, gina, lawrencium and vcscommand
" vim: et ts=2 sts=2 sw=2

func! airline#extensions#branch#git_branch(chan,msg) abort
  let g:status_branch_name=a:msg
endfunc
func! airline#extensions#branch#git_branch_nvim(chan,msg,name) abort
  if a:msg[0]!=""|let g:status_branch_name=join(a:msg)|endif
endfunc

function! airline#extensions#branch#get_head()
  if exists("g:status_branch_name")
    return g:status_branch_name
  elseif !exists("s:call_back")||s:call_back==0
    let s:call_back=1
    if !has('nvim')
      call job_start("git rev-parse --abbrev-ref HEAD",{"out_cb":"airline#extensions#branch#git_branch"})
    else
      call jobstart("git rev-parse --abbrev-ref HEAD",{"on_stdout":"airline#extensions#branch#git_branch_nvim"})
    endif
    return ""
  else
    return ""
  endif
endfunction

function! airline#extensions#branch#init(ext)
  call airline#parts#define_function('branch', 'airline#extensions#branch#get_head')
endfunction
