if &compatible
    set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('altercation/vim-colors-solarized')
call dein#add('benekastah/neomake')
call dein#add('fatih/vim-go')
call dein#add('koron/codic-vim')
call dein#add('mattn/emmet-vim')
call dein#add('rking/ag.vim.git')
call dein#add('scrooloose/nerdtree')
call dein#add('stephpy/vim-php-cs-fixer')
call dein#add('tomasr/molokai')
call dein#add('zchee/deoplete-go')
call dein#add('kana/vim-operator-user')
call dein#add('tyru/operator-camelize.vim')
call dein#add('ctrlpvim/ctrlp.vim')

call dein#end()

let g:molokai_original = 1

map <C-n> :NERDTreeToggle<CR>
