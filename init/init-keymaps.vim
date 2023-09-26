"======================================================================
"
" init-keymaps.vim - 按键设置，按你喜欢更改
"
"   - 快速移动
"   - 标签切换
"   - 窗口切换
"   - 终端支持
"   - 编译运行
"   - 符号搜索
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 17:59:31
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
" 与snipts快捷键冲突
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" <leader>+数字键 切换tab
"----------------------------------------------------------------------
noremap <silent><leader>1 1gt<cr>
noremap <silent><leader>2 2gt<cr>
noremap <silent><leader>3 3gt<cr>
noremap <silent><leader>4 4gt<cr>
noremap <silent><leader>5 5gt<cr>
noremap <silent><leader>6 6gt<cr>
noremap <silent><leader>7 7gt<cr>
noremap <silent><leader>8 8gt<cr>
noremap <silent><leader>9 9gt<cr>
noremap <silent><leader>0 10gt<cr>


"----------------------------------------------------------------------
" ALT+N 切换 tab
"----------------------------------------------------------------------
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>


" MacVim 允许 CMD+数字键快速切换标签
if has("gui_macvim")
	set macmeta
	noremap <silent><d-1> :tabn 1<cr>
	noremap <silent><d-2> :tabn 2<cr>
	noremap <silent><d-3> :tabn 3<cr>
	noremap <silent><d-4> :tabn 4<cr>
	noremap <silent><d-5> :tabn 5<cr>
	noremap <silent><d-6> :tabn 6<cr>
	noremap <silent><d-7> :tabn 7<cr>
	noremap <silent><d-8> :tabn 8<cr>
	noremap <silent><d-9> :tabn 9<cr>
	noremap <silent><d-0> :tabn 10<cr>
	inoremap <silent><d-1> <ESC>:tabn 1<cr>
	inoremap <silent><d-2> <ESC>:tabn 2<cr>
	inoremap <silent><d-3> <ESC>:tabn 3<cr>
	inoremap <silent><d-4> <ESC>:tabn 4<cr>
	inoremap <silent><d-5> <ESC>:tabn 5<cr>
	inoremap <silent><d-6> <ESC>:tabn 6<cr>
	inoremap <silent><d-7> <ESC>:tabn 7<cr>
	inoremap <silent><d-8> <ESC>:tabn 8<cr>
	inoremap <silent><d-9> <ESC>:tabn 9<cr>
	inoremap <silent><d-0> <ESC>:tabn 10<cr>
endif



"----------------------------------------------------------------------
" 缓存：插件 unimpaired 中定义了 [b, ]b 来切换缓存
"----------------------------------------------------------------------
noremap <silent> <leader>bn :bn<cr>
noremap <silent> <leader>bp :bp<cr>


"----------------------------------------------------------------------
" TAB：创建，关闭，上一个，下一个，左移，右移
" 其实还可以用原生的 CTRL+PageUp, CTRL+PageDown 来切换标签
"----------------------------------------------------------------------

"noremap <silent> <leader>tc :tabnew<cr>
"noremap <silent> <leader>tq :tabclose<cr>
"noremap <silent> <leader>to :tabonly<cr>
noremap <silent> <A-h> :tabnext<cr>
noremap <silent> <A-l> :tabprev<cr>
noremap <silent> <A-c> :tabclose<cr>
" Tabs
nnoremap <silent> g1 :<C-u>tabfirst<CR>
nnoremap <silent> g5 :<C-u>tabprevious<CR>
nnoremap <silent> g9 :<C-u>tablast<CR>
"nnoremap <silent> <C-Tab> :<C-U>tabnext<CR>
"nnoremap <silent> <C-S-Tab> :<C-U>tabprevious<CR>
nnoremap <silent> <A-{> :<C-u>tabnext<CR>
nnoremap <silent> <A-}> :<C-u>tabprevious<CR>
nnoremap <silent> <A-n> :<C-u>tabnew<CR>
nnoremap <silent> <A-o> :tabonly<cr>

