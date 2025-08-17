
" for popup menu
func NvimTreeMenu()
	unmenu PopUp
	nnoremenu PopUp.Create\ File   :lua require('nvim-tree.api').fs.create()<CR>
	nnoremenu PopUp.Create\ Dir    :lua require('nvim-tree.api').fs.create()<CR>/<left>
	nnoremenu PopUp.VSplite\ File  :call nerdtree#ui_glue#invokeKeyMap("s")<cr>
	nnoremenu PopUp.Splite\ File   :call nerdtree#ui_glue#invokeKeyMap("i")<cr>
	nnoremenu PopUp.Move\ Node     :call NERDTreeMoveNode()<cr>
	nnoremenu PopUp.Hidden\ File   :call nerdtree#ui_glue#invokeKeyMap("I")<cr>
	nnoremenu PopUp.Focus\ File    :wincmd w<bar>lua require('nvim-tree.api').tree.find_file();require('nvim-tree.api').tree.focus()<cr>
	nnoremenu PopUp.Copy\ Path     :echom g:NERDTreeFileNode.GetSelected().path.str()<bar>
				\let @+=g:NERDTreeFileNode.GetSelected().path.str() <cr>
	nnoremenu PopUp.Flush :NERDTreeRefreshRoot<bar>NERDTreeRefreshRoot<cr>
endfunc
let g:rightmouse_popupmenu['NvimTree']=function("NvimTreeMenu")

setlocal nowrap
