"======================================================================
"
" module.vim - 
"
" Created by skywind on 2021/12/25
" Last Modified: 2021/12/25 23:29:44
"
"======================================================================

" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" internal
"----------------------------------------------------------------------
let s:script_name = expand('<sfile>:p')
let s:script_home = fnamemodify(s:script_name, ':h')
let s:module_home = substitute(s:script_home . '/module', '\\', '/', 'g')
let s:module_list = []
let s:module_load = []


"----------------------------------------------------------------------
" inter-modules
"----------------------------------------------------------------------
let g:module_plugin = []
let s:module_loaded = {}


"----------------------------------------------------------------------
" load module
"----------------------------------------------------------------------
function! module#load(name)
	let name = a:name
	let script = s:module_home . '/' . name . '.vim'
	let entry = 'module#' . name . '#init'
	if !filereadable(script)
		echohl ErrorMsg
		echom 'ERROR: file not readable ' . script
		echohl None
		return -1
	endif
	exec 'source ' . fnameescape(script)
	if exists('*' . entry) == 0
		echohl ErrorMsg
		echom 'ERROR: entry missing ' . entry . '()'
		echohl None
		return -2
	endif
	call call(entry, [])
	let s:module_loaded[name] = 1
	return 0
endfunc


"----------------------------------------------------------------------
" ensure loaded
"----------------------------------------------------------------------
function! module#ensure(name)
	if get(s:module_loaded, a:name, 0) == 0
		call module#load(a:name)
	endif
endfunc


"----------------------------------------------------------------------
" check module existence
"----------------------------------------------------------------------
function! module#has(name)
	let name = a:name
	let script = s:module_home . '/' . name . '.vim'
	if !filereadable(script)
		return 0
	endif
	return 1
endfunc


"----------------------------------------------------------------------
" init module
"----------------------------------------------------------------------
function! module#init()
	let s:module_list = []
	let s:module_load = []
	if has('patch-7.4.1') == 0
		return -1
	endif
	let scripts = globpath(s:module_home, '*.vim', 1, 1)
	for name in scripts
		if filereadable(name)
			let name = fnamemodify(name, ':p:t:r')
			let s:module_list += [name]
		endif
	endfor
	if exists('g:module_load') == 0
		for name in s:module_list
			if name !~ '^__'
				let s:module_load += [name]
			endif
		endfor
	else
		let avail = {}
		for name in s:module_list
			let avail[name] = 1
		endfor
		for name in g:module_load
			if has_key(avail, name)
				let s:module_load += [name]
			else
				echohl ErrorMsg
				echom 'ERROR: Module missing: ' . name
				echohl None
			endif
		endfor
	endif
	command! -nargs=1 ModuleLoad call module#load(<f-args>)
	command! -nargs=1 ModuleEnsure call module#ensure(<f-args>)
	for name in s:module_load
		exec 'ModuleLoad ' . fnameescape(name)
	endfor
	let g:ModuleLoaded = 1
	return 0
endfunc



