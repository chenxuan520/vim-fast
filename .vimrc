"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" __   __   __     __    __     ______   ______     ______     ______
"/\ \ / /  /\ \   /\ "-./  \   /\  ___\ /\  __ \   /\  ___\   /\__  _\
"\ \ \"/   \ \ \  \ \ \-./\ \  \ \  __\ \ \  __ \  \ \___  \  \/_/\ \/
" \ \__|    \ \_\  \ \_\ \ \_\  \ \_\    \ \_\ \_\  \/\_____\    \ \_\
"  \/_/      \/_/   \/_/  \/_/   \/_/     \/_/\/_/   \/_____/     \/_/
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
" gvim/macvimi config
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
Plug 'neoclide/coc.nvim', {'branch': 'release','tag': '0.0.80'}
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
" quick choose area
Plug 'gcmt/wildfire.vim', {'on': [ '<Plug>(wildfire-fuel)', '<Plug>(wildfire-quick-select)'] }
" easy align
Plug 'godlygeek/tabular', {'on':'Tab'}
" change surround quick
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" quick add comment
Plug 'tpope/vim-commentary'
" add endif when enter if
Plug 'tpope/vim-endwise'
" for cpp highlight
Plug 'octol/vim-cpp-enhanced-highlight', {'for':'cpp'}
" for go highlight
Plug 'chenxuan520/vim-go-highlight', {'for':'go'}
" for python highlight
Plug 'vim-python/python-syntax', {'for':'py'}
" statusline of bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" file devicon
Plug 'ryanoasis/vim-devicons'
" git control
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" text obj
Plug 'kana/vim-textobj-user'
" enhance c-f/b and c-d/u
Plug 'terryma/vim-smooth-scroll'
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

" install and clean plug
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" vim-buffer
nnoremap <silent> <c-p> :bp<cr>
nnoremap <silent> <c-n> :bn<cr>
nnoremap <silent> <c-m> :w<cr>
nnoremap <silent> <leader>d :bd<cr>

" insert model to move cursor
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <RIGHT>

" yank to system
vnoremap <leader><leader>y "+y
" paste to system
nnoremap <leader><leader>p "+p
vnoremap <leader><leader>p "+p

" load the file last edit pos
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | execute "normal! zz" | endif

" termdebug
let g:termdebug_wide=1
nnoremap <leader><leader>d :packadd termdebug<cr>:Termdebug<space>
nnoremap <F5> :packadd termdebug<cr>:Termdebug<space>
nnoremap <F6> :Break<cr>
nnoremap <F7> :Over<cr>
nnoremap <F8> :Step<cr>

" term console
func! Tapi_EditFile(bufnum,arglist)
	execute ":wincmd p"
	execute ":edit " . a:arglist[0]
	if len(a:arglist)>1
		call term_sendkeys(a:bufnum,a:arglist[1]."\<cr>")
	endif
endfunc
tnoremap <c-\> <c-\><c-n>
tnoremap <c-o> printf '\033]51;["call","Tapi_EditFile",["%s/%s"]]\007' $PWD<space>
tnoremap <c-l> printf '\033]51;["call","Tapi_EditFile",["%s/%s","exit"]]\007' $PWD<space>
nnoremap <Leader><Leader>T :bo term ++rows=6<CR>
nnoremap <Leader><Leader>t :vert term<CR>
nnoremap <silent><space><space>t :tabe<cr>:execute ":vert term ++curwin ++close " <cr>

" lazygit
nnoremap <silent><space>g :tabe<cr>:vert term ++curwin ++close lazygit<cr>

" yank and paste
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>P "0P
vnoremap <Leader>P "0P

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

" change window location
nnoremap <c-s-up> <c-w>K
nnoremap <c-s-down> <c-w>J
nnoremap <c-s-left> <c-w>H
nnoremap <c-s-right> <c-w>L

" quick fix
nnoremap [q :cnext<cr>
nnoremap ]q :cprevious<cr>
nnoremap \q :cclose<cr>
nnoremap =q :copen<cr>

