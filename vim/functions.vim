
" ----- Get Running OS Name --------- "

function! GetRunningOS()

	if has("win32")
		return "win"
  	endif
	
	let os = substitute(system('uname'), '\n', '', '')
		
   	if os == "Darwin"
		return "mac"
	endif 

	return "linux"
endfunction
