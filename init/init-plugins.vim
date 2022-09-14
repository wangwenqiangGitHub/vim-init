"======================================================================
"
" init-plugins.vim - 
"
" Created by skywind on 2018/05/31
" Last Modified: 2018/06/10 23:11
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :



"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = ['basic', 'tags', 'enhanced', 'filetypes', 'textobj']
	let g:bundle_group += ['tags', 'airline', 'ale', 'echodoc']
	let g:bundle_group += ['leaderf']
	let g:bundle_group += ['coc', 'go']
	let g:bundle_group += ['ranger']
	let g:bundle_group += ['floaterm']
endif
" 已经不使用nerdtree插件
" 已经不使用defx插件'nerdtree', 'defx',
" tags去除gtags;使用；leaderf

"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))


"----------------------------------------------------------------------
" 默认插件 
"----------------------------------------------------------------------

"编译
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 20
let g:asynctasks_term_rows = 20    " set height for the horizontal terminal split
let g:asynctasks_term_cols = 80    " set width for vertical terminal split
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.hg']
" let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
" let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_pos = 'tab'
" let g:asynctasks_config_name = '.asynctask'
let g:asynctasks_config_name = '.git/tasks.ini'
let g:asynctask_template = '~/.vim/task_template.ini'
let g:asynctasks_extra_config = [
    \ '~/.vim/task_template.ini',
    \ ]
noremap <space>te :AsyncTaskEdit<cr>
noremap <space>tg :AsyncTaskEdit!<cr>
noremap <space>tfb :AsyncTask file-build<cr>
noremap <space>tfr :AsyncTask file-run<cr>
noremap <space>tfd :AsyncTask file-debug<cr>
noremap <silent><f6> :AsyncTask project-init<cr>
noremap <silent><f7> :AsyncTask project-build<cr>
" noremap <space>tpi :AsyncTask project-init<cr>
" noremap <space>tpb :AsyncTask project-build<cr>
noremap <space>tpr :AsyncTask project-run<cr>
noremap <space>tpd :AsyncTask project-debug<cr>

noremap <silent><f1> :AsyncRun scp build/ncs_4layer/ncs_4layer root@192.216.20.:/var/
noremap <silent><f2> :AsyncRun scp build/ncsrt_4layer/libncsrt_4layer.so root@192.216.20.:/var/
"自动补全
Plug 'wellle/tmux-complete.vim'

" 全文快速移动，<leader><leader>f{char} 即可触发
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_keys = 'fjdksweoavn'

" 文件浏览器，代替 netrw
Plug 'justinmk/vim-dirvish'

" 表格对齐，使用命令 Tabularize
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'
" let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
" let g:DoxygenToolkit_paramTag_pre="@Param "
" let g:DoxygenToolkit_returnTag="@Returns   "
" let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
" let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
" let g:DoxygenToolkit_authorName="Mathias Lorente"
" let g:DoxygenToolkit_licenseTag="My own license"   <-- !!! Does not end with "\<enter>"
" Doxygen注释格式生成
Plug 'babaybus/doxygentoolkit.vim'
let g:DoxygenToolkit_authorName="Wangwenqiang"

Plug 'liuchengxu/vista.vim'
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }
" 多光标
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
let g:VM_maps["Add Cursor Down"]    = '<m-j>'   " new cursor down
let g:VM_maps["Add Cursor Up"]      = '<m-k>'   " new cursor up

" markdown 如果有问题需要运行(失败运行几次) :call mkdp#util#install()
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
" Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
" Plug 'dkarter/bullets.vim'
" === Markdown Settings
" Snippets
source ~/.vim/vim-init/init/md-snippets.vim

