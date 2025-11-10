
" for popup menu
func NvimTreeMenu()
	unmenu PopUp
	nnoremenu PopUp.Create\ File   :lua require('nvim-tree.api').fs.create()<CR>
	nnoremenu PopUp.Create\ Dir    :lua require('nvim-tree.api').fs.create()<CR>/<left>
	nnoremenu PopUp.VSplite\ File  :lua require('nvim-tree.api').node.open.vertical()<cr>
	nnoremenu PopUp.Splite\ File   :lua require('nvim-tree.api').node.open.horizontal()<cr>
	nnoremenu PopUp.Move\ Node     :lua require('nvim-tree.api').fs.rename_sub()<cr>
	nnoremenu PopUp.Hidden\ File   :lua require('nvim-tree.api').tree.toggle_hidden_filter()<cr>
	nnoremenu PopUp.Git\ Ignore    :lua require('nvim-tree.api').tree.toggle_gitignore_filter()<cr>
	nnoremenu PopUp.Focus\ File    :wincmd w<bar>lua require('nvim-tree.api').tree.find_file();require('nvim-tree.api').tree.focus()<cr><cr>
	nnoremenu PopUp.Copy\ Path     :lua require('nvim-tree.api').fs.copy.absolute_path()<cr>
endfunc
let g:rightmouse_popupmenu['NvimTree']=function("NvimTreeMenu")

setlocal nowrap
