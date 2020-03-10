" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.vim/bundle/dein')
" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimがなければgithubから落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイルを用意しておく
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" Required:
filetype plugin indent on
""""""""""""""""""""""""""""""

set fileencoding=utf-8
scriptencoding utf-8
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する

syntax enable
" カラースキームにsolarizedを設定する
colorscheme solarized

" tabをspace4つ分にする
set tabstop=4
set expandtab
set shiftwidth=4

" clipboardと連携
set clipboard=unnamed,autoselect

" ペースト時の自動インデントを無効
if &term =~ "xterm"
	let &t_SI .= "\e[?2004h"
	let &t_EI .= "\e[?2004l"
	let &pastetoggle = "\e[201~"

	function XTermPasteBegin(ret)
		set paste
		return a:ret
	endfunction

	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" ビープ音を可視化
set visualbell

set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

set backspace=indent,eol,start " バックスペースで削除
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

set wildmenu " コマンドモードの補完

" 現在の行を強調表示
set cursorline
" 現在の列を強調表示
set cursorcolumn

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" 閉じタグを自動補完
augroup CloseXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype vue inoremap <buffer> </ </<C-x><C-o>
augroup END

" local環境ごとにvimrcを追加
" 聞いたときに大文字のY/N/Aで答えた場合のみ上記の動作をする
let g:localvimrc_persistent=1

" To prevent conceal in LaTeX files
let g:tex_conceal = ''