" ===
" === vim-instant-markdown
" ===
" let g:instant_markdown_slow = 0
" let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
" let g:instant_markdown_autoscroll = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" let g:mkdp_path_to_chrome='/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome'
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次
let g:mkdp_auto_start = 0
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" 自动关闭预览窗口
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1,
			\ 'sequence_diagrams': {},
			\ 'flowchart_diagrams': {},
			\ 'content_editable': v:false,
			\ 'disable_filename': 0
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
"----------------------------------------------------------------------
" Dirvish 设置：自动排序并隐藏文件，同时定位到相关文件
" 这个排序函数可以将目录排在前面，文件排在后面，并且按照字母顺序排序
" 比默认的纯按照字母排序更友好点。
"----------------------------------------------------------------------
function! s:setup_dirvish()
	if &buftype != 'nofile' && &filetype != 'dirvish'
		return
	endif
	if has('nvim')
		return
	endif
	" 取得光标所在行的文本（当前选中的文件名）
	let text = getline('.')
	if ! get(g:, 'dirvish_hide_visible', 0)
		exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
	endif
	" 排序文件名
	exec 'sort ,^.*[\/],'
	let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
	" 定位到之前光标处的文件
	call search(name, 'wc')
	noremap <silent><buffer> ~ :Dirvish ~<cr>
	noremap <buffer> % :e %
endfunc

augroup MyPluginSetup
	autocmd!
	autocmd FileType dirvish call s:setup_dirvish()
augroup END


"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0

	" 展示开始画面，显示最近编辑过的文件
	Plug 'mhinz/vim-startify'

	" 一次性安装一大堆 colorscheme
	Plug 'flazz/vim-colorschemes'

	" 支持库，给其他插件用的函数库
	Plug 'xolox/vim-misc'

	" 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
	Plug 'kshenoy/vim-signature'

	" 用于在侧边符号栏显示 git/svn 的 diff
	Plug 'mhinz/vim-signify'

	" 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
	" 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
	Plug 'mh21/errormarker.vim'

	" 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
	Plug 't9md/vim-choosewin'

	" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
	Plug 'skywind3000/vim-preview'

	" Git 支持
	Plug 'tpope/vim-fugitive'

	" 快速编辑
	Plug 'tpope/vim-surround'

	" 使用 ALT+E 来选择窗口
	nmap <m-e> <Plug>(choosewin)

	" 默认不显示 startify
	let g:startify_disable_at_vimenter = 1
	let g:startify_session_dir = '~/.vim/session'

	" 使用 <space>ha 清除 errormarker 标注的错误
	noremap <silent><space>ha :RemoveErrorMarkers<cr>

	" signify 调优
	let g:signify_vcs_list = ['git', 'svn']
	let g:signify_sign_add               = '+'
	let g:signify_sign_delete            = '_'
	let g:signify_sign_delete_first_line = '‾'
	let g:signify_sign_change            = '~'
	let g:signify_sign_changedelete      = g:signify_sign_change

	" git 仓库使用 histogram 算法进行 diff
	let g:signify_vcs_cmds = {
			\ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
			\}
endif


"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

	" 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
	Plug 'terryma/vim-expand-region'

	" 快速文件搜索
	Plug 'junegunn/fzf'

	" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
	Plug 'asins/vim-dict'

	" 使用 :FlyGrep 命令进行实时 grep
	Plug 'wsdjeg/FlyGrep.vim'

	" 使用 :CtrlSF 命令进行模仿 sublime 的 grep
	Plug 'dyng/ctrlsf.vim'

	" 配对括号和引号自动补全
	Plug 'Raimondi/delimitMate'

	" 提供 gist 接口
	Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }
	
	" ALT_+/- 用于按分隔符扩大缩小 v 选区
	map <m-=> <Plug>(expand_region_expand)
	map <m--> <Plug>(expand_region_shrink)
endif


