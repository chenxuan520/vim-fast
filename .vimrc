"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"chenxuan的个人Vim配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=1          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set noshowmode			 " 设置不打开底部insert
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set noexpandtab			 " 设置禁止空格替换tab,tab党
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
" set smartcase			" 搜索智能匹配大小写

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macvim设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let system = system('uname -s')
    if system == "Darwin\n"
        set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h14 " 设置字体
    else
        set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 14      " 设置字体
    endif
    set guioptions-=m           " 隐藏菜单栏
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L           " 隐藏左侧滚动条
    set guioptions-=r           " 隐藏右侧滚动条
    set guioptions-=b           " 隐藏底部滚动条
    set showtabline=0           " 隐藏Tab栏
    set guicursor=n-v-c:ver5    " 设置光标为竖线
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 卸载默认插件UnPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <c-p> :bp<cr>
nnoremap <silent> <c-n> :bn<cr>
nnoremap <silent> <leader>d :bd<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" begin vim 
Plug 'chxuan/vimplus-startify'
Plug 'chxuan/prepare-code'
" function list
Plug 'preservim/tagbar'
" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" find anything
Plug 'Yggdroot/LeaderF'
" find key in file
Plug 'mileszs/ack.vim'
" quick move mouse
Plug 'easymotion/vim-easymotion'
" enhance the /
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/vim-slash'
" pair auto
Plug 'jiangmiao/auto-pairs'
" file tree left
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
" easy align
Plug 'godlygeek/tabular'
" change surround quick
Plug 'tpope/vim-surround'
" quick add comment
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
" for cpp highlight(temp no use)
Plug 'octol/vim-cpp-enhanced-highlight', {'for':'cpp'}
" line of bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" file devicon
Plug 'ryanoasis/vim-devicons'
" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" test obj (temp no use)
Plug 'kana/vim-textobj-user'
" funtion info inline
Plug 'Shougo/echodoc.vim'
" enhance c-f/b and c-d/u
Plug 'terryma/vim-smooth-scroll'
" enhance f
Plug 'rhysd/clever-f.vim'
" code snippets
Plug 'honza/vim-snippets'

call plug#end()  

" load vim default plugin
runtime macros/matchit.vim

" 重新加载vimrc文件
nnoremap <leader><leader>s :source $MYVIMRC<cr>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 插入模式下的光标移动
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <RIGHT>

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y
"将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" 主题设置
set background=dark
let g:onedark_termcolors=256
colorscheme onedark

" airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" prepare-code
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

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
nmap <leader>r <Plug>(coc-rename)
nmap <leader>u <Plug>(coc-definition)
nmap <leader>U <Plug>(coc-type-definition)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gt <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gi <Plug>(coc-implementation)
nmap <leader>ff <Plug>(coc-fix-current)
" coc find wrong
nmap <silent><F3> <Plug>(coc-diagnostic-prev)
nmap <silent><F4> <Plug>(coc-diagnostic-next)
nmap <silent><leader><leader>W <Plug>(coc-diagnostic-prev)
nmap <silent><leader><leader>w <Plug>(coc-diagnostic-next)
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
nmap <leader>l  <Plug>(coc-codelens-action)
xmap <silent><leader>s  <Plug>(coc-codeaction-selected)
" coc format
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 Import :call CocActionAsync('runCommand', 'editor.action.organizeImport')
nmap <leader><leader>f :Format<cr>
" coc config
nmap <silent><nowait> <space>c :CocConfig<cr>
nmap <silent><nowait> <space>l :CocList<cr>
" coc help
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" tagbar
let g:tagbar_width = 30
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

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

" leaderF
nnoremap <leader>F :LeaderfFile .<cr>
nnoremap <leader>b :LeaderfBuffer<cr>
nnoremap <space>f :LeaderfFile .<cr>
nnoremap <space>b :LeaderfBuffer<cr>
nnoremap <space>t :LeaderfFunction<cr>
nnoremap <space>a :Leaderf rg -i<cr>
nnoremap <space>: :LeaderfCommand<cr>
nnoremap <space>/ :LeaderfLine<cr>
nnoremap <F1> :LeaderfColorscheme<cr>
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

" ack
nnoremap <leader>A :Ack! -i<space>
nnoremap <leader>h :execute ":Ack! -i " . expand("<cword>")<cr>

" echodoc.vim
let g:echodoc_enable_at_startup = 1

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

" termdebug
let g:termdebug_wide=1
nnoremap <leader><leader>d :packadd termdebug<CR>:Termdebug<space>
nnoremap <F5> :packadd termdebug<CR>:Termdebug<space>
nnoremap <F6> :Break<cr>
nnoremap <F7> :Over<cr>
nnoremap <F8> :Step<cr>

" term console
nnoremap <Leader><Leader>T :term<CR>
nnoremap <Leader><Leader>t :vert term<CR>

" fast add comment
func SetComment()
	call append(line("."),'/***********************************************')
	call append(line(".")+1,'* Author: chenxuan-1607772321@qq.com')
	call append(line(".")+2,'* change time:'.strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+3,'* description:')
	call append(line(".")+4,'* example: ')
	call append(line(".")+5,'***********************************************/')
endfunc
nnoremap <Leader>c :call SetComment()<CR>

" yank and paste
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>P "0P
vnoremap <Leader>P "0P

" vimdiff merge
command! -nargs=0 Remote :diffg RE
command! -nargs=0 Base :diffg BA
command! -nargs=0 Local :diffg LO