noremap <silent><tab>, :call Tab_MoveLeft()<cr>
noremap <silent><tab>. :call Tab_MoveRight()<cr>
" 左移 tab
function! Tab_MoveLeft()
	let l:tabnr = tabpagenr() - 2
	if l:tabnr >= 0
		exec 'tabmove '.l:tabnr
	endif
endfunc

" 右移 tab
function! Tab_MoveRight()
	let l:tabnr = tabpagenr() + 1
	if l:tabnr <= tabpagenr('$')
		exec 'tabmove '.l:tabnr
	endif
endfunc

noremap <silent><C-left> :call Tab_MoveLeft()<cr>
noremap <silent><C-right> :call Tab_MoveRight()<cr>


"----------------------------------------------------------------------
" ALT 键移动增强
"----------------------------------------------------------------------

" ALT+h/l 快速左右按单词移动（正常模式+插入模式）
" noremap <m-h> b
" noremap <m-l> w
inoremap <m-h> <c-left>
inoremap <m-l> <c-right>

" ALT+j/k 逻辑跳转下一行/上一行（按 wrap 逻辑换行进行跳转） 
" 目前多行编辑占用
" noremap <m-j> gj
" noremap <m-k> gk
inoremap <m-j> <c-\><c-o>gj
inoremap <m-k> <c-\><c-o>gk

" 命令模式下的相同快捷
cnoremap <m-h> <c-left>
cnoremap <m-l> <c-right>

" ALT+y 删除到行末
noremap <m-y> d$
inoremap <m-y> <c-\><c-o>d$


"----------------------------------------------------------------------
" 窗口切换：ALT+SHIFT+hjkl
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的
"----------------------------------------------------------------------
noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
inoremap <m-H> <esc><c-w>h
inoremap <m-L> <esc><c-w>l
inoremap <m-J> <esc><c-w>j
inoremap <m-K> <esc><c-w>k

" window management
noremap <tab>h <c-w>h
noremap <tab>j <c-w>j
noremap <tab>k <c-w>k
noremap <tab>l <c-w>l
noremap <tab>w <c-w>w
noremap <tab>c <c-w>c
noremap <tab>+ <c-w>+
noremap <tab>- <c-w>-
noremap <tab>, <c-w><
noremap <tab>. <c-w>>
noremap <tab>= <c-w>=
noremap <tab>s <c-w>s
noremap <tab>v <c-w>v
noremap <tab>o <c-w>o
noremap <tab>p <c-w>p
nnoremap <tab>v :vsplit<Space>
nnoremap <tab>s :split<Space>
nnoremap <tab><Cr> :e<Space>
nnoremap <tab><Space> :tabe<Space>
nnoremap <leader><Cr> :e!<Cr>
nnoremap <silent><Tab>n :tabnext<CR>
nnoremap <silent><Tab>p :tabprevious<CR>
nnoremap <silent><Tab>m :tabm<Space>
nnoremap <tab><cr> <C-w>T
nnoremap <tab><Tab> <C-w>r

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
	" vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
	" 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
	" 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
	set termwinkey=<c-_>
	tnoremap <m-H> <c-_>h
	tnoremap <m-L> <c-_>l
	tnoremap <m-J> <c-_>j
	tnoremap <m-K> <c-_>k
	tnoremap <m-q> <c-\><c-n>
elseif has('nvim')
	" neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
	tnoremap <m-H> <c-\><c-n><c-w>h
	tnoremap <m-L> <c-\><c-n><c-w>l
	tnoremap <m-J> <c-\><c-n><c-w>j
	tnoremap <m-K> <c-\><c-n><c-w>k
	tnoremap <m-q> <c-\><c-n>
endif



"----------------------------------------------------------------------
" 编译运行 C/C++ 项目
" 详细见：http://www.skywind.me/blog/archives/2084
"----------------------------------------------------------------------

" 自动打开 quickfix window ，高度为 6
" let g:asyncrun_open = 6

" 任务结束时候响铃提醒
" let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
" nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" F9 编译 C/C++ 文件
" nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" F5 运行文件
" nnoremap <silent> <F5> :call ExecuteFile()<cr>

