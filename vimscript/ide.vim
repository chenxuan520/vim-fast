set mouse=a
execute ":bo term ++rows=7"
execute "normal \<c-w>k"
execute "NERDTree | wincmd p"
execute "TagbarToggle"
" nnoremenu WinBar.NewFile :enew<cr>
