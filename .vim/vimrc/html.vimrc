augroup vimrc-filetype
  " .htmlはインデント2
  autocmd BufNewFile,BufRead *.ctp set filetype=html
  autocmd FileType html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END