"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0

	" 提供 ctags/gtags 后台数据库自动更新功能
	" Plug 'ludovicchabant/vim-gutentags'

	" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
	" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
	" Plug 'skywind3000/gutentags_plus'

	" 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
	" let g:gutentags_project_root = ['.root ', '.svn', '.git', '.hg', '.project']
	" let g:gutentags_ctags_tagfile = '.tags'

	" 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
	" let g:gutentags_cache_dir = expand('~/.cache/tags')

	" 默认禁用自动生成
	" let g:gutentags_modules = [] 

	" 如果有 ctags 可执行就允许动态生成 ctags 文件
	" if executable('ctags')
	" 	let g:gutentags_modules += ['ctags']
	" endif

	" 如果有 gtags 可执行就允许动态生成 gtags 数据库
	" if executable('gtags') && executable('gtags-cscope')
	" 	let g:gutentags_modules += ['gtags_cscope']
	" endif

	" 设置 ctags 的参数
	" let g:gutentags_ctags_extra_args = []
	" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
	" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
	" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

	" 使用 universal-ctags 的话需要下面这行，请反注释
	" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

	" 禁止 gutentags 自动链接 gtags 数据库
	" let g:gutentags_auto_add_gtags_cscope = 0
	" 打开日志
	" let g:gutentags_define_advanced_commands = 1
endif


"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj') >= 0

	" 基础插件：提供让用户方便的自定义文本对象的接口
	Plug 'kana/vim-textobj-user'

	" indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
	Plug 'kana/vim-textobj-indent'

	" 语法文本对象：iy/ay 基于语法的文本对象
	Plug 'kana/vim-textobj-syntax'

	" 函数文本对象：if/af 支持 c/c++/vim/java
	Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

	" 参数文本对象：i,/a, 包括参数或者列表元素
	Plug 'sgur/vim-textobj-parameter'

	" 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
	Plug 'bps/vim-textobj-python', {'for': 'python'}

	" 提供 uri/url 的文本对象，iu/au 表示
	Plug 'jceb/vim-textobj-uri'
endif


"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0

	" powershell 脚本文件的语法高亮
	Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

	" lua 语法高亮增强
	Plug 'tbastos/vim-lua', { 'for': 'lua' }

	" C++ 语法高亮增强，支持 11/14/17 标准
	Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

	" 额外语法文件
	Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

	" python 语法文件增强
	Plug 'vim-python/python-syntax', { 'for': ['python'] }

	" rust 语法增强
	Plug 'rust-lang/rust.vim', { 'for': 'rust' }

	" vim org-mode 
	Plug 'jceb/vim-orgmode', { 'for': 'org' }
endif


"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_powerline_fonts = 0
	let g:airline_exclude_preview = 1
	let g:airline_section_b = '%n'
	let g:airline_theme='deus'
	let g:airline#extensions#branch#enabled = 0
	let g:airline#extensions#syntastic#enabled = 0
	let g:airline#extensions#fugitiveline#enabled = 0
	let g:airline#extensions#csv#enabled = 0
	let g:airline#extensions#vimagit#enabled = 0
endif


"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
if index(g:bundle_group, 'nerdtree') >= 0
	Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	let g:NERDTreeMinimalUI = 1
	let g:NERDTreeDirArrows = 1
	let g:NERDTreeHijackNetrw = 0
	noremap <space>nn :NERDTree<cr>
	noremap <space>no :NERDTreeFocus<cr>
	noremap <space>nm :NERDTreeMirror<cr>
	noremap <space>nt :NERDTreeToggle<cr>
endif

"----------------------------------------------------------------------
" defx
"----------------------------------------------------------------------
if index(g:bundle_group, 'defx') >= 0
	if has('nvim')
		Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/defx.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif

	let g:defx_icons_enable_syntax_highlight = 1
	" 开关快捷键,【-search=`expand('%:p')`】表示打开defx树后，光标自动放在当前buffer上
	nmap <silent>e :Defx  -search=`expand('%:p')` -toggle <cr>
	"打开vim自动打开defx
	func! ArgFunc() abort
		let s:arg = argv(0)
		if isdirectory(s:arg)
			return s:arg
		else
			return fnamemodify(s:arg, ':h')
		endif
	endfunc