" F7 编译项目
" nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>

" F8 运行项目
" nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

" F6 测试项目
" nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>

" 更新 cmake
" nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>

" Windows 下支持直接打开新 cmd 窗口运行
" if has('win32') || has('win64')
" 	nnoremap <silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>
" endif


"----------------------------------------------------------------------
" F5 运行当前文件：根据文件类型判断方法，并且输出到 quickfix 窗口
"----------------------------------------------------------------------
function! ExecuteFile()
	let cmd = ''
	if index(['c', 'cpp', 'rs', 'go'], &ft) >= 0
		" native 语言，把当前文件名去掉扩展名后作为可执行运行
		" 写全路径名是因为后面 -cwd=? 会改变运行时的当前路径，所以写全路径
		" 加双引号是为了避免路径中包含空格
		let cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
	elseif &ft == 'python'
		let $PYTHONUNBUFFERED=1 " 关闭 python 缓存，实时看到输出
		let cmd = 'python "$(VIM_FILEPATH)"'
	elseif &ft == 'javascript'
		let cmd = 'node "$(VIM_FILEPATH)"'
	elseif &ft == 'perl'
		let cmd = 'perl "$(VIM_FILEPATH)"'
	elseif &ft == 'ruby'
		let cmd = 'ruby "$(VIM_FILEPATH)"'
	elseif &ft == 'php'
		let cmd = 'php "$(VIM_FILEPATH)"'
	elseif &ft == 'lua'
		let cmd = 'lua "$(VIM_FILEPATH)"'
	elseif &ft == 'zsh'
		let cmd = 'zsh "$(VIM_FILEPATH)"'
	elseif &ft == 'ps1'
		let cmd = 'powershell -file "$(VIM_FILEPATH)"'
	elseif &ft == 'vbs'
		let cmd = 'cscript -nologo "$(VIM_FILEPATH)"'
	elseif &ft == 'sh'
		let cmd = 'bash "$(VIM_FILEPATH)"'
	else
		return
	endif
	" Windows 下打开新的窗口 (-mode=4) 运行程序，其他系统在 quickfix 运行
	" -raw: 输出内容直接显示到 quickfix window 不匹配 errorformat
	" -save=2: 保存所有改动过的文件
	" -cwd=$(VIM_FILEDIR): 运行初始化目录为文件所在目录
	if has('win32') || has('win64')
		exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=4 '. cmd
	else
		exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=0 '. cmd
	endif
endfunc



"----------------------------------------------------------------------
" F2 在项目目录下 Grep 光标下单词，默认 C/C++/Py/Js ，扩展名自己扩充
" 支持 rg/grep/findstr ，其他类型可以自己扩充
" 不是在当前目录 grep，而是会去到当前文件所属的项目目录 project root
" 下面进行 grep，这样能方便的对相关项目进行搜索
"----------------------------------------------------------------------
if executable('rg')
	noremap <silent><F2> :AsyncRun! -cwd=<root> rg -n --no-heading 
				\ --color never -g *.h -g *.c* -g *.py -g *.js -g *.vim 
				\ <C-R><C-W> "<root>" <cr>
elseif has('win32') || has('win64')
	noremap <silent><F2> :AsyncRun! -cwd=<root> findstr /n /s /C:"<C-R><C-W>" 
				\ "\%CD\%\*.h" "\%CD\%\*.c*" "\%CD\%\*.py" "\%CD\%\*.js"
				\ "\%CD\%\*.vim"
				\ <cr>
else
	noremap <silent><F2> :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W> 
				\ --include='*.h' --include='*.c*' --include='*.py' 
				\ --include='*.js' --include='*.vim'
				\ '<root>' <cr>
endif


