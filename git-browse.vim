echom "YOOOOOOOOOO"
" open a single line on github using git-browse
function! GitBrowseFile()
  let _line = line('v')
  let _file = expand('%')
  exec "Git browse -r "._line." "._file
endf

" open a range of lines on github using git-browse
function! RangeGitBrowseFile() range
  let _file = expand('%')
  let _range="-r".a:firstline.",".a:lastline
  exec "Git browse "._range." ".f
endf

nnoremap <leader>B :call GitBrowseFile()<CR>
vnoremap <leader>B :call RangeGitBrowseFile()<CR>

