fun! BadApple()
	let s:last_dir=expand("%:p:h")
	exec "cd ~/.vim/bad_apple"
	exec "tabe"
	exec "set nonumber"
	exec "set laststatus=0"
	exec "so badapple.vim"
	exec "q!"
	exec "cd ".s:last_dir
	exec "set number"
	exec "set laststatus=2"
endfun
com BadApple call BadApple()
