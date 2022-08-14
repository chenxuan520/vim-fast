autocmd BufEnter .vimrc execute ":call EnterVimrc()"
autocmd BufLeave .vimrc execute ":call LeaveVimrc()"

let s:lines = []

function! EnterVimrc()
    if match(getline(18), "vimplus") != -1
        call timer_start(0, 'HighlightLogoAsync', {'repeat': 1})
    endif
endfunction

function! LeaveVimrc()
    call clearmatches()
endfunction

function! HighlightLogoAsync(id)
    call timer_stop(a:id)
    call <sid>highlight_logo()
endfunction

function! s:highlight_logo()
endfunction
