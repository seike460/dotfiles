""""""""""""""""""""""""""""""""""""
" PHP
""""""""""""""""""""""""""""""""""""

" highlight
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
" php dict
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
autocmd BufNewFile,BufRead *.ctp set filetype=ctp

" php indent
augroup vimrc-filetype
  autocmd!
  " .php -> indent 4
  autocmd BufNewFile,BufRead *.php set filetype=php
  autocmd FileType php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
  " .ctp -> indent 2
  autocmd BufNewFile,BufRead *.ctp set filetype=ctp
  autocmd FileType ctp setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END

map <Leader>c <Plug>(operator-camelize)
map <Leader>C <Plug>(operator-decamelize)

function! s:generateCtags()
  let s:options = '~/.git/.ctags' "ctagsの設定ファイルへのパス
  let s:command = [
    \'ctags',
    \'-f',
    \'~/.git/.ctags', "tagsファイルへのパス
  \]
  let s:command += s:options
  call job_start(s:command)
endfunction
nnoremap <silent> <Leader>gt :<C-u>call <SID>generateCtags()<CR>
