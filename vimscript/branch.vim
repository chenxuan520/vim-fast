" MIT License. Copyright (c) 2013-2021 Bailey Ling et al.
" Plugin: fugitive, gina, lawrencium and vcscommand
" vim: et ts=2 sts=2 sw=2

func! airline#extensions#branch#git_branch(chan,msg) abort
  let list=split(a:msg)
  if len(list)>1
    let g:status_branch_name=list[1]
  endif
endfunc

function! airline#extensions#branch#get_head()
  if exists("g:status_branch_name")
    return g:status_branch_name
  elseif !exists("s:call_back")||s:call_back==0
    let s:call_back=1
    call job_start("git branch",{"out_cb":"airline#extensions#branch#git_branch"})
    return ""
  else
    return ""
  endif
endfunction

function! airline#extensions#branch#init(ext)
  call airline#parts#define_function('branch', 'airline#extensions#branch#get_head')
endfunction