endif
"----------------------------------------------------------------------
" LanguageTool 语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'grammer') >= 0
	Plug 'rhysd/vim-grammarous'
	noremap <space>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
	map <space>rr <Plug>(grammarous-open-info-window)
	map <space>rv <Plug>(grammarous-move-to-info-window)
	map <space>rs <Plug>(grammarous-reset)
	map <space>rx <Plug>(grammarous-close-info-window)
	map <space>rm <Plug>(grammarous-remove-error)
	map <space>rd <Plug>(grammarous-disable-rule)
	map <space>rn <Plug>(grammarous-move-to-next-error)
	map <space>rp <Plug>(grammarous-move-to-previous-error)
endif


"----------------------------------------------------------------------
" ale：动态语法检查
"----------------------------------------------------------------------
if index(g:bundle_group, 'ale') >= 0
	Plug 'w0rp/ale'

	" 设定延迟和提示信息
	let g:ale_completion_delay = 500
	let g:ale_echo_delay = 20
	let g:ale_lint_delay = 500
	let g:ale_echo_msg_format = '[%linter%] %code: %%s'

	" 设定检测的时机：normal 模式文字改变，或者离开 insert模式
	" 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
	let g:ale_lint_on_text_changed = 'normal'
	let g:ale_lint_on_insert_leave = 1

	" 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
	if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
		let g:ale_command_wrapper = 'nice -n5'
	endif

	" 允许 airline 集成
	let g:airline#extensions#ale#enabled = 1

	" 编辑不同文件类型需要的语法检查器
	let g:ale_linters = {
				\ 'c': ['gcc', 'cppcheck'], 
				\ 'cpp': ['gcc', 'cppcheck'], 
				\ 'python': ['flake8', 'pylint'], 
				\ 'lua': ['luac'], 
				\ 'go': ['go build', 'gofmt'],
				\ 'java': ['javac'],
				\ 'javascript': ['eslint'], 
				\ }


	" 获取 pylint, flake8 的配置文件，在 vim-init/tools/conf 下面
	function s:lintcfg(name)
		let conf = s:path('tools/conf/')
		let path1 = conf . a:name
		let path2 = expand('~/.vim/linter/'. a:name)
		if filereadable(path2)
			return path2
		endif
		return shellescape(filereadable(path2)? path2 : path1)
	endfunc

	" 设置 flake8/pylint 的参数
	let g:ale_python_flake8_options = '--conf='.s:lintcfg('flake8.conf')
	let g:ale_python_pylint_options = '--rcfile='.s:lintcfg('pylint.conf')
	let g:ale_python_pylint_options .= ' --disable=W'
	" let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
	" let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
	" let g:ale_c_cppcheck_options = ''
	" let g:ale_cpp_cppcheck_options = ''
	let g:ale_c_parse_compile_commands = 1
	let g:ale_cpp_parse_compile_commands = 1

	let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']

	" 如果没有 gcc 只有 clang 时（FreeBSD）
	if executable('gcc') == 0 && executable('clang')
		let g:ale_linters.c += ['clang']
		let g:ale_linters.cpp += ['clang']
	endif
endif


"----------------------------------------------------------------------
" echodoc：搭配 YCM/deoplete 在底部显示函数参数
"----------------------------------------------------------------------
if index(g:bundle_group, 'echodoc') >= 0
	Plug 'Shougo/echodoc.vim'
	set noshowmode
	let g:echodoc#enable_at_startup = 1
endif

