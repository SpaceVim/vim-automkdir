if exists("g:loaded_automkdir_autoload")
  finish
endif
let g:loaded_automkdir_autoload = 1

let s:save_cpo = &cpo
set cpo&vim

fun! automkdir#CreateCurrent()
  call automkdir#CreateDirectory(expand('%:p:h'))
endf

fun! automkdir#CreateDirectory(dir)
  let d = a:dir

  " Skip files that have schemes
  if d =~ '^[a-z]\+:/'
    return
  endif

  if !isdirectory(d)
    call system('mkdir -p '.shellescape(d))
    if !g:automkdir_silent
        echom 'Created directory:' d
    endif
  end
endf


let &cpo = s:save_cpo
unlet s:save_cpo