" set mouse
func s:MouseConfig()
	set mouse=a
	set mousemodel=popup_setpos
	" you can define menu self
	" visual model
	vnoremenu PopUp.Yank\ Text "+y
	vnoremenu PopUp.Cut\ Text "+d
	vnoremenu PopUp.Del\ Text "_d
	" normal model
	nnoremenu PopUp.Paste\ Text "+p
	nnoremenu PopUp.Select\ All ggVG
	nnoremenu PopUp.Back\ Pos <c-o>zz<cr>
	nnoremenu PopUp.Next\ Pos <c-i>zz<cr>
	nnoremenu PopUp.Back\ Buf :bp<cr>
	nnoremenu PopUp.Next\ Buf :bn<cr>
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
nnoremap <silent><nowait>=s :set spell<cr>
nnoremap <silent><nowait>\s :set nospell<cr>
" z= is list of change

" delete <space> in end of line
nnoremap <silent><nowait>d<space> :%s/ *$//g<cr>:noh<cr><c-o>

" run macro in visual model
vnoremap @ :normal @

" termtask project config
command! -nargs=1 TaskRun :call termtask#Term_task_run(<f-args>)
command! -nargs=0 TaskList :call termtask#Term_task_list()
nnoremap <space>c :TaskRun<space>
nnoremap <silent><space>C :call termtask#Term_config_edit()<cr>
" auto read project file
" let s:fileway=term#Term_get_dir() . '/.config.vim'
" if filereadable(s:fileway)
" 	execute 'source ' . s:fileway
" endif

" use select area to replace
vnoremap s :<c-u>execute "normal! gv\"sy"<cr>:%s/<c-r>=@s<cr>/
nnoremap <leader>s :%s/<c-r><c-w>/

" indent buffer
nnoremap <silent><nowait> =e gg=G<c-o><c-o>zz
onoremap ae :<c-u>normal! ggVG<cr>
nnoremap <leader>e ggVG

" sudo to write file
cnoremap w!! w !sudo tee % >/dev/null

" set cursor middle
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz

" set split window
nnoremap <silent><nowait>_ :vsp<cr>:bn<cr>
nnoremap <silent><nowait>+ :sp<cr>:bn<cr>

" edit file
nnoremap e :edit<space>