let g:mapleader=" "
"----------------------------------------------------------------------
" LeaderF：CtrlP / FZF 的超级代替者，文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
if index(g:bundle_group, 'leaderf') >= 0
	" 如果 vim 支持 python 则启用  Leaderf
	if has('python') || has('python3')
		Plug 'Yggdroot/LeaderF'

		" CTRL+p 打开文件模糊匹配
		" let g:Lf_ShortcutF = '<m-p>'
		let g:Lf_ShortcutF = '<leader>ff'
		" 解决.gitignore中编写的文件自动过滤问题。
		map <leader>ff :Leaderf file --no-ignore<CR>

		" ALT+n 打开 buffer 模糊匹配
		" let g:Lf_ShortcutB = '<m-n>'

		" CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
		noremap <leader>fm :LeaderfMru<cr>

		" ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
		" noremap <m-p> :LeaderfFunction!<cr>
		noremap <leader>fo :LeaderfFunction!<cr>

		" ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
		" noremap <m-P> :LeaderfBufTag!<cr>

		" ALT+n 打开 buffer 列表进行模糊匹配
		" noremap <m-n> :LeaderfBuffer<cr>

		" ALT+m 全局 tags 模糊匹配
		" noremap <m-m> :LeaderfTag<cr>
		noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
		noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
		noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
		noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

		xnoremap <leader>fv :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
		noremap <leader>fc :<C-U>Leaderf! rg --recall<CR>
		" noremap <leader>fc :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
		" noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
		" noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
		" noremap <leader>fw :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
		" noremap <leader>fr :<C-U><C-R>=printf("Leaderf! rg -e")<CR><CR>
		noremap <leader>fe :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
		"整个工程搜索字段
		" noremap <m-b> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<cr><cr>
		" noremap <m-f> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<cr><cr>
		" noremap <leader>fr :<C-U><C-R>=printf("Leaderf! rg -e")<cr>
		" noremap <leader>fr :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<cr>
		noremap <leader>fr :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", "")<cr>
		"search word under cursor in *.h and *.cpp files.
		noremap <Leader>fw :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.{h,hpp,cpp,cc,c} ", expand("<cword>"))<cr><cr>

		" 最大历史文件保存 2048 个
		let g:Lf_MruMaxFiles = 2048

		" ui 定制
		let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

		" 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
		let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
		let g:Lf_WorkingDirectoryMode = 'a'
		"let g:Lf_WorkingDirectoryMode = 'Ac'
		let g:Lf_WindowHeight = 0.30
		let g:Lf_CacheDirectory = expand('~/.vim/cache')

		" 显示绝对路径
		let g:Lf_ShowRelativePath = 1
		" LeaderF 可以自己管理 gtags 数据库它不会在你的项目目录下生成任何额外的文件或目录。gtags 数据库文件存储在$HOME/.LfCache/gtags/%PATH%OF%YOUR%PROJECT/下面
		" %PATH%OF%YOUR%PROJECT 是把你项目路径中的 \ 或 / 替换成 %
		let g:Lf_GtagsAutoGenerate = 1

		" 隐藏帮助
		let g:Lf_HideHelp = 1

		"悬浮搜索窗口
		let g:Lf_WindowPosition = 'popup'

		" 模糊匹配忽略扩展名
		let g:Lf_WildIgnore = {
					\ 'dir': ['.svn','.git','.hg','build','.cache','Debug'],
					\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
					\ }

		" MRU 文件忽略扩展名
		let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
		let g:Lf_StlColorscheme = 'powerline'

		" 禁用 function/buftag 的预览功能，可以手动用 p 预览
		let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

		 " 不能识别文件的添加和删除
		let g:Lf_UseCache = 0
		let g:Lf_UseMemoryCache = 0

		" 使用 ESC 键可以直接退出 leaderf 的 normal 模式
		let g:Lf_NormalMap = {
				\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
				\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
				\ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
				\ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
				\ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
				\ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
				\ }

	else
		" 不支持 python ，使用 CtrlP 代替
		Plug 'ctrlpvim/ctrlp.vim'

		" 显示函数列表的扩展插件
		Plug 'tacahiroy/ctrlp-funky'

		" 忽略默认键位
		let g:ctrlp_map = ''

		" 模糊匹配忽略
		let g:ctrlp_custom_ignore = {
		  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
		  \ 'file': '\v\.(exe|so|dll|mp3|wav|sdf|suo|mht)$',
		  \ 'link': 'some_bad_symbolic_links',
		  \ }

		" 项目标志
		let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
		let g:ctrlp_working_path = 0

		" CTRL+p 打开文件模糊匹配
		noremap <c-p> :CtrlP<cr>

		" CTRL+n 打开最近访问过的文件的匹配
		noremap <c-n> :CtrlPMRUFiles<cr>

		" ALT+p 显示当前文件的函数列表
		noremap <m-p> :CtrlPFunky<cr>

		" ALT+n 匹配 buffer
		noremap <m-n> :CtrlPBuffer<cr>
	endif
