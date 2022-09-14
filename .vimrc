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
set cmdheight=1          " set command height
set showcmd              " show select line nums in visual
set ruler                " cursor position displayed
set laststatus=2         " show status
set number               " show line number
set cursorline           " highlight current line
set whichwrap+=<,>,h,l   " set the cursor key across rows
set ttimeoutlen=0        " set <ESC> response time
set virtualedit=block,onemore   " allows the cursor appear after last character
set noshowmode			 " disenable bottom mode displayed 'insert'
set hidden               " allows toggle buffers in unsaved
" set mouse=a              " set mouse enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" code indent and typesetting config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " set auto indent
set cindent              " set indent by c/cpp
set cinoptions=g0,:0,N-s,(0    " set c/cpp indent way
set smartindent          " smart choose indent way
filetype indent on       " intelligent indent for different languages
set noexpandtab			 " set forbidden space to replace tab
set tabstop=4            " number of spaces used by tabs when editing
set shiftwidth=4         " number of spaces tab occupies when formatting
set softtabstop=4        " set 4 spaces as tabs
set smarttab             " use tabs at the beginning of lines and segments
set nowrap               " disable devide a line to two
set backspace=2          " use enter key to normally handle input, eol, start, etc
set sidescroll=10        " sets the number of characters to scroll to the right
set nofoldenable         " disables folding code

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
set smartcase			" search smart match case

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cache config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " set no back up
set noswapfile          " disable create temp file
set autoread            " if file change by others,load it auto
set autowrite           " set auto save
set confirm             " if quit without save,make comfirm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encode config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8 " set langmenu encode utf-8
set helplang=cn          " set helplang chinese
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
" uninstall plug function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug list 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" begin vim 
Plug 'chenxuan520/my-vim-dashboard'
Plug 'chxuan/prepare-code'
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
Plug 'junegunn/vim-slash'
" pair auto
Plug 'jiangmiao/auto-pairs'
" file tree left
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" easy align
Plug 'godlygeek/tabular'
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
" line of bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" file devicon
Plug 'ryanoasis/vim-devicons'
" Git control
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" text obj
Plug 'kana/vim-textobj-user'
" funtion info in statusline
Plug 'Shougo/echodoc.vim'
" enhance c-f/b and c-d/u
Plug 'terryma/vim-smooth-scroll'
" enhance f/t
Plug 'rhysd/clever-f.vim'
" code snippets
Plug 'honza/vim-snippets'
" project maneage
Plug 'skywind3000/asynctasks.vim'
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
nnoremap <silent> <leader>d :bd<cr>

" insert model to move cursor
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <RIGHT>

" yank to system
vmap <leader><leader>y "+y
" paste to system
nnoremap <leader><leader>p "+p
vnoremap <leader><leader>p "+p

" load the file last edit
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" termdebug
let g:termdebug_wide=1
nnoremap <leader><leader>d :packadd termdebug<CR>:Termdebug<space>
nnoremap <F5> :packadd termdebug<CR>:Termdebug<space>
nnoremap <F6> :Break<cr>
nnoremap <F7> :Over<cr>
nnoremap <F8> :Step<cr>

" term console
tnoremap <c-\> <c-\><c-n>
nnoremap <Leader><Leader>T :term<CR>
nnoremap <Leader><Leader>t :vert term<CR>

" fast add comment for cpp
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

" change window width
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>

" change window in normal
nnoremap <s-up> <c-w>k
nnoremap <s-down> <c-w>j
nnoremap <s-left> <c-w>h
nnoremap <s-right> <c-w>l

" quick fix
nnoremap [q :cnext<cr>
nnoremap ]q :cprevious<cr>
nnoremap \q :cclose<cr>

" set themes
set background=dark

" plug config setting

" tokyonight themes
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" onedark themes
" let g:onedark_termcolors=256
" colorscheme onedark

" airline
let g:airline_theme= "tokyonight"
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tabline', 'coc']
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
let g:NERDTreeWinSize=22
" exit vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

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
nmap <silent>gu <Plug>(coc-definition)
nmap <silent>gt <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gi <Plug>(coc-implementation)
nmap <leader>ff <Plug>(coc-fix-current)
" coc refactor code
nmap <space>r <Plug>(coc-refactor)
nmap <leader>r <Plug>(coc-rename)
" coc find wrong
nmap <silent><F3> <Plug>(coc-diagnostic-prev)
nmap <silent><F4> <Plug>(coc-diagnostic-next)
nmap <silent>[w <Plug>(coc-diagnostic-prev)
nmap <silent>]w <Plug>(coc-diagnostic-next)
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
nmap <silent><nowait> <space><space>c :CocConfig<cr>
nmap <silent><nowait> <space>l :CocList extensions<cr>
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
nnoremap <space>S :SessionSave<cr>
nnoremap <space>s :SessionLoad<cr>

" leaderF
" find file
nnoremap <leader>F :LeaderfFile .<cr>
nnoremap <space>f :LeaderfFile .<cr>
" recent file
nnoremap <space>F :LeaderfMru<cr>
" fund buffer
nnoremap <leader>b :LeaderfBuffer<cr>
nnoremap <space>b :LeaderfBuffer<cr>
" funtion list
nnoremap <space>t :LeaderfFunction<cr>
" enhance inside funtion
nnoremap <space>h :LeaderfHelp<cr>
nnoremap <space>: :LeaderfCommand<cr>
nnoremap <space>/ :LeaderfLine<cr>
" find key word
nnoremap <space>a :Leaderf rg -i<cr>
nnoremap <space>A :execute ":Leaderf rg -i " . expand("<cword>")<cr>
" find color
nnoremap <F1> :LeaderfColorscheme<cr>
let g:Lf_WindowPosition = 'popup'
let g:Lf_StlSeparator = { 'left': '', 'right': ''}
let g:Lf_PreviewInPopup = 1
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

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

" clever f
" nnoremap \ ,
" map \ <Plug>(clever-f-repeat-back)
map <silent><nowait> ; <Plug>(clever-f-repeat-forward)

" asyncrun
let g:asyncrun_open = 6
let g:asyncrun_bell = 0
nmap <silent><nowait> <space>c :AsyncTaskEdit<cr>
nmap <space>; :AsyncRun<space>
" asyncrun ack
nnoremap <leader>A :AsyncRun ack -i<space>
nnoremap <leader>H :execute ":AsyncRun ack -i " . expand("<cword>")<cr>
