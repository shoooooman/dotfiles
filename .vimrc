""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.vim/bundle/dein')

if &compatible
	set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/bundle/dein/dein.vim

call dein#begin(s:dein_dir)

call dein#add('altercation/vim-colors-solarized')
"----------------------------------------------------------
"" solarizedの設定
"----------------------------------------------------------
colorscheme solarized " カラースキームにsolarizedを設定する
syntax enable " 構文に色をつける

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" ファイルオープンを便利に
call dein#add('Shougo/unite.vim')
" Unite.vimで最近使ったファイルを表示できるようにする
" call dein#add('Shougo/neomru.vim')

" powerline
call dein#add('Lokaltog/vim-powerline')
let g:Powerline_symbols = 'fancy'

" 補完機能
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
	  call dein#add('roxma/nvim-yarp')
	  call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#add('Shougo/neco-vim')
call dein#add('Shougo/neco-syntax')
call dein#add('ujihisa/neco-look')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
" Clang snippet
" call dein#add('Shougo/deoplete-clangx')

"next completion by tab
inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
"close popup and delete backword char
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
"dicision by Enter
inoremap <expr><CR> pumvisible() ? "\<C-y>": "\<CR>"

let g:deoplete#enable_at_startup = 1

" ファイルをtree表示してくれる
call dein#add('scrooloose/nerdtree')
" NERDTreeToggleをCtrl+eで開く
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" コメントON/OFFを手軽に実行
call dein#add('tomtom/tcomment_vim')
" 括弧を自動補完
call dein#add('cohama/lexima.vim')

" 末尾の全角スペースと半角スペースを可視化
call dein#add('bronson/vim-trailing-whitespace')

" arduino syntax highlight
call dein#add('sudar/vim-arduino-syntax')

call dein#end()
call dein#save_state()

" Required:
filetype plugin indent on
""""""""""""""""""""""""""""""

set fileencoding=utf-8
scriptencoding utf-8
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
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

" powerline vim_powerlineではない方
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
"
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