endif

" 加快响应时间
set updatetime=100
"----------------------------------------------------------------------
" coc.nvim：实现vscode的补全功能
"----------------------------------------------------------------------
if index(g:bundle_group, 'coc') >= 0
	" Plug 'https://github.com/ycm-core/YouCompleteMe'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" 回车自动补全
	inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
	inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

	" Make <CR> to accept selected completion item or notify coc.nvim to format
	" <C-g>u breaks current undo, please make your own choice.
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	function! CheckBackspace() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.按住ctrl + a空格可以触发自动补全
"	if has('nvim')
"		inoremap <silent><expr> <c-space> coc#refresh()
"	else
		inoremap <silent><expr> <c-space> coc#refresh()
"	endif
	" 使用回车，自动补全后回车换行
	" 查看上一个或者下一个代码报错
	nmap <silent>[g <Plug>(coc-diagnostic-prev)
	nmap <silent>]g <Plug>(coc-diagnostic-next)
	" 查看函数是在哪里定义的
	nmap <silent>gd <Plug>(coc-definition)
	nmap <silent>gy <Plug>(coc-type-definition)
	" nmap <silent>gi <Plug>(coc-implementation)
	nmap <silent>gr <Plug>(coc-references)
	" 采用K显示文档
	nnoremap <silent>K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		elseif (coc#rpc#ready())
			call CocActionAsync('doHover')
		else
			execute '!' . &keywordprg . " " . expand('<cword>')
		endif
	endfunction
	" 光标放在某个词词上面语法会高亮
	autocmd CursorHold * silent call CocActionAsync('highlight')
	" 变量重命名
	nmap <leader>rn <Plug>(coc-rename)
	" Formatting selected code
	"xmap <leader>cf  <Plug>(coc-format-selected)
	"nmap <leader>cf  <Plug>(coc-format-selected)
	" coc-explorer设置
	nmap tt :CocCommand explorer<CR>

	let g:coc_global_extensions = [
				\ 'coc-vimlsp',
				\ 'coc-explorer',
				\ 'coc-yank',
				\ 'coc-clangd',
				\ 'coc-pyright',
				\ 'coc-snippets',
				\ 'coc-cmake']
	" coc-snippets
	imap <C-l> <Plug>(coc-snippets-expand)
	vmap <C-j> <Plug>(coc-snippets-select)
	let g:coc_snippet_next = '<c-j>'
	let g:coc_snippet_prev = '<c-k>'
	imap <C-j> <Plug>(coc-snippets-expand-jump)
endif
" \ 'coc-diagnostic',
" \ 'coc-go',
"----------------------------------------------------------------------
" vim-go：实现vim中go语言的补全功能
"----------------------------------------------------------------------
if index(g:bundle_group, 'go') >= 0
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'theniceboy/vim-snippets'
" Autoformat
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Plug 'jiangmiao/auto-pairs'
" in <space>cn to comment a line
" Plug 'tomtom/tcomment_vim'
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
endif
"----------------------------------------------------------------------
" ranger-explorer：实现vim中打开ranger的补全功能
"----------------------------------------------------------------------
if index(g:bundle_group, 'ranger') >= 0
Plug 'iberianpig/ranger-explorer.vim'

let g:ranger_explorer_keymap_edit    = '<C-o>'
let g:ranger_explorer_keymap_tabedit = '<C-t>'
let g:ranger_explorer_keymap_split   = '<C-s>'
let g:ranger_explorer_keymap_vsplit  = '<C-v>'
" nnoremap <silent><Leader>rf :RangerOpenCurrentFile<CR>
nnoremap <silent>rc :RangerOpenCurrentDir<CR>
nnoremap <silent>rp :RangerOpenProjectRootDir<CR>
endif

"----------------------------------------------------------------------
"floaterm：实现vim中打开一个浮动窗口可以配合lazygit fzf命令行工具
"----------------------------------------------------------------------
if index(g:bundle_group, 'floaterm') >= 0
Plug 'voldikss/vim-floaterm'

let g:floaterm_keymap_toggle = '<C-f>t'
let g:floaterm_keymap_next   = '<C-f>n'
let g:floaterm_keymap_prev   = '<C-f>p'
let g:floaterm_keymap_new    = '<C-f>o'
let g:floaterm_keymap_kill   = '<leader>q'
nnoremap <silent> <C-t>g :FloatermNew --height=0.8 --width=0.8 --position=center lazygit<CR>
" Floaterm
"let g:floaterm_gitcommit='floaterm'
"let g:floaterm_autoinsert=1
"let g:floaterm_width=0.8
"let g:floaterm_height=0.8
"let g:floaterm_wintitle=0
"let g:floaterm_autoclose=1

"let g:which_key_map.t = {
"      \ 'name' : '+terminal',
"      \ ';' : [':FloatermNew --wintype=popup --height=6',                 'terminal'],
"      \ 'f' : [':FloatermNew fzf',                                        'fzf'],
"      \ 'g' : [':FloatermNew lazygit',                                    'git'],
"      \ 'd' : [':FloatermNew lazydocker',                                 'docker'],
"      \ 'n' : [':FloatermNew node',                                       'node'],
"      \ 'p' : [':FloatermNew python',                                     'python'],
"      \ 'j' : [':FloatermNew julia',                                      'julia'],
"      \ 'r' : [':FloatermNew ranger',                                     'ranger'],
"      \ 't' : [':FloatermToggle',                                         'toggle'],
"      \ 'y' : [':FloatermNew ytop',                                       'ytop'],
"      \ 'J' : [':FloatermNew --wintype=popup --height=6 jupyter-console', 'jupyter console'],
"      \ }
endif
"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()

"----------------------------------------------------------------------
" YouCompleteMe 默认设置：YCM 需要你另外手动编译安装
"----------------------------------------------------------------------
" 禁用预览功能：扰乱视听
" let g:ycm_global_ycm_extra_conf = '~/ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0

" 禁用诊断功能：我们用前面更好用的 ALE 代替
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone,noselect

" noremap <c-z> <NOP>

" 两个字符自动触发语义补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }


"----------------------------------------------------------------------
" Ycm 白名单（非名单内文件不启用 YCM），避免打开个 1MB 的 txt 分析半天
"----------------------------------------------------------------------
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "objcpp":1,
			\ "python":1,
			\ "java":1,
			\ "javascript":1,
			\ "coffee":1,
			\ "vim":1, 
			\ "go":1,
			\ "cs":1,
			\ "lua":1,
			\ "perl":1,
			\ "perl6":1,
			\ "php":1,
			\ "ruby":1,
			\ "rust":1,
			\ "erlang":1,
			\ "asm":1,
			\ "nasm":1,
			\ "masm":1,
			\ "tasm":1,
			\ "asm68k":1,
			\ "asmh8300":1,
			\ "asciidoc":1,
			\ "basic":1,
			\ "vb":1,
			\ "make":1,
			\ "cmake":1,
			\ "html":1,
			\ "css":1,
			\ "less":1,
			\ "json":1,
			\ "cson":1,
			\ "typedscript":1,
			\ "haskell":1,
			\ "lhaskell":1,
			\ "lisp":1,
			\ "scheme":1,
			\ "sdl":1,
			\ "sh":1,
			\ "zsh":1,
			\ "bash":1,
			\ "man":1,
			\ "markdown":1,
			\ "matlab":1,
			\ "maxima":1,
			\ "dosini":1,
			\ "conf":1,
			\ "config":1,
			\ "zimbu":1,
			\ "ps1":1,
			\ }
