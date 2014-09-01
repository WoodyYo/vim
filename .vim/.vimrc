""""""""基本設定""""""""
let $4="~/.vimrc"
colorscheme desertEx
let glib_enable_deprecated = 1
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/slime/start-swank.lisp &'
let g:tagbar_left = 1
let g:tagbar_width = 25
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=25
filetype plugin indent on
filetype plugin on
set cursorline
"set cursorcolumn
set incsearch
set autowrite
set autoindent
set t_Co=256
set hls
set tabstop=4
set shiftwidth=4
set foldmethod=syntax
set foldlevel=100
set number
silent set statusline laststatus=2
let g:SuperTabDefaultCompletionType="<C-x><C-p>"
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
set statusline=%F\ \ \ %{VimBuddy()}%=%-10.(%l,%c%V%)\ %p%%\ %L
autocmd QuickFixCmdPost * exec "botrigh cwindow 6"
autocmd Filetype conque_term exec "botright 8"
autocmd! bufwritepost ~/.vimrc so ~/.vimrc 
autocmd Filetype help exec "set number"
"autocmd BufRead * call Mycolor()
"""""""""鍵映射""""""""""
autocmd Filetype lisp exec "map <buffer><F1> ,("
autocmd Filetype lisp exec "imap <buffer><F1> <C-O><F1>"
"Noh:
map <space> :noh<Cr>
"Viki

"Mark
map ,, \*
map mm \m
"NerdComent
map " <leader>c<space>j
"一鍵縮排
map <F2> :call MyIndent()<Cr>
imap <F2> <C-O><F2>
"一鍵編譯
map <silent><F9> <Esc>:w<Cr>:call Compile()<Cr><Cr><Cr>
imap <silent><F9> <Esc><F9>
"屏幕行
map <Up> gk
map <Down> gj
"多窗口移動
map <A-Left> :tabprevious<Cr>
map <A-Right> :tabnext<Cr>
map <C-Up> <C-W><Up>
map <C-Down> <C-W><Down>
map <C-Right> <C-W><Right>
map <C-Left> <C-W><Left>
"Window Size:
noremap + <C-W>+
noremap - <C-W>-
map < <C-W><
map > <C-W>>
"Tagbar:
map <F3> :TagbarToggle<Cr>
imap <F3> <Esc>:TagbarToggle<Cr>i
"NerdTree:
map <F4>  :NERDTreeToggle<Cr>
imap <F4> <C-O><F4>
"Fuzzyfinder:
map ff :FufFile<Cr>
ounmap ff
"Conque_term:
map '' :call Control_Bash()<Cr><Esc>A
"Bufferexplorer:
map <F5>  :call Explor_Buf()<Cr>
imap <F5> <C-O><F5>
"EditSameDir:
map ,e :e <C-R>=expand("%:p:h")."/"<Cr>
"Ctags:
cnoremap CC !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! SearchBash()
	for i in range(1, 100)
		if bufname(i) =~ "bash - [1-9]"
			return i
		endif
	endfor
	return -1
endfunc
fun! GoWin(num)
	while a:num != winnr() 
		exec "normal \<C-W>\<C-W>"
	endwhile
endfunc

fun! Control_Bash()
	let s:num = SearchBash()
	if s:num != -1
		exec "bwipeout ".s:num
	else
		exec "sp"
		exec "normal \<C-W>\<Down>"
		exec "ConqueTerm bash"
		exec "resize 7"
	endif
endfunc

fun! Explor_Buf()
	exec "BufExplorerHorizontalSplit"
	exec "resize 7"
endfunc
""""""""""""""""""""""
fun! MyIndent()
	let cur = line(".")
	normal G=gg
	exec cur
endfunc 
""""""""""""""""""""""
"CompileFunction:
"cpp
func! Compilecpp()
	if search("gtk/gtk.h") != 0
		set makeprg=g++\ %\ -o\ %<.out\ `pkg-config\ --cflags\ --libs\ gtk+-2.0`
	else 
		set makeprg=g++\ -lm\ %\ -o\ %<.out
	endif
endfunc
"ruby
"main func
autocmd Filetype qf let g:Failure=1
func! Compile()
	let g:Failure=0
	set efm&
	exec "cclose"
	if &filetype == "cpp" || &filetype == "c"
		exec "call Compilecpp()"
		exec "make"
		if (g:Failure==0)
			exec "r!konsole -e ./%<.out\ &"
		end
	elseif &filetype == "ruby"
		setlocal efm=%+GSyntax\ OK
		setlocal efm+=%+E%f:%l:efm\ parse\ error
		setlocal efm+=%A%f:%l:in\ %*[^:]:\ %m
		setlocal efm+=%A%f:%l:\ %m
		setlocal efm+=%-C%\tfrom\ %f:%l:%m
		setlocal efm+=%-Z%\tfrom\ %f:%l
		setlocal efm+=%-Z%p^
		setlocal efm+=%-G%.%#
		set makeprg=ruby\ %
		exec "make"
		if (g:Failure == 0)
			exec "!konsole -e ruby %:p"
		end
	elseif &filetype == "html"
		exec "!firefox % &"
	elseif &filetype == "viki"
		set makeprg=deplate\ -m\ utf8\ %
		exec "make"
		if(g:Failure == 0)
			exec "!firefox %<.html &"
		end
	endif
endfunc
