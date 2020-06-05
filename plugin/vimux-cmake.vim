command! CMakeBuild :call CMakeBuild()
command! CMakeInstall :call CMakeInstall()
command! CMakeBuildInstall :call CMakeBuildInstall()

function! ShellCommandSeperator()
  if empty(matchstr($SHELL, 'fish'))
    return '&&'
  else
    return '; and'
  endif
endfunction

let s:separator = ShellCommandSeperator()

function! CMakeBuild()
  call VimuxRunCommand("clear " . s:separator . " cmake  --build build ")
endfunction

function! CMakeInstall()
  call VimuxRunCommand("clear " . s:separator . " cmake  --install build ")
endfunction

function! CMakeBuildInstall()
  call VimuxRunCommand("clear " . s:separator . " cmake  --build build " . s:separator . " cmake  --install build ")
endfunction
