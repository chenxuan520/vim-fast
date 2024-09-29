
" for popup menu
func NERDTreeMenu()
	unmenu PopUp
	nnoremenu PopUp.Create\ File   :call NERDTreeAddNode()<cr>
	nnoremenu PopUp.Create\ Dir    :call NERDTreeAddNode()<cr>/<left>
	nnoremenu PopUp.VSplite\ File  :call nerdtree#ui_glue#invokeKeyMap("s")<cr>
	nnoremenu PopUp.Splite\ File   :call nerdtree#ui_glue#invokeKeyMap("i")<cr>
	nnoremenu PopUp.Move\ Node     :call NERDTreeMoveNode()<cr>
	nnoremenu PopUp.Hidden\ File   :call nerdtree#ui_glue#invokeKeyMap("I")<cr>
	nnoremenu PopUp.Focus\ File    :wincmd w<bar>NERDTreeFind<cr>
	nnoremenu PopUp.Copy\ Path     :echom g:NERDTreeFileNode.GetSelected().path.str()<bar>
				\let @+=g:NERDTreeFileNode.GetSelected().path.str() <cr>
	nnoremenu PopUp.Flush :NERDTreeRefreshRoot<bar>NERDTreeRefreshRoot<cr>
endfunc
let g:rightmouse_popupmenu['nerdtree']=function("NERDTreeMenu")

setlocal nowrap
