"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  __   __   __     __    __     ______   ______     ______     ______
" /\ \ / /  /\ \   /\ "-./  \   /\  ___\ /\  __ \   /\  ___\   /\__  _\
" \ \ \"/   \ \ \  \ \ \-./\ \  \ \  __\ \ \  __ \  \ \___  \  \/_/\ \/
"  \ \__|    \ \_\  \ \_\ \ \_\  \ \_\    \ \_\ \_\  \/\_____\    \ \_\
"   \/_/      \/_/   \/_/  \/_/   \/_/     \/_/\/_/   \/_____/     \/_/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" chenxuan's vim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" base config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " use ',' as leader
set nocompatible         " set not compatible with vi
filetype on              " set file type detection
filetype plugin on       " set load plugin by file type
set noeb                 " turn off error syntax prompts
syntax enable            " highlight enable
syntax on                " highlight auto
set t_Co=256             " open 256 color
set vb t_vb=             " set no bell
set cmdheight=1          " set command height
set showcmd              " show select line nums in visual
set textwidth=0          " close auto enter
set ruler                " cursor position displayed
set laststatus=2         " show status
set number               " show line number
set relativenumber       " show relativenumber
set cursorline           " highlight current line
set whichwrap+=<,>,h,l   " set the cursor key across rows
set ttimeoutlen=0        " set <ESC> response time
set virtualedit=block,onemore   " allows the cursor appear after last character
set noshowmode           " disable bottom mode displayed 'insert'
set hidden               " allows toggle buffers in unsaved
set background=dark      " set background color

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" code indent and typesetting config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " set auto indent
set cindent              " set indent by c/cpp
set cinoptions=g0,:0,N-s,(0    " set c/cpp indent way
set smartindent          " smart choose indent way
filetype indent on       " intelligent indent for different languages
set noexpandtab          " set forbidden space to replace tab
set tabstop=4            " number of spaces used by tabs when editing
set shiftwidth=4         " number of spaces tab occupies when formatting
set softtabstop=4        " set 4 spaces as tabs
set smarttab             " use tabs at the beginning of lines and segments
set nowrap               " disable divide a line to two
set backspace=2          " use enter key to normally handle input, eol, start, etc
set sidescroll=10        " sets the number of characters to scroll to the right
set nofoldenable         " disables folding code
set list lcs=tab:¦\      " default show indent line
set sidescroll=0         " set move line when cursor too right
set sidescrolloff=4      " set curor line to right
" set scrolloff=5          " set cursor line to bottom

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" code inside completion config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim itself named line pattern intelligent completion
set completeopt-=preview " completion window is not displayed when completed, only list is displayed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " highlight search results
set incsearch           " turn on real-time search
set ignorecase          " search is not case sensitive
set smartcase           " search smart match case

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cache config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " set no back up
set noswapfile          " disable create temp file
set autoread            " if file change by others,load it auto
set autowrite           " set auto save
set confirm             " if quit without save,make confirm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encode config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8 " set langmenu encode utf-8
set helplang=cn          " set helplang Chinese
set termencoding=utf-8   " set term encode
set encoding=utf8        " set encode
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030 " set detect encode of file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macvim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
	set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 14      " set fonts in gvim
	set guioptions-=m           " hide the menu bar
	set guioptions-=T           " hide tool bar
	set guioptions-=L           " hide left scroll bar
	set guioptions-=r           " hide right scroll bar
	set guioptions-=b           " hide bottom scroll bar
	set showtabline=0           " hide tab bar
	set guicursor=n-v-c:ver5    " set cursor to a vertical line
	" set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h14 " set fonts in macvim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if your network is not good,change it to mirror
" let g:plug_url_format="https://git::@gitee.com/%s.git"

call plug#begin('~/.vim/plugged')

" begin vim
Plug 'chenxuan520/my-vim-dashboard'
" function list
Plug 'preservim/tagbar', {'tag':'2.2'}
" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release','tag': '0.0.81'}
" find anything
Plug 'Yggdroot/LeaderF'
" quick move mouse
Plug 'easymotion/vim-easymotion'
" enhance the /
Plug 'haya14busa/incsearch.vim'
" pair auto
Plug 'jiangmiao/auto-pairs'
" file tree left
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': 'NERDTreeToggle'}
" easy align
Plug 'godlygeek/tabular', {'on':'Tabularize'}
" change surround quick
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" quick add comment
Plug 'tpope/vim-commentary'
" add endif when enter if
Plug 'tpope/vim-endwise', {'for':['vim','sh']}
" for cpp highlight
Plug 'octol/vim-cpp-enhanced-highlight', {'for':'cpp'}
" for go highlight
Plug 'chenxuan520/vim-go-highlight', {'for':'go'}
" for python highlight
Plug 'vim-python/python-syntax', {'for':'py'}
" statusline of bottom
Plug 'vim-airline/vim-airline'
" file devicon
Plug 'ryanoasis/vim-devicons'
" git control
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" enhance f/t
Plug 'rhysd/clever-f.vim'
" code snippets
Plug 'honza/vim-snippets'
" run shell in async
Plug 'skywind3000/asyncrun.vim'

call plug#end()

" load vim default plugin
runtime macros/matchit.vim

" key map and inside config setting

" reload .vimrc
nnoremap <leader><leader>s :source $MYVIMRC<cr>
nnoremap <leader><leader>S :source <c-r>=expand('%:p')<cr><cr>

" install and clean plug
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" vim-buffer
nnoremap <silent><c-p> :bp<cr>
nnoremap <silent><c-n> :bn<cr>
nnoremap <silent><leader>d :bd<cr>
nnoremap <silent><expr><c-m> expand('%')==''?"\<cr>":":w<cr>"

" insert model to move cursor
imap <c-j> <down>
imap <c-k> <up>
imap <c-l> <right>
imap <c-h> <left>

" move in insert
inoremap <c-e> <end>
inoremap <c-a> <c-[>^i
inoremap <c-d> <del>
inoremap <c-f> <c-[>lWi
inoremap <expr><c-b> <sid>CtrlB()
func! s:CtrlB()
	if pumvisible()
		return "\<c-n>"
	elseif getline('.')[col('.')-2]==nr2char(9)
		let s:pos=col('.')
		let s:result=""
		while s:pos!=0
			let s:result=s:result."\<bs>"
			let s:pos-=1
		endwhile
		let s:result=s:result."\<c-n>"
		return s:result
	else
		return "\<c-[>Bi"
	endif
endfunc

" delete line
inoremap <c-q> <c-[>ddi
snoremap <c-q> <c-[>ddi

" find next {}
nnoremap <c-y> /{<cr>:noh<cr>NNva}<c-g>
nnoremap <c-t> /{<cr>:noh<cr>va{<c-g>
inoremap <c-y> <c-[>/{<cr>:noh<cr>va{<c-g>
vnoremap <c-y> <c-[>/{<cr>:noh<cr>va{<c-g>
vnoremap <c-t> <c-[>/{<cr>:noh<cr>NNva}<c-g>
inoremap <c-t> <c-[>/}<cr>:noh<cr>NNva}<c-g>

" yank to system
vnoremap <leader><leader>y "+y
" paste to system
nnoremap <leader><leader>p "+p
nnoremap <leader><leader>P "+P
vnoremap <leader><leader>p "+p
vnoremap <leader><leader>P "+P

" load the file last edit pos
let g:map_recent_close={}
augroup ReadPost
	au!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | execute "normal! zz" | endif
	autocmd BufDelete * if expand('%:p')!=''|let g:map_recent_close[expand('%:p')] =
				\{'lnum':line('.'),'col':col('.'),'text':'close at '.strftime("%H:%M"),'time':localtime()}
				\|endif
augroup END
func! s:GetRecentClose()
	let s:list=[]
	for [key,value] in items(g:map_recent_close)
		let value['filename']=key
		call insert(s:list,value)
	endfor
	let s:func={m1,m2 -> m1['time']>m2['time']?-1:1}
	call sort(s:list,s:func)
	call setqflist(s:list,'r')
	copen
endfunc
nnoremap <silent><nowait><space>q :call <sid>GetRecentClose()<cr>

" termdebug
let g:termdebug_wide=1
nnoremap <leader><leader>d :packadd termdebug<cr>:Termdebug<space>
nnoremap <F5> :packadd termdebug<cr>:Termdebug<space>
nnoremap <F6> :Break<cr>
nnoremap <F7> :Over<cr>
nnoremap <F8> :Step<cr>

" easy to add time
func Time()
	return "update by chenxuan ".strftime("%Y-%m-%d %H:%M:%S")
endfunc

" term console
func! Tapi_EditFile(bufnum,arglist)
	execute ":wincmd p"
	if filereadable(a:arglist[0])
		execute ":edit " . a:arglist[0]
	endif
	if len(a:arglist)>1
		call term_sendkeys(a:bufnum,a:arglist[1]."\<cr>")
	endif
endfunc
tnoremap <c-\> <c-\><c-n>
tnoremap <c-o> printf '\033]51;["call","Tapi_EditFile",["%s/%s"]]\007' $PWD<space>
tnoremap <c-]> printf '\033]51;["call","Tapi_EditFile",["%s/%s","exit"]]\007' $PWD<space>
tnoremap <c-z> exit<cr>
nnoremap <leader><leader>T :bo term ++rows=6<CR>
nnoremap <leader><leader>t :vert term<CR>
nnoremap <silent><space><space>t :tabe<cr>:execute ":vert term ++curwin ++close " <cr>
nnoremap <silent><space><space>T :let @s=expand('%:p:h')<cr>:tabe<cr>:call term_start("bash",{"cwd":"<c-r>=@s<cr>","curwin":1,"term_finish":"close"})<cr>

" lazygit
nnoremap <silent><space>g :call <sid>LazyGitFile(0)<cr>:tabe<cr>:call term_start("lazygit",{"close_cb":"<sid>LazyGitFile","curwin":1,"term_finish":"close"})<cr>
nnoremap <silent><space>G :let @s=expand('%')<cr>:tabe<cr>:vert term ++curwin ++close lazygit -f <c-r>s<cr>
func! s:LazyGitFile(close) abort
	if type(a:close)==0
		if !exists("s:lazygit_file")||getenv("LAZYGIT_FILE")==v:null
			let s:lazygit_file=tempname()
			call setenv("LAZYGIT_FILE",s:lazygit_file)
		endif
	else
		if exists("s:lazygit_file")&&filereadable(expand(s:lazygit_file))&&getenv("LAZYGIT_FILE")==s:lazygit_file&&filereadable(expand(s:lazygit_file))
			tabclose
			for line in readfile(s:lazygit_file)
				let msg=split(line)
				let file=termtask#Term_get_dir()."/".msg[0]
				execute ":edit ".file
				if msg[1]!=1
					call cursor(msg[1],0)
				endif
			endfor
		endif
	endif
endfunc

" fzf self defile
func! s:FzfFind(command)
	vert call term_start('bash',{'term_finish':"close"})
	call term_sendkeys(term_list()[0],a:command."\<cr>")
endfunc
nnoremap <silent><space>z :call <sid>FzfFind('printf "\033]51;[\"call\",\"Tapi_EditFile\",[\"%s/%s\",\"exit\"]]\007" $PWD `fzf --layout=reverse --preview-window=down --preview "head -64 {}"`')<cr>
nnoremap <silent><space>Z :call <sid>FzfFind('fd')<cr>

" lf config define
nnoremap <silent><space>e :tabe<cr>:vert term ++curwin ++close lf <c-r>=getenv('HOME')<cr><cr>
nnoremap <silent><space>E :tabe<cr>:vert term ++curwin ++close lf .<cr>

" yank and paste
nnoremap <leader>p "0p
vnoremap <leader>p "0p
nnoremap <leader>P "0P
vnoremap <leader>P "0P

" vimdiff merge
command! -nargs=0 Remote :diffg RE
command! -nargs=0 Base :diffg BA
command! -nargs=0 Local :diffg LO

" change window width
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>

" change window pos in normal
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <s-up>    <c-w>k
nnoremap <s-down>  <c-w>j
nnoremap <s-left>  <c-w>h
nnoremap <s-right> <c-w>l

" change window location
nnoremap <c-s-up> <c-w>K
nnoremap <c-s-down> <c-w>J
nnoremap <c-s-left> <c-w>H
nnoremap <c-s-right> <c-w>L

" quick fix
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap \q :cclose<cr>
nnoremap =q :copen<cr>

" set mouse
func! s:MouseConfig()
	set mouse=a
	set mousemodel=popup_setpos
	unmenu PopUp
	" you can define menu self
	" visual model
	vnoremenu PopUp.Yank\ Text "+y
	vnoremenu PopUp.Cut\ Text "+d
	vnoremenu PopUp.Del\ Text "_d
	vnoremenu PopUp.Paste\ Text "+p
	" normal model
	nnoremenu PopUp.Paste\ Text "+p
	nnoremenu PopUp.Select\ All ggVG
	nnoremenu PopUp.Back\ Pos <c-o>zz
	nnoremenu PopUp.Next\ Pos <c-i>zz
	" fold
	nnoremenu PopUp.Open\ Fold  zO
	nnoremenu PopUp.Close\ Fold zC
	" close
	nnoremenu PopUp.-Sep- :<cr>
	nnoremenu PopUp.Close\ Mouse :set mouse=""<cr>
	" term model
	tlnoremenu PopUp.Exit\ Term exit<cr>
endfunc
call <sid>MouseConfig() " default set mouse enable
nnoremap <silent><nowait>=m :call <sid>MouseConfig()<cr>
nnoremap <silent><nowait>\m :set mouse=""<cr>

" show indent line
nnoremap <silent><nowait>=i :set list lcs=tab:¦\<space> <cr>
nnoremap <silent><nowait>\i :set nolist<cr>

" set spell
nnoremap <silent><nowait>=s :setlocal spell<cr>
nnoremap <silent><nowait>\s :setlocal nospell<cr>
" z= is list of change

" set wrap
nnoremap <silent><nowait>=r :setlocal wrap<cr>:noremap<buffer> j gj<cr>:noremap<buffer> k gk<cr>
nnoremap <silent><nowait>\r :setlocal nowrap<cr>:unmap<buffer> j<cr>:unmap<buffer> k<cr>

" set line number
nnoremap <silent><nowait>=n :setlocal norelativenumber<cr>
nnoremap <silent><nowait>\n :setlocal relativenumber<cr>

" close/open number
nnoremap <silent><nowait>=N :setlocal norelativenumber<cr>:setlocal nonumber<cr>
nnoremap <silent><nowait>\N :setlocal relativenumber<cr>:setlocal number<cr>

" set fold auto
nnoremap <silent><nowait>=z :setlocal fdm=indent<cr>:setlocal fen<cr>
nnoremap <silent><nowait>\z :setlocal fdm=manual<cr>:setlocal nofen<cr>
nnoremap <silent><nowait>=o zO
nnoremap <silent><nowait>\o zC
nnoremap <silent><nowait><expr><bs> foldlevel('.')>0?"zc":"\<bs>"

" tab ctrl
nnoremap <silent><nowait>\t :tabc<cr>
nnoremap <silent><nowait>[t :tabp<cr>
nnoremap <silent><nowait>]t :tabn<cr>

" set search noh
nnoremap <silent><nowait>\h :noh<cr>
nnoremap <silent><nowait>=h :set hlsearch<cr>

" delete <space> in end of line
nnoremap <silent><nowait>d<space> :%s/ *$//g<cr>:noh<cr><c-o>

" select search
xmap g/ "sy/\V<c-r>=@s<cr><cr>

" run macro in visual model
xnoremap @ :normal @

" termtask project config
command! -nargs=1 -complete=customlist,termtask#Term_task_list TaskRun  :call termtask#Term_task_run(<f-args>)
command! -nargs=0 TaskList :echo termtask#Term_task_list('','','')
command! -nargs=0 TaskLoad :call termtask#Term_task_run('')
nnoremap <space><space>C :TaskLoad<cr>
nnoremap <space>c :TaskRun<space>
nnoremap <silent><space>C :call termtask#Term_config_edit()<cr>
" auto read project file
" let s:fileway=termtask#Term_get_dir() . '/.config.vim'
" if filereadable(s:fileway)
" 	execute 'source ' . s:fileway
" endif

" get key binding
let g:findkey_mode=0
nnoremap <leader>h  :call findkey#get_key_msg(0)<cr>
nnoremap <silent>-h :call findkey#get_key_msg(1)<cr>
nnoremap <silent>]h :call findkey#open_file(1)<cr>
nnoremap <silent>[h :call findkey#open_file(0)<cr>

" highlight color
nnoremap <silent><nowait>=c :call highlightcolor#Able()<cr>
nnoremap <silent><nowait>\c :call highlightcolor#DisAble()<cr>

" gutter for git
let g:gitgutter_sign_able=1
let g:gitgutter_highlight_able=0
nnoremap <silent>=g    :call gutter#GitGutterAble()<cr>
nnoremap <silent>\g    :call gutter#GitGutterDisable()<cr>
nnoremap <silent>[g    :call gutter#GitGutterChangeTurn(0,line('.'))<cr>
nnoremap <silent>]g    :call gutter#GitGutterChangeTurn(1,line('.'))<cr>
nnoremap <silent>-g    :call gutter#GitGutterRecover()<cr>
nnoremap <silent>zg    :call gutter#GitGutterFold()<cr>
nnoremap <silent><c-g> :call gutter#GitGutterDiff()<cr>

" line cword
let g:cursorline_delay=0
nnoremap <silent><nowait>=f :call cursorline#Able()<cr>
nnoremap <silent><nowait>-f :call cursorline#Toggle()<cr>
nnoremap <silent><nowait>\f :call cursorline#Disable()<cr>

" ici to tran
let g:term_cmd='~/.local/bin/ici'
xnoremap <silent><leader>i :call termtask#Term_cmd_exec('v')<cr>
nnoremap <silent><leader>i :call termtask#Term_cmd_exec('')<cr>

" ibus enable
let g:ibus_enable=1
" md fold enable
let g:markdown_fold_enable=1

" use select area to replace
xnoremap s :<c-u>execute "normal! gv\"sy"<cr>:%s/\V<c-r>=@s<cr>/

" indent buffer
nnoremap <silent><nowait> =e gg=G<c-o><c-o>zz
onoremap <silent>ie :<c-u>normal! ggVG<cr>
xnoremap <silent>ie :<c-u>normal! ggVG<cr>
onoremap <silent>ae :<c-u>normal! ggVG<cr>
xnoremap <silent>ae :<c-u>normal! ggVG<cr>

" object line
onoremap <silent>il :<c-u>normal! ^v$BE<cr>
xnoremap <silent>il :<c-u>normal! ^v$<cr><left>
onoremap <silent>al :<c-u>normal! 0v$<cr>
xnoremap <silent>al :<c-u>normal! 0v$<cr>

" object argc
onoremap <silent>aa :<c-u>call obj#GetArgc('T','f')<cr>
onoremap <silent>ia :<c-u>call obj#GetArgc('T','t')<cr>
xnoremap <silent>aa :<c-u>call obj#GetArgc('T','f')<cr>
xnoremap <silent>ia :<c-u>call obj#GetArgc('T','t')<cr>

" easy to get obj
onoremap <silent>i, i<
onoremap <silent>a, a<
xnoremap <silent>i, i<
xnoremap <silent>a, a<
onoremap <silent>i; i"
onoremap <silent>a; a"
xnoremap <silent>i; i"
xnoremap <silent>a; a"
onoremap <silent>in i{
onoremap <silent>an a{
xnoremap <silent>in i{
xnoremap <silent>an a{

" sudo to write file
cnoremap w!! w !sudo tee % >/dev/null

" quick to change dir
cnoremap cdn cd <c-r>=expand('%:p:h')<cr>
cnoremap cdr cd <c-r>=termtask#Term_get_dir()<cr>

" cmd emacs model
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-d> <del>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-b> <s-left>
cnoremap <c-f> <s-right>

" set cursor middle
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz

" set split window
nnoremap <silent><nowait>_ :vsp<cr>:bn<cr>
nnoremap <silent><nowait>+ :sp<cr>:bn<cr>

" edit file
nnoremap e         :edit<space><c-r>=getcwd()<cr>/
nnoremap E         :edit<space><c-r>=expand('%:p:h')<cr>/
nnoremap <leader>e :edit<space>~/

" open : quick
nnoremap <space>; :

" add empty line
nnoremap <silent><nowait>U :call append(line('.')-1,"")<cr>
nnoremap <silent><nowait>M :call append(line('.'),"")<cr>

" make move easy
nnoremap <silent><c-e> $
nnoremap <silent>Q $
nnoremap <silent><expr><c-a> getline('.')[col('.')-1]>='0'&&getline('.')[col('.')-1]<='9'?"\<c-a>":"^"
nnoremap <silent>S ^

" enhance c-a and c-x
nnoremap <silent><expr>g<c-a> getline('.')[col('.')-1]=='9'?"r0":"r".(getline('.')[col('.')-1]+1)
nnoremap <silent><expr>g<c-x> getline('.')[col('.')-1]=='0'?"r9":"r".(getline('.')[col('.')-1]-1)

" add space
nnoremap <leader><space> i<space><right><c-[>

" jump >
func! s:Judge()
	if getline('.')[col('.')-1]=='>'
		return "\<right>"
	endif
	return ">"
endfunc
inoremap <expr><silent>> <sid>Judge()

" scroll in other window
nnoremap <silent>\u <c-w>p<c-u><c-w>p
nnoremap <silent>\d <c-w>p<c-d><c-w>p

" redraw the screen
nnoremap <silent>R :redr!<cr>

" ctrl file system
command! Delete if filereadable(expand('%'))|call delete(expand('%'))|execute ":bd"|execute ":bn"|endif
command! -nargs=1 -bang -complete=file Rename let @s=expand('%')|f <args>|w<bang>|call delete(@s)
cab Rename Rename <c-r>=expand('%:p:h')<cr>/
command! -nargs=1 -bang -complete=file Mkdir echo mkdir(<f-args>)
cab Mkdir Mkdir <c-r>=expand('%:p:h')<cr>/
command! -nargs=1 -bang -complete=file Rmdir echo delete(<f-args>,"d")
cab Rmdir Rmdir <c-r>=expand('%:p:h')<cr>/
" use cd to change dir

" select move
xnoremap <silent><up>    :move '<-2<cr>gv
xnoremap <silent><down>  :move '>+1<cr>gv
xnoremap <silent><right> y<c-w>lo<c-[>Vpgv
xnoremap <silent><left>  y<c-w>ho<c-[>Vpgv
xnoremap <silent><c-j>   :move '>+1<cr>gv
xnoremap <silent><c-k>   :move '<-2<cr>gv
xnoremap <silent><c-l>   y<c-w>lo<c-[>Vpgv
xnoremap <silent><c-h>   y<c-w>ho<c-[>Vpgv

" open link
" is default in vim by gx
func! s:GotoLink()
	let s:list=matchstrpos(getline('.'),'https*://\S[^][(){}]*',0)
	let s:link=s:list[0]
	while s:list[0]!=''&&(s:list[1]>col('.')||s:list[2]<col('.'))
		let s:list=matchstrpos(getline('.'),'https*://\S[^][(){}]*',s:list[2])
	endwhile
	if s:list[0]!=''
		let s:link=s:list[0]
	endif
	let s:browser=get(g:,'default_browser','firefox')
	if s:link!=''
		call job_start(s:browser.' '.s:link)
	else
		echo 'cannot find link'
	endif
endfunc
nnoremap <silent><nowait>gl :call <sid>GotoLink()<cr>

" set alias
iab ;e 1607772321@qq.com
iab ;n chenxuan
nnoremap \a :iabc<cr>
nnoremap =a :ab<cr>

" set function to choose select area
func s:GetSelectArea()
	let temp = @s
	norm! gv"sy
	let l:str = @s
	let @s = temp
	return l:str
endfunc

" plug config setting

" tokyonight themes
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" onedark themes
" let g:onedark_termcolors=256
" colorscheme onedark

" set prepare code when new file
augroup PreCode
	autocmd!
	autocmd BufNewFile *.cpp,*.cc,*.go,*.py,*.sh,*.hpp,*.h,*.html,.config.vim,CMakeLists.txt execute ":call VimFastSetPreCode()"
augroup END

" airline
let g:airline_theme= "tokyonight"
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tabline' , 'coc', 'branch']
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_coc_cur_func = 1

" nerdtree
nnoremap <silent><leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'
let g:NERDTreeWinSize=18
" exit vim if NERDTree is the only window remaining in the only tab.
augroup NerdTree
	autocmd!
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | :bn | endif
augroup END

" coc.nvim
" coc tab
inoremap <silent><expr><TAB>
			\ pumvisible() ? "\<C-n>" :
			\ CheckBackspace() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><right> pumvisible() ? "\<C-y>" : "\<right>"
" for coc 0.0.82
" inoremap <silent><expr> <TAB>
" 			\ coc#pum#visible() ? coc#pum#next(1):
" 			\ CheckBackspace() ? "\<TAB>" :
" 			\ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" inoremap <silent><expr> <right> coc#pum#visible() ? coc#pum#confirm()
" 			\: "\<right>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" c-p
inoremap <silent><expr><c-p>
			\ pumvisible()? "\<c-p>" : "\<c-[>"
" coc find define
nmap <leader>u <Plug>(coc-definition)
nmap <leader>U <Plug>(coc-type-definition)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gD <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gi <Plug>(coc-implementation)
nmap <leader>qq <Plug>(coc-fix-current)
" coc refactor code
nmap <space>r <Plug>(coc-refactor)
nmap <leader>r <Plug>(coc-rename)
" coc find wrong
nmap <silent><F3> <Plug>(coc-diagnostic-prev)
nmap <silent><F4> <Plug>(coc-diagnostic-next)
nmap <silent>[w <Plug>(coc-diagnostic-prev)
nmap <silent>]w <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait>=w :<C-u>CocList --normal diagnostics<cr>
nnoremap <silent><nowait> <space>w :<C-u>CocList --normal diagnostics<cr>
" coc text obj
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" coc code action
nmap <leader>a  <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>l  <Plug>(coc-codelens-action)
" coc select range
nmap <silent><leader>s <Plug>(coc-range-select)
xmap <silent><leader>s <Plug>(coc-range-select)
" coc format
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 Import :call CocActionAsync('runCommand', 'editor.action.organizeImport')
nmap <leader><leader>f :Format<cr>
" coc config
nmap <silent><nowait><space><space>c :CocConfig<cr>
nmap <silent><nowait><space><space>l :CocList --normal extensions<cr>
nmap <silent><nowait><space><space>j :CocList outline<cr>
" coc help
nnoremap <silent> K  :call ShowDocumentation()<cr>
nnoremap <silent> gh :call ShowDocumentation()<cr>
" coc mouse
nmap <c-LeftMouse> <LeftMouse><Plug>(coc-definition)
nmap <c-RightMouse> <LeftMouse>:call ShowDocumentation()<cr>
function! s:CocMouse()
	unmenu PopUp
	nmenu     <silent>PopUp.Coc\ Define    gd
	nmenu     <silent>PopUp.Coc\ Refer     gr
	nnoremenu <silent>PopUp.Coc\ Doc       :call ShowDocumentation()<cr>
	nmenu     <silent>PopUp.Hight\ Word    *
	nnoremenu <silent>PopUp.Back\ Pos      <c-o>zz
	nnoremenu <silent>PopUp.Next\ Pos      <c-i>zz
	nnoremenu <silent>PopUp.Open\ Fold     zO
	nnoremenu <silent>PopUp.Close\ Fold    zC
	nnoremenu <silent>PopUp.Fold\ Enable   :set fdm=indent<cr>:set fen<cr>
	nnoremenu <silent>PopUp.-Sep-          :<cr>
	nnoremenu <silent>PopUp.Close\ Model\  :call <sid>MouseConfig()<cr>
endfunction
nnoremap <silent><nowait>-c :call <sid>CocMouse()<cr>

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

let g:tagbar_width = 22
nnoremap <silent> <leader>t :TagbarToggle<cr>

" auto pair
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0

" incsearch.vim
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)

" vim-easymotion
let g:EasyMotion_smartcase = 1
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
nmap <silent>s <Plug>(easymotion-overwin-f)

" python-highlight
let g:python_highlight_all = 1

" vim-go-highlight
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints =1
let g:go_highlight_generate_tags =1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_fields = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1
" let g:go_highlight_array_whitespace_error = 1

" dashboard
" let g:slash_auto_middle=0
" let g:slash_auto_star_middle=0
nnoremap <space>S :SessionSave<cr>
nnoremap <space>s :SessionLoad<cr>

" leaderF
" find file
nnoremap <space>f :LeaderfFile<cr>
" recent file
nnoremap <space>F :LeaderfMru<cr>
" find buffer
nnoremap <leader>b :LeaderfBuffer<cr>
nnoremap <space>b :LeaderfBuffer<cr>
" function list
nnoremap <space>t :LeaderfFunction<cr>
nnoremap <space>T :LeaderfFunctionAll<cr>
xnoremap <space>t :<c-u>execute ":Leaderf function --all --input " . <sid>GetSelectArea()<cr>
" find for help
nnoremap <space>h :LeaderfHelp<cr>
nnoremap <space>H :Leaderf help --input key:<cr>
xnoremap <space>h :<c-u>execute ":Leaderf help --input " . <sid>GetSelectArea()<cr><tab>
" enhance find
nnoremap <space>/ :LeaderfLine<cr>
xnoremap <space>/ :<c-u>execute ":Leaderf line --input " . <sid>GetSelectArea()<cr><tab>
nnoremap <space>? :LeaderfLineAll<cr>
xnoremap <space>? :<c-u>execute ":Leaderf line --all --input " . <sid>GetSelectArea()<cr><tab>
" find key word
nnoremap <space>a :Leaderf rg -i<cr>
nnoremap <space>A :Leaderf rg -i --cword<cr>
xnoremap <space>a :<c-u>execute ":Leaderf rg -i --input " . <sid>GetSelectArea()<cr>
xnoremap <space>A :<c-u>execute ":Leaderf rg -i " . <sid>GetSelectArea()<cr><tab>
" jump tags
nnoremap <space>j :LeaderfBufTag<cr>
nnoremap <space>J :LeaderfBufTagAll<cr>
" recall
nnoremap <space>l :Leaderf --recall<cr><tab>
" quickfix jump
nnoremap <space>Q :Leaderf quickfix<cr><tab>
" find color
nnoremap <F1> :LeaderfColorscheme<cr>
" set leaderf work dir
nnoremap <silent><nowait>=l :let g:Lf_WorkingDirectoryMode = 'ac'<cr>
nnoremap <silent><nowait>\l :let g:Lf_WorkingDirectoryMode = 'c'<cr>
" set leaderf options
" let g:Lf_WorkingDirectoryMode = 'ac'
let g:Lf_HideHelp = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_StlSeparator = { 'left': '', 'right': ''}
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function': 1,'Rg': 1,'Line': 1,'BufTag': 1}
let g:Lf_CommandMap = {'<C-J>':['<C-J>','<C-N>'],'<C-K>':['<C-P>','<C-K>'],'<C-P>':['<C-L>'],'<HOME>':['<C-A>']}
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
			\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\}
let g:Lf_UseCache = 0
" f1 to open help menu,f5 to fresh,tab to normal mode
" c-] open in vertical,c-x open in split,c-t open in a tab,c-\ ask for open,D to delete buffer

" tabular
nnoremap <leader>T :Tabularize /
xnoremap <leader>T :Tabularize /

" vim-surround
let g:surround_no_insert_mappings=1

" vim-smooth-scroll
nnoremap <silent><c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
nnoremap <silent><c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
nnoremap <silent><c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
nnoremap <silent><c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" gv
nnoremap <leader>g         :GV<cr>
nnoremap <leader>G         :GV!<cr>
nnoremap <leader><leader>g :GV?<cr>

" clever f
" nnoremap \ ,
" map \ <Plug>(clever-f-repeat-back)
nmap <silent><nowait> ; <Plug>(clever-f-repeat-forward)
xmap <silent><nowait> ; <Plug>(clever-f-repeat-forward)

" asyncrun
let g:asyncrun_open = 6
let g:asyncrun_bell = 0
nmap <space>: :AsyncRun<space>
" asyncrun ack
nnoremap <leader>A :AsyncRun ack -i<space>
