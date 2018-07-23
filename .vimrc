" ======================================================================
" Vundle.vim
" ======================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" プラグイン管理
Plugin 'VundleVim/Vundle.vim'
"" vimでインタラクティブシェルを使う
Plugin 'jpalardy/vim-slime'
"" キーマップを早く
Plugin 'rhysd/accelerated-jk'
"" ファイルをツリー表示
Plugin 'scrooloose/nerdtree'
"" タブ状態を同期
Plugin 'jistr/vim-nerdtree-tabs'
"" ステータスラインのカスタマイズ
Plugin 'itchyny/lightline.vim'
"" Gitの差分表示
Plugin 'airblade/vim-gitgutter'
"" 非同期でLintツールを用いた文法チェック
"Plugin 'w0rp/ale'
"" 自動補完
Plugin 'Shougo/neocomplete.vim'
"" Python用の自動補完のためにjediをvimで使う
"Plugin 'davidhalter/jedi-vim'
"" virtualenv環境下での補完
"Plugin 'plytophogy/vim-virtualenv'
"" Haskell用の自動補完
"Plugin 'ujihisa/neco-ghc'
"" C++用の自動補完
"Plugin 'justmao945/vim-clang'


" colorscheme
Plugin 'cocopon/iceberg.vim'
Plugin 'tomasr/molokai'

call vundle#end()            " required
filetype plugin indent on    " required


" ======================================================================
" Plugin
" ======================================================================

"" --------------------
"" vim-slime
"" --------------------

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}
let g:slime_dont_ask_default = 1

" --------------------
" accelerated-jk
" --------------------

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" --------------------
" nerdtree
" --------------------

" キーマップ
"nnoremap <silent> tr :NERDTreeToggle<CR>
nnoremap <silent> tr :NERDTreeTabsToggle<CR>
" 横幅
let g:NERDTreeWinSize = 20
" 隠しファイルを表示する
let NERDTreeShowHidden = 1
" デフォルトでツリーを表示させる
"let g:nerdtree_tabs_open_on_console_startup=1
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"" --------------------
"" lightline.vim
"" --------------------

"" -- INSERT -- を消す
"set noshowmode
" lightlineのテーマ設定
let g:lightline = {
  \ 'colorscheme': 'molokai',
  \ }


"" --------------------
"" ale
"" --------------------
"
"" テキスト変更時のLintを無効化
"let g:ale_lint_on_text_changed = 0
"" テキストを開いた際のLintを無効化
"let g:ale_lint_on_enter = 0
"" ファイルを保存する時にチェックを実行
"let g:ale_lint_on_save = 1
"" インサートモードを終了する時にチェックを実行
"let g:ale_lint_on_insert_leave = 1
"
"" 別ウィンドウでエラー/警告一覧
"function! s:ale_list()
"  let g:ale_open_list = 1
"  call ale#Queue(0, 'lint_file')
"endfunction
"" キーマップ
"command! ALEList call s:ale_list()
"nnoremap <silent> li :ALEList<CR>
"
"autocmd FileType qf nnoremap <silent> <buffer> q :let g:ale_open_list = 0<CR>:q!<CR>
"autocmd FileType help,qf,man,ref let b:ale_enabled = 0
"
"" 特定のLintのみ有効化
"let g:ale_linters = {
"  \   'haskell': ['ghc-mod'],
"  \ }
"" 左端のシンボルカラムを表示したままにする
"let g:ale_sign_column_always = 1
"" lightlineに表示するフォーマット
"let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
"" エラーフォーマット
"let g:ale_echo_msg_format = '[%linter%] %s'
"" エラーをリスト表示
""let g:ale_open_list = 1
"" 常にlistを表示
""let g:ale_keep_list_window_open = 1
""" loclistで表示
""let g:ale_set_loclist = 0
""" quickfix listで表示
""let g:ale_set_quickfix = 1
"
"" --------------------
"" neocomplete.vim
"" --------------------

" 起動時に有効化
let g:neocomplete#enable_at_startup = 1
" smartcase（大文字が入力されるまで大文字小文字の区別を無視）を使用
let g:neocomplete#enable_smart_case = 1
" シンタックスをキャッシュするときの最小文字長
let g:neocomplete#sources#syntax#min_keyword_length = 3
" 補完を表示する最小の文字数
let g:neocomplete#auto_completion_start_length = 2

" dictionaryを定義
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist'
  \ }

" keywordを定義
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" プラグインkey-mappings
" <C-g>: 前回行われた補完をキャンセル
inoremap <expr><C-g>     neocomplete#undo_completion()
" <C-l>: 補完候補のなかから、共通する部分を補完
inoremap <expr><C-l>     neocomplete#complete_common_string()

" オススメkey-mappings
" <CR>: popupを閉じてindentを保存
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  " "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: 補完を行う
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: popupを閉じbackword charを削除
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" omni completionを有効化
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" heavy omni completionを有効化
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" ======================================================================
" Util 
" ======================================================================

" シンタックスを有効化
syntax enable
" オートインデント時にインデントする文字数
set shiftwidth=4
" TABを押した時にタブの代わりにスペースを入れる
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=4
" クリップボードを共有
set clipboard+=unnamed,autoselect
" バックスペースで各種消せるようにする
set backspace=indent,eol,start
" ハイライトをONに
set hlsearch
" Esc Esc でハイライトをOFFに
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
" 「/」「?」「*」「#」が押されたらハイライトをONにしてから「/」「?」「*」「#」
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#
" escをjjにマッピング
inoremap <silent> jj <ESC>
" マウスを有効化
set mouse=a
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 行番号を表示する
set number
" ウインドウタイトルを設定する
set title
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2
" タイプ途中のコマンドを画面最下行に表示
set showcmd
" 文章の折り返しをオフに
"set nowrap
" cursorlineの有効化
"set cursorline
" 構文アイテムを検索する桁数の最大値
set synmaxcol=200
" 不可視文字を表示
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" Leader を Space キーに
let mapleader = "\<Space>"

" tab settings
" The prefix key
nnoremap [Tag] <Nop>
nmap t [Tag]
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>

" ======================================================================
" Visual
" ======================================================================

if (has("termguicolors"))
  set termguicolors
endif

"colorscheme iceberg
colorscheme molokai