" reset wrong enter
inoremap <c-b> <c-[>vbe<right>di

" change } pos
nnoremap L $i<c-m><esc>k$

" add empty line
nnoremap H O<c-[>j
nnoremap M o<c-[>k

" scroll in other window
nnoremap <s-up> <c-w>p<c-u><c-w>p
nnoremap <s-down> <c-w>p<c-d><c-w>p

" ctrl file
command! Delete if filereadable(expand('%'))|call delete(expand('%'))|execute ":bd"|execute ":bn"|endif
command! -nargs=1 -bang -complete=file Rename let @s=expand('%')|f <args>|w<bang>|call delete(@s)
cab Rename Rename <c-r>=expand('%:p:h')<cr>/
" use cd to change dir

" select move
vnoremap <silent><up>   : move '<-2<cr>gv
vnoremap <silent><down> : move '>+1<cr>gv

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
	autocmd BufNewFile *.cpp,*.cc,*.go,*.py,*.sh,*.hpp,*.h,.config.vim,CMakeLists.txt execute ":call VimFastSetPreCode()"
augroup END

" airline
let g:airline_theme= "tokyonight"
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tabline' , 'coc']
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
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
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ CheckBackspace() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" coc find define
nmap <leader>u <Plug>(coc-definition)
nmap <leader>U <Plug>(coc-type-definition)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gD <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gi <Plug>(coc-implementation)
nmap <leader>qf <Plug>(coc-fix-current)
" coc refactor code
nmap <space>r <Plug>(coc-refactor)
nmap <leader>r <Plug>(coc-rename)
" coc find wrong
nmap <silent><F3> <Plug>(coc-diagnostic-prev)
nmap <silent><F4> <Plug>(coc-diagnostic-next)
nmap <silent>[w <Plug>(coc-diagnostic-prev)
nmap <silent>]w <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait> =w :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>w :<C-u>CocList diagnostics<cr>
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
" coc format
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 Import :call CocActionAsync('runCommand', 'editor.action.organizeImport')
nmap <leader><leader>f :Format<cr>
" coc config
nmap <silent><nowait> <space><space>c :CocConfig<cr>
nmap <silent><nowait> <space><space>l :CocList extensions<cr>
" coc help
nnoremap <silent> K :call ShowDocumentation()<cr>
" coc mouse
nmap <c-LeftMouse> <LeftMouse><Plug>(coc-definition)
nmap <c-RightMouse> <LeftMouse>:call ShowDocumentation()<cr>

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" tagbar
let g:tagbar_width = 22
nnoremap <silent> <leader>t :TagbarToggle<cr>

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" vim-easymotion
let g:EasyMotion_smartcase = 1
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

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
" let g:go_highlight_fields = 1
" let g:go_highlight_array_whitespace_error = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1

" dashboard
" let g:slash_auto_middle=0
nnoremap <space>S :SessionSave<cr>
nnoremap <space>s :SessionLoad<cr>

" leaderF
" find file
nnoremap <space>f :LeaderfFile<cr>
" recent file
nnoremap <space>F :LeaderfMru<cr>
" fund buffer
nnoremap <leader>b :LeaderfBuffer<cr>
nnoremap <space>b :LeaderfBuffer<cr>
" function list
nnoremap <space>t :LeaderfFunction<cr>
nnoremap <space>T :LeaderfFunctionAll<cr>
" find for help
nnoremap <space>h :LeaderfHelp<cr>
nnoremap <space>H :Leaderf help --input key:<cr>
vnoremap <space>h :<c-u>execute ":Leaderf help --input " . <sid>GetSelectArea()<cr>
" enhance cmd
nnoremap <space>: :LeaderfCommand<cr>
" enhance find
nnoremap <space>/ :LeaderfLine<cr>
vnoremap <space>/ :<c-u>execute ":Leaderf line --input " . <sid>GetSelectArea()<cr>
nnoremap <space>? :LeaderfLineAll<cr>
vnoremap <space>? :<c-u>execute ":Leaderf line --all --input " . <sid>GetSelectArea()<cr>
" find key word
nnoremap <space>a :Leaderf rg -i<cr>
vnoremap <space>a :<c-u>execute ":Leaderf rg -i " . <sid>GetSelectArea()<cr>
nnoremap <space>A :Leaderf rg -i --cword<cr>
" recall
nnoremap <space>l :Leaderf --recall<cr>
" find color
nnoremap <F1> :LeaderfColorscheme<cr>
" set leaderf work dir
nnoremap <silent><nowait>=l :let g:Lf_WorkingDirectoryMode = 'ac'<cr>
nnoremap <silent><nowait>\l :let g:Lf_WorkingDirectoryMode = 'c'<cr>
" set leaderf options
" let g:Lf_WorkingDirectoryMode = 'ac'
let g:Lf_WindowPosition = 'popup'
let g:Lf_StlSeparator = { 'left': '', 'right': ''}
let g:Lf_PreviewInPopup = 1
let g:Lf_CommandMap = {'<C-J>':['<C-J>','<C-N>'],'<C-K>':['<C-P>','<C-K>'],'<C-P>':['<C-L>']}
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
			\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\}
let g:Lf_UseCache = 0
" c-] open in vertical,c-x open in split,c-t open in a tab,c-\ ask for open,D to delete buffer

" tabular
nnoremap <leader>T :Tab /
vnoremap <leader>T :Tab /

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" gv
nnoremap <leader>g :GV<cr>
nnoremap <leader>G :GV!<cr>
nnoremap <leader>gg :GV?<cr>

" clever f
" nnoremap \ ,
" map \ <Plug>(clever-f-repeat-back)
map <silent><nowait> ; <Plug>(clever-f-repeat-forward)

" asyncrun
let g:asyncrun_open = 6
let g:asyncrun_bell = 0
nmap <space>; :AsyncRun<space>
" asyncrun ack
nnoremap <leader>A :AsyncRun ack -i<space>

" wildfire config
nmap - <Plug>(wildfire-fuel)
vmap - <Plug>(wildfire-fuel)
nmap <backspace> <Plug>(wildfire-water)
vmap <backspace> <Plug>(wildfire-water)
nmap <leader>- <Plug>(wildfire-quick-select)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "i`", "ip"]