"----------------------------------------------------------------------
"basic map
"----------------------------------------------------------------------
let g:mapleader=" "
" noremap ; :
noremap H ^
noremap L $
noremap * *zz
noremap # #zz
inoremap jj <esc>
"nnoremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
"映射<c-g>为lazygit
" nnoremap <c-g> :tab term lazygit<CR>
"映射<Esc>退出terminal
tnoremap <leader><esc> <C-\><C-n>:bd!<CR>
" 语法高亮后取消高亮
noremap <BackSpace> :noh<CR>
" 全选当前文档
noremap <leader>a ggvG$

" 系统剪切板复制粘贴，vim使用系统剪切板需要vim支持
" 查询可以通过 vim --version | grep clipboard 查看
" 如果显示 +clipboard 就是支持， 如果是 -clipboard 就是不支持
" ubuntu 可以直接安装 gui 包提供支持: sudo apt install vim-gtk
" normal 模式下复制到系统剪切板， 这里没有 "+yy 这样只能复制一行

noremap <leader>gcc :set commentstring=//\ %s<cr>

nnoremap ! :!
nmap <Leader><Leader> V
vmap <Leader><Leader> <Esc>
nmap <leader>m %

" Toggle fold
nnoremap <CR> za
" Focus the current fold by closing all others
nnoremap <S-Return> zMzvzt

nnoremap Y y$
" Duplicate lines
nnoremap <Leader>d m`YP`
vnoremap <Leader>d YPgv`

nnoremap <Leader>cn *``cgn
nnoremap <Leader>cN *``cgN

" Change selected word in a repeatable manner
vnoremap <expr> <Leader>cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> <Leader>cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"

" Duplicate paragraph
nnoremap <Leader>cp yap<S-}>p

" Easier line-wise movement
nnoremap gh g^
nnoremap gl g$

" Scroll step sideways
nnoremap zl z4l
nnoremap zh z4h


" Start new line from any cursor position in insert-mode
inoremap <S-Return> <C-o>o

" Deletes selection and start insert mode
" vnoremap <BS> "_xi

" Re-select blocks after indenting in visual/select mode
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting in visual/select mode
" 按下tabale按键和shift table按键缩进
xnoremap <Tab> >gv|
xnoremap <S-Tab> <gv

" Indent and jump to first non-blank character linewise
nmap >>  >>_
nmap <<  <<_

" Drag current line/s vertically and auto-indent
nnoremap <Leader>k :m-2<CR>==
nnoremap <Leader>j :m+<CR>==
vnoremap <Leader>k :m'<-2<CR>gv=gv
vnoremap <Leader>j :m'>+<CR>gv=gv

"----------------------------------------------------------------------
"  设置window
"----------------------------------------------------------------------

" Window-control prefix
nnoremap  [Window]   <Nop>
nmap      s [Window]
" sv是当前页面新打开一个上下布局的窗口
nnoremap <silent> [Window]v  :<C-u>split<CR>
" sg是当前页面新打开一个左右布局的窗口
nnoremap <silent> [Window]g  :<C-u>vsplit<CR>
" st是新建一个标签页
nnoremap <silent> [Window]t  :tabnew<CR>
" so是只保存当前窗口
nnoremap <silent> [Window]o  :<C-u>only<CR>
" sb是最近打开的窗口进行切换
nnoremap <silent> [Window]b  :b#<CR>
" sc关闭当前窗口
nnoremap <silent> [Window]c  :close<CR>
" sx一个空白的窗口
nnoremap <silent> [Window]x  :<C-u>call <SID>window_empty_buffer()<CR>
" sz是最大化当前窗口哦
nnoremap <silent> [Window]z  :<C-u>call <SID>zoom()<CR>

" 移动当前窗口到最 上、下、左、右
noremap <silent> sK <C-W>K
noremap <silent> sJ <C-W>J
noremap <silent> sH <C-W>H
noremap <silent> sL <C-W>L
" 光标进入 上、下、左、右 的窗口
noremap <silent> sk <C-W>k
noremap <silent> sj <C-W>j
noremap <silent> sh <C-W>h
noremap <silent> sl <C-W>l
noremap <silent> sn :tabnext<CR>

function! s:toggle_background()
	if ! exists('g:colors_name')
		echomsg 'No colorscheme set'
		return
	endif
	let l:scheme = g:colors_name

	if l:scheme =~# 'dark' || l:scheme =~# 'light'
		" Rotate between different theme backgrounds
		execute 'colorscheme' (l:scheme =~# 'dark'
					\ ? substitute(l:scheme, 'dark', 'light', '')
					\ : substitute(l:scheme, 'light', 'dark', ''))
	else
		execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')
		if ! exists('g:colors_name')
			execute 'colorscheme' l:scheme
			echomsg 'The colorscheme `'.l:scheme
				\ .'` doesn''t have background variants!'
		else
			echo 'Set colorscheme to '.&background.' mode'
		endif
	endif
