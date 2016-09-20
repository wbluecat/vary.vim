" vary.vim - A script to converting tabs to spaces and auto save
" with remove End of line in end of line

function! s:TVary_Warning_Msg(msg)
	echohl WarningMsg
	echomsg a:msg
	echohl None
endfunction

function RetabIndents()
"	let auto_striptab = exists('g:auto_striptab') ? g:auto_striptab : "python"
"	if empty(matchstr(auto_striptab, &ft))
"		return
"	endif


	if &expandtab
		silent! %s/\t/\=repeat(" ", &tabstop)/g
	else
		if &tabstop == 1
			silent! %s/\ \{1\}/\t/g
		endif
		if &tabstop == 2
			silent! %s/\ \{2\}/\t/g
		endif
		if &tabstop == 3
			silent! %s/\ \{3\}/\t/g
		endif
		if &tabstop == 4
			silent! %s/\ \{4\}/\t/g
		endif
		if &tabstop == 8
			silent! %s/\ \{8\}/\t/g
		endif
		if &tabstop == 16
			silent! %s/\ \{16\}/\t/g
		endif
	endif

endfunction

function StripTrailingWhite()
"	let auto_striptrail = exists('g:auto_striptrail') ? g:auto_striptrail : "python"
"	if empty(matchstr(auto_striptrail, &ft))
"		return
"	endif

	silent! %s/\s\+$//g

endfunction

function! s:TVary_Indents_StrpTrailingWhite()
	call StripTrailingWhite()
	call RetabIndents()
endfunction

" load vary.vim
if !exists('loaded_vary_vim')
	let loaded_vary_vim = 'no'
	command! -nargs=0 -bar TVaryVim call s:TVary_Indents_StrpTrailingWhite()
endif
