"""""""""""""""""""""""""""""""""""
" 基本設定
"""""""""""""""""""""""""""""""""""

"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" コマンドラインの補完
set wildmode=list:longest

"""""""""""""""""""""""""""""""""""
" インデント設定
"""""""""""""""""""""""""""""""""""

" インデントはスマートインデント
set smartindent
" オートインデント
set autoindent
" tabはスペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
set softtabstop=4

"""""""""""""""""""""""""""""""""""
" 検索設定
"""""""""""""""""""""""""""""""""""

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"""""""""""""""""""""""""""""""""""
" ステータスライン設定
"""""""""""""""""""""""""""""""""""

" ステータスラインにコマンドを表示
set showcmd
" ステータスラインを常に表示
set laststatus=2
" ファイルナンバー表示
set statusline=[%n]
" ファイル名表示
set statusline+=%<%F

" ここからツールバー右側
set statusline+=%=
" 変更のチェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ファイルフォーマット表示
set statusline+=[%{&fileformat}]
" 文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
" ファイルタイプ表示
set statusline+=%y
" 現在文字行/全体行表示
set statusline+=[L=%l/%L]
" 現在行が全体行の何%目か表示
set statusline+=[%p%%]
" 入力中のコマンドをステータスに表示する
set showcmd

"""""""""""""""""""""""""""""""""""
" ctags設定
"""""""""""""""""""""""""""""""""""
" ctags自動保存
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
set tags+=.git/tags
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-h :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-j :split<CR> :exe("tjump ".expand('<cword>'))<CR>
"""""""""""""""""""""""""""""""""""
" ctrlp設定
"""""""""""""""""""""""""""""""""""

" キャッシュディレクトリ
"let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" キャッシュを終了時に削除しない
"let g:ctrlp_clear_cache_on_exit = 0

" 遅延再描画
let g:ctrlp_lazy_update = 1
" ルートパスと認識させるためのファイル
let g:ctrlp_root_markers = ['Gemfile', 'pom.xml', 'build.xml']
" CtrlPのウィンドウ最大高さ
let g:ctrlp_max_height = 20
" 無視するディレクトリ
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|vendor)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
\ }

nnoremap <C-e> :NERDTree<CR>

if executable('ag')
    let g:ctrlp_use_caching=0
    let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

"""""""""""""""""""""""""""""""""""
" 個別設定読込
"""""""""""""""""""""""""""""""""""
for f in split(glob("~/.vim/vimrc/*.vimrc"), "\n")
    exe "source" f
endfor

"""""""""""""""""""""""""""""""""""
" 色設定
"""""""""""""""""""""""""""""""""""

" 色設定を有効にする
syntax enable
" カラースキーム
colorscheme molokai
" ダーク系のカラースキームを使う
set background=dark
" コメントはlightgreen
hi Comment ctermfg=lightgreen
" 選択肢の色
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=1