endfunction

function! s:toggle_contrast(delta)
	let l:scheme = ''
	if g:colors_name =~# 'solarized8'
		let l:schemes = map(['_low', '_flat', '', '_high'],
			\ '"solarized8_".(&background).v:val')
		let l:contrast = ((a:delta + index(l:schemes, g:colors_name)) % 4 + 4) % 4
		let l:scheme = l:schemes[l:contrast]
	endif
	if l:scheme !=# ''
		execute 'colorscheme' l:scheme
	endif
endfunction

function! s:window_empty_buffer()
	let l:current = bufnr('%')
	if ! getbufvar(l:current, '&modified')
		enew
		silent! execute 'bdelete '.l:current
	endif
endfunction

" Simple zoom toggle
function! s:zoom()
	if exists('t:zoomed')
		unlet t:zoomed
		wincmd =
	else
		let t:zoomed = { 'nr': bufnr('%') }
		vertical resize
		resize
		normal! ze
	endif
endfunction


"----------------------------------------------------------------------
" 主要实现左右两个屏幕写东西，左边是参考，右边是实际写的内容
" 通过右边窗口操作左边窗口的移动
"----------------------------------------------------------------------
noremap <m-u> <c-w>p<c-u><c-w>p
noremap <m-d> <c-w>p<c-d><c-w>p
inoremap <m-u> <esc><c-w>p<c-u><c-w>p
inoremap <m-d> <esc><c-w>p<c-d><c-w>p

noremap tx :r !figlet

" find and replace
noremap \s :%s//g<left><left>
" 折行显示
noremap <LEADER>sw :set wrap<CR>

"设置（自动补全）功能
" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {<CR>}<ESC>o
" inoremap { {}<ESC>i
" inoremap < <><ESC>i
"跳出补全的）和“号
" func SkipPair()
" 		if getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '}' || getline('.')[col('.') - 1] == '>' || getline('.')[col('.') - 1] == "'"
" 		    return "\<ESC>la"
" 		else
" 				return "\t"
" 		endif
" endfunc
" inoremap kk <c-r>=SkipPair()<CR>

inoremap <M-x> <Del>
inoremap <M-X> <BS>
" switch 2 words
" ----------------------
xnoremap <M-V> <C-c>`.``gvp``P
noremap <leader>cf :Dox<cr>
noremap <leader>0 "0p
vmap <leader>yy :!/mnt/c/Windows/System32/clip.exe <cr>u
" noremap <leader>pp :read !/mnt/c/Windows/System32/paste.exe <cr>i<bs><esc>l
" noremap! <leader>pp <esc>:read !/mnt/c/Windows/System32/paste.exe <cr>i<bs><esc>l
noremap <leader>4 :s/\(\w.*\)/data[10] = "\1";<left><left><left><left><left><left><left>
" 设置代码80个字符限制竖线
function ToggleTextWidth()
	if &colorcolumn == ""
		highlight ColorColumn ctermbg=green guibg=green
		set colorcolumn=80
	else
		set colorcolumn=""
	endif
endfunction
nnoremap <F8> :call ToggleTextWidth()<CR>

"----------------------------------------------------------------------
" c/c++  a.vim keymaps
"----------------------------------------------------------------------
nnoremap <leader>aa :A<cr>
nnoremap <leader>av :AV<cr>
nnoremap <leader>as :AS<cr>
nnoremap <leader>at :AT<cr>

