if &compatible
    set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('altercation/vim-colors-solarized')
call dein#add('benekastah/neomake')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('fatih/vim-go')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('kana/vim-operator-user')
call dein#add('koron/codic-vim')
call dein#add('mattn/emmet-vim')
call dein#add('rking/ag.vim')
call dein#add('rking/ag.vim.git')
call dein#add('scrooloose/nerdtree')
call dein#add('simeji/winresizer')
call dein#add('soramugi/auto-ctags.vim')
call dein#add('stephpy/vim-php-cs-fixer')
call dein#add('tomasr/molokai')
call dein#add('tyru/operator-camelize.vim')
call dein#add('zchee/deoplete-go')
call dein#add('rhysd/github-complete.vim')
call dein#add('junegunn/vim-emoji')
call dein#add('lighttiger2505/gtags.vim')
call dein#add('jsfaint/gen_tags.vim')
call dein#end()

let g:molokai_original = 1

let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1

set completefunc=emoji#complete
