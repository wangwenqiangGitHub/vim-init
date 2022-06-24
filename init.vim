"======================================================================
"
" init.vim - initialize config
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 18:26:34
"
"======================================================================

" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 IncScript exec 'so '.s:home.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.s:home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim


"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 加载基础配置
IncScript init/init-basic.vim

" 设定 tabsize
IncScript init/init-tabsize.vim

" 界面样式
IncScript init/init-style.vim

" 自定义按键
IncScript init/init-keymaps.vim

" 注释
IncScript init/misc.vim


" 插件加载
IncScript init/init-plugins.vim
" 加载扩展配置
IncScript init/init-config.vim

" au FileType c,cpp setlocal commentstring=//\ %s
